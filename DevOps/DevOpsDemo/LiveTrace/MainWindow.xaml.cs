using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Globalization;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;

namespace LiveTrace;

public partial class MainWindow : Window
{
    private const int MaxSamples = 600;
    private readonly ObservableCollection<TraceValue> _values = [];
    private readonly Dictionary<string, TraceValue> _valuesByName = new(StringComparer.OrdinalIgnoreCase);
    private readonly Dictionary<string, Queue<Sample>> _samples = new(StringComparer.OrdinalIgnoreCase);
    private Process? _watchProcess;
    private CancellationTokenSource? _watchCancellation;
    private string? _selectedVariable;

    public MainWindow()
    {
        InitializeComponent();
        ValuesGrid.ItemsSource = _values;
    }

    private async void ToggleButton_Click(object sender, RoutedEventArgs e)
    {
        if (_watchProcess is not null)
        {
            await StopTraceAsync();
            return;
        }

        var variables = VariablesTextBox.Text.Split(',', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries);
        if (variables.Length == 0 || string.IsNullOrWhiteSpace(TaskTextBox.Text) ||
            !int.TryParse(RefreshTextBox.Text, out var refresh) || refresh <= 0)
        {
            StatusTextBlock.Text = "Enter a task, one or more variables, and a positive refresh interval.";
            return;
        }

        try
        {
            ToggleButton.IsEnabled = false;
            StatusTextBlock.Text = "Connecting…";
            await RunCliAsync("plc", "connect", "--ip", PlcIpTextBox.Text.Trim());

            _watchCancellation = new CancellationTokenSource();
            _watchProcess = StartCli("var", "watch-start", .. variables, "--task", TaskTextBox.Text.Trim(),
                "--refresh", refresh.ToString(CultureInfo.InvariantCulture), "--follow");
            ToggleButton.Content = "Stop trace";
            StatusTextBlock.Text = $"Watching {variables.Length} variable(s).";
            _ = ReadWatchOutputAsync(_watchProcess, _watchCancellation.Token);
        }
        catch (Exception ex)
        {
            StatusTextBlock.Text = $"Could not start trace: {ex.Message}";
            await StopTraceAsync();
        }
        finally
        {
            ToggleButton.IsEnabled = true;
        }
    }

    private async Task ReadWatchOutputAsync(Process process, CancellationToken cancellationToken)
    {
        try
        {
            while (!cancellationToken.IsCancellationRequested && await process.StandardOutput.ReadLineAsync(cancellationToken) is { } line)
            {
                ProcessUpdate(line);
            }

            if (!cancellationToken.IsCancellationRequested)
                Dispatcher.Invoke(() => StatusTextBlock.Text = $"Trace stopped unexpectedly: {process.StandardError.ReadToEnd()}");
        }
        catch (OperationCanceledException) { }
        catch (Exception ex)
        {
            Dispatcher.Invoke(() => StatusTextBlock.Text = $"Trace error: {ex.Message}");
        }
    }

    private void ProcessUpdate(string line)
    {
        try
        {
            using var document = JsonDocument.Parse(line);
            foreach (var (name, value) in ReadVariables(document.RootElement))
            {
                Dispatcher.Invoke(() => AddValue(name, value));
            }
        }
        catch (JsonException)
        {
            // The CLI can emit informational text before its JSONL stream.
        }
    }

    private static IEnumerable<(string Name, string Value)> ReadVariables(JsonElement root)
    {
        if (!root.TryGetProperty("variables", out var variables))
            yield break;

        if (variables.ValueKind == JsonValueKind.Array)
        {
            foreach (var variable in variables.EnumerateArray())
            {
                if (variable.TryGetProperty("name", out var name) && variable.TryGetProperty("value", out var value))
                    yield return (name.GetString() ?? "unknown", value.ToString());
            }
        }
        else if (variables.ValueKind == JsonValueKind.Object)
        {
            foreach (var variable in variables.EnumerateObject())
                yield return (variable.Name, variable.Value.ToString());
        }
    }

    private void AddValue(string name, string value)
    {
        var timestamp = DateTime.Now;
        if (!_valuesByName.TryGetValue(name, out var traceValue))
        {
            traceValue = new TraceValue { Name = name };
            _valuesByName.Add(name, traceValue);
            _values.Add(traceValue);
        }

        traceValue.Value = value;
        traceValue.Updated = timestamp;
        ValuesGrid.Items.Refresh();

        if (double.TryParse(value, NumberStyles.Float, CultureInfo.InvariantCulture, out var numericValue))
        {
            if (!_samples.TryGetValue(name, out var points))
                _samples[name] = points = new Queue<Sample>();
            points.Enqueue(new Sample(timestamp, numericValue));
            while (points.Count > MaxSamples)
                points.Dequeue();
        }

        if (string.Equals(_selectedVariable, name, StringComparison.OrdinalIgnoreCase))
            DrawChart();
    }

    private async Task StopTraceAsync()
    {
        var process = Interlocked.Exchange(ref _watchProcess, null);
        _watchCancellation?.Cancel();
        _watchCancellation?.Dispose();
        _watchCancellation = null;
        if (process is not null)
        {
            if (!process.HasExited)
                process.Kill(entireProcessTree: true);
            process.Dispose();
        }

        try
        {
            await RunCliAsync("var", "watch-stop", "--task", TaskTextBox.Text.Trim());
        }
        catch (Exception ex)
        {
            StatusTextBlock.Text = $"Trace stopped, but cleanup failed: {ex.Message}";
        }

        ToggleButton.Content = "Start trace";
        StatusTextBlock.Text = "Ready";
    }

    private Process StartCli(params string[] arguments)
    {
        var startInfo = new ProcessStartInfo(CliPath())
        {
            WorkingDirectory = ProjectDirectory(),
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        AddSharedArguments(startInfo, arguments);
        var process = Process.Start(startInfo);
        return process ?? throw new InvalidOperationException("Could not start as-cli.exe.");
    }

    private async Task RunCliAsync(params string[] arguments)
    {
        using var process = StartCli(arguments);
        var output = await process.StandardOutput.ReadToEndAsync();
        var error = await process.StandardError.ReadToEndAsync();
        await process.WaitForExitAsync();
        if (process.ExitCode != 0)
            throw new InvalidOperationException(string.IsNullOrWhiteSpace(error) ? output : error);
    }

    private static void AddSharedArguments(ProcessStartInfo startInfo, IEnumerable<string> arguments)
    {
        foreach (var argument in arguments)
            startInfo.ArgumentList.Add(argument);
        startInfo.ArgumentList.Add("--project");
        startInfo.ArgumentList.Add(Path.Combine(ProjectDirectory(), "DevOpsDemo.apj"));
        startInfo.ArgumentList.Add("--format");
        startInfo.ArgumentList.Add("json");
    }

    private static string ProjectDirectory() => Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", ".."));
    private static string CliPath() => Path.Combine(ProjectDirectory(), "as-cli.exe");

    private void ValuesGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        _selectedVariable = (ValuesGrid.SelectedItem as TraceValue)?.Name;
        DrawChart();
    }

    private void ChartCanvas_SizeChanged(object sender, SizeChangedEventArgs e) => DrawChart();

    private void DrawChart()
    {
        ChartCanvas.Children.Clear();
        if (_selectedVariable is null || !_samples.TryGetValue(_selectedVariable, out var samples) || samples.Count < 2)
            return;

        var points = samples.ToArray();
        var min = points.Min(sample => sample.Value);
        var max = points.Max(sample => sample.Value);
        if (Math.Abs(max - min) < double.Epsilon) { min -= 1; max += 1; }
        var first = points[0].Timestamp;
        var duration = Math.Max((points[^1].Timestamp - first).TotalMilliseconds, 1);
        var width = Math.Max(ChartCanvas.ActualWidth - 16, 1);
        var height = Math.Max(ChartCanvas.ActualHeight - 16, 1);
        var line = new Polyline { Stroke = Brushes.LimeGreen, StrokeThickness = 2 };
        foreach (var sample in points)
        {
            var x = 8 + ((sample.Timestamp - first).TotalMilliseconds / duration * width);
            var y = 8 + ((max - sample.Value) / (max - min) * height);
            line.Points.Add(new Point(x, y));
        }
        ChartCanvas.Children.Add(line);
    }

    private async void Window_Closing(object? sender, System.ComponentModel.CancelEventArgs e) => await StopTraceAsync();

    private sealed class TraceValue
    {
        public string Name { get; init; } = "";
        public string Value { get; set; } = "";
        public DateTime Updated { get; set; }
    }

    private readonly record struct Sample(DateTime Timestamp, double Value);
}
