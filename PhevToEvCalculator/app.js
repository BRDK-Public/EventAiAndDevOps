(function () {
  'use strict';

  var STORAGE_KEY = 'phevToEvCalculator.inputs';
  var Calc = window.PhevEvCalc;
  var form = document.getElementById('calc-form');

  var money = new Intl.NumberFormat('da-DK', { style: 'currency', currency: 'DKK', maximumFractionDigits: 0 });
  var number1 = new Intl.NumberFormat('da-DK', { maximumFractionDigits: 1 });

  function loadSaved() {
    try {
      var saved = JSON.parse(localStorage.getItem(STORAGE_KEY) || '{}');
      return saved && typeof saved === 'object' ? saved : {};
    } catch (e) {
      return {};
    }
  }

  function save(values) {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(values));
    } catch (e) {
      /* storage unavailable – ignore */
    }
  }

  function fillForm(values) {
    Object.keys(Calc.DEFAULTS).forEach(function (key) {
      var el = form.elements[key];
      if (el) el.value = key in values ? values[key] : Calc.DEFAULTS[key];
    });
  }

  function readForm() {
    var values = {};
    Object.keys(Calc.DEFAULTS).forEach(function (key) {
      var el = form.elements[key];
      if (el) values[key] = el.value === '' ? NaN : Number(el.value);
    });
    return values;
  }

  function setText(id, text, cls) {
    var el = document.getElementById(id);
    el.textContent = text;
    el.className = cls || '';
  }

  function renderChart(rows) {
    var container = document.getElementById('chart');
    var W = 640, H = 300, pad = { l: 80, r: 20, t: 20, b: 40 };
    var all = [];
    rows.forEach(function (r) { all.push(r.keep, r.switch); });
    var min = Math.min(0, Math.min.apply(null, all));
    var max = Math.max.apply(null, all);
    if (max === min) max = min + 1;
    var n = rows.length - 1;
    var x = function (i) { return pad.l + (i / n) * (W - pad.l - pad.r); };
    var y = function (v) { return H - pad.b - ((v - min) / (max - min)) * (H - pad.t - pad.b); };

    var svgNS = 'http://www.w3.org/2000/svg';
    var svg = document.createElementNS(svgNS, 'svg');
    svg.setAttribute('viewBox', '0 0 ' + W + ' ' + H);
    svg.setAttribute('role', 'img');
    svg.setAttribute('aria-label', 'Cumulative cost of keeping the PHEV versus switching to an EV');

    function add(tag, attrs, text) {
      var el = document.createElementNS(svgNS, tag);
      Object.keys(attrs).forEach(function (k) { el.setAttribute(k, attrs[k]); });
      if (text !== undefined) el.textContent = text;
      svg.appendChild(el);
      return el;
    }

    for (var g = 0; g <= 4; g++) {
      var v = min + (g / 4) * (max - min);
      add('line', { x1: pad.l, x2: W - pad.r, y1: y(v), y2: y(v), class: 'grid' });
      add('text', { x: pad.l - 8, y: y(v) + 4, 'text-anchor': 'end', class: 'axis' }, money.format(v));
    }
    rows.forEach(function (r, i) {
      add('text', { x: x(i), y: H - pad.b + 18, 'text-anchor': 'middle', class: 'axis' }, String(r.year));
    });
    add('text', { x: (pad.l + W - pad.r) / 2, y: H - 4, 'text-anchor': 'middle', class: 'axis' }, 'Year');

    function line(key, cls) {
      var pts = rows.map(function (r, i) { return x(i) + ',' + y(r[key]); }).join(' ');
      add('polyline', { points: pts, class: 'line ' + cls });
      rows.forEach(function (r, i) {
        add('circle', { cx: x(i), cy: y(r[key]), r: 3, class: 'dot ' + cls });
      });
    }
    line('keep', 'keep');
    line('switch', 'switch');

    add('rect', { x: pad.l + 10, y: pad.t, width: 12, height: 12, class: 'keep-fill' });
    add('text', { x: pad.l + 28, y: pad.t + 10, class: 'legend' }, 'Keep PHEV');
    add('rect', { x: pad.l + 120, y: pad.t, width: 12, height: 12, class: 'switch-fill' });
    add('text', { x: pad.l + 138, y: pad.t + 10, class: 'legend' }, 'Switch to EV');

    container.replaceChildren(svg);
  }

  function renderTable(rows) {
    var tbody = document.querySelector('#year-table tbody');
    var frag = document.createDocumentFragment();
    rows.forEach(function (r) {
      var tr = document.createElement('tr');
      [
        String(r.year),
        r.year === 0 ? '–' : money.format(r.phevAnnual),
        r.year === 0 ? '–' : money.format(r.evAnnual),
        money.format(r.keep),
        money.format(r.switch),
        money.format(r.keep - r.switch)
      ].forEach(function (text) {
        var td = document.createElement('td');
        td.textContent = text;
        tr.appendChild(td);
      });
      frag.appendChild(tr);
    });
    tbody.replaceChildren(frag);
  }

  function render() {
    var values = readForm();
    var result = Calc.calculate(values);
    var errorsEl = document.getElementById('errors');
    var verdictEl = document.getElementById('verdict');

    if (!result.ok) {
      errorsEl.hidden = false;
      errorsEl.textContent = 'Please check your inputs: ' + result.errors.join('; ');
      return;
    }
    errorsEl.hidden = true;
    save(values);

    var texts = {
      good: '✅ Good investment – switching saves you ' + money.format(result.savings) + ' over ' + result.years + ' years.',
      bad: '❌ Not worth it – switching costs you ' + money.format(-result.savings) + ' more over ' + result.years + ' years.',
      borderline: '⚖️ Borderline – the difference over ' + result.years + ' years is only ' + money.format(result.savings) + '.'
    };
    verdictEl.textContent = texts[result.verdict];
    verdictEl.className = 'verdict ' + result.verdict;

    var sign = function (v) { return v >= 0 ? 'positive' : 'negative'; };
    setText('kpi-keep', money.format(result.keepTotal));
    setText('kpi-switch', money.format(result.switchTotal));
    setText('kpi-savings', money.format(result.savings), sign(result.savings));
    setText('kpi-annual', money.format(result.annualSavingsYear1), sign(result.annualSavingsYear1));
    setText('kpi-extra', money.format(result.extraInvestment));
    setText('kpi-cash', money.format(result.cashNeededToday));
    setText(
      'kpi-roi',
      result.roi === null
        ? 'n/a (no extra capital)'
        : number1.format(result.roi * 100) + ' % total' +
          (result.roi > -1
            ? ' (' + number1.format((Math.pow(1 + result.roi, 1 / result.years) - 1) * 100) + ' %/year)'
            : ''),
      result.roi === null ? '' : sign(result.roi)
    );
    setText(
      'kpi-breakeven',
      result.breakEvenYear === null
        ? 'Not within 30 years'
        : 'After ' + number1.format(result.breakEvenYear) + ' years'
    );

    renderChart(result.rows);
    renderTable(result.rows);
  }

  fillForm(loadSaved());
  form.addEventListener('input', render);
  document.getElementById('reset-btn').addEventListener('click', function () {
    try { localStorage.removeItem(STORAGE_KEY); } catch (e) { /* ignore */ }
    fillForm({});
    render();
  });
  render();
})();
