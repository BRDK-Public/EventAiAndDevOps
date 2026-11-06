'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const Calc = require('../calc.js');

const close = (actual, expected, tol = 1e-6) =>
  assert.ok(Math.abs(actual - expected) < tol, `expected ${actual} ≈ ${expected}`);

// Simple scenario that is easy to verify by hand.
const simple = {
  years: 2,
  annualKm: 10000,
  homeChargingShare: 100,
  homeElectricityPrice: 2,
  publicChargingPrice: 5,
  electricityPriceIncrease: 0,
  petrolPrice: 10,
  petrolPriceIncrease: 0,
  opportunityReturn: 0,
  phevValue: 100000,
  phevLoan: 0,
  phevElectricShare: 50,
  phevPetrolPer100: 6,
  phevKwhPer100: 20,
  phevInsurance: 5000,
  phevTax: 1000,
  phevService: 4000,
  phevDepreciation: 10,
  evPrice: 200000,
  evKwhPer100: 15,
  evInsurance: 5000,
  evTax: 1000,
  evService: 2000,
  evDepreciation: 10,
  chargerCost: 10000,
  subsidy: 0
};

test('blended electricity price weights home and public charging', () => {
  close(Calc.blendedElectricityPrice({ homeChargingShare: 75, homeElectricityPrice: 2, publicChargingPrice: 6 }), 3);
});

test('annual costs for PHEV and EV', () => {
  // PHEV: 5000 km * 0.2 kWh * 2 = 2000; 5000 km * 0.06 L * 10 = 3000; fixed 10000
  close(Calc.phevAnnualCost(simple, 1).total, 15000);
  // EV: 10000 km * 0.15 kWh * 2 = 3000; fixed 8000
  close(Calc.evAnnualCost(simple, 1).total, 11000);
});

test('price escalation applies from year 2', () => {
  const i = { ...simple, petrolPriceIncrease: 10 };
  close(Calc.phevAnnualCost(i, 1).energy, 5000);
  close(Calc.phevAnnualCost(i, 2).energy, 2000 + 3300);
});

test('total cost of ownership, savings and ROI over the period', () => {
  const r = Calc.calculate(simple);
  assert.equal(r.ok, true);
  // Keep: depreciation 100000 - 81000 = 19000 + running 30000
  close(r.keepTotal, 49000);
  // Switch: 210000 - 162000 = 48000 + running 22000
  close(r.switchTotal, 70000);
  close(r.savings, -21000);
  close(r.extraInvestment, 110000);
  close(r.roi, -21000 / 110000);
  assert.equal(r.verdict, 'bad');
  assert.equal(r.rows.length, 3);
});

test('break-even year is interpolated', () => {
  const i = { ...simple, years: 5, chargerCost: 0, evDepreciation: 10, phevDepreciation: 10, evPrice: 100000 };
  // Same depreciation and price -> only running costs differ; switch is cheaper from day 0
  const r = Calc.calculate(i);
  assert.equal(r.breakEvenYear, 0);
  assert.equal(r.verdict, 'good');

  const j = { ...i, chargerCost: 6000 };
  // Running saving 4000/year -> break even after 1.5 years
  close(Calc.calculate(j).breakEvenYear, 1.5);
});

test('break-even is null when switching never pays off', () => {
  const r = Calc.calculate({ ...simple, evService: 20000 });
  assert.equal(r.breakEvenYear, null);
});

test('opportunity cost (discounting) makes switching less attractive', () => {
  const base = Calc.calculate({ ...simple, years: 8 });
  const withReturn = Calc.calculate({ ...simple, years: 8, opportunityReturn: 5 });
  assert.ok(withReturn.savings < base.savings);
});

test('loan only affects cash needed today, not the comparison', () => {
  const a = Calc.calculate(simple);
  const b = Calc.calculate({ ...simple, phevLoan: 50000 });
  close(a.savings, b.savings);
  close(b.cashNeededToday - a.cashNeededToday, 50000);
});

test('no extra capital gives null ROI', () => {
  const r = Calc.calculate({ ...simple, evPrice: 90000, chargerCost: 0 });
  assert.equal(r.roi, null);
});

test('invalid input is rejected', () => {
  assert.equal(Calc.calculate({ annualKm: -1 }).ok, false);
  assert.equal(Calc.calculate({ years: 0 }).ok, false);
  assert.equal(Calc.calculate({ phevElectricShare: 120 }).ok, false);
  assert.equal(Calc.calculate({ petrolPrice: NaN }).ok, false);
});

test('defaults produce a valid result', () => {
  const r = Calc.calculate();
  assert.equal(r.ok, true);
  assert.equal(r.rows.length, Calc.DEFAULTS.years + 1);
});
