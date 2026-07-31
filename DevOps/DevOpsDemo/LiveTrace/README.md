# AS Live Trace

A small Windows desktop tool that graphs variables from a B&R PLC or ARsim by consuming the bundled `as-cli.exe` `var watch-start --follow` JSONL stream.

## Prerequisites

- Windows with .NET 8 SDK or the published application.
- B&R Automation Studio/PVI connectivity to the PLC or simulator.
- The `as-cli.exe` and `DevOpsDemo.apj` from this directory must remain alongside the `LiveTrace` folder.

## Run

From `DevOps/DevOpsDemo` in PowerShell:

```powershell
dotnet run --project .\LiveTrace\LiveTrace.csproj
```

Enter the PLC IP address, task, refresh interval, and comma-separated variable names, then select **Start trace**. Select a numeric row to graph it. The included `Main` task and `em.StateCurrent` are a suitable first trace.

The application connects with `as-cli plc connect`, starts one `var watch-start --follow` process, and stops its variables when tracing ends. It never writes PLC variables.
