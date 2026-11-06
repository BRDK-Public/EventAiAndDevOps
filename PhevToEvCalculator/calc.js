/*
 * PHEV -> EV investment calculator (pure logic, no DOM).
 *
 * Cost model (all amounts in the same currency, e.g. DKK):
 *  - Year 0 is "today". Annual running costs are paid at the end of each year.
 *  - "Keep PHEV" cost up to year t  = depreciation of the PHEV + running costs.
 *  - "Switch to EV" cost up to year t = EV price + one-off costs - subsidy
 *                                      - EV resale value at t + running costs.
 *    (The PHEV sale value is the same asset in both scenarios, so it is the
 *     baseline: keeping the PHEV "costs" its lost value, switching converts it
 *     to cash that is spent on the EV.)
 *  - Opportunity cost is modelled by discounting all cash flows with the
 *    expected investment return (present value). 0 % = no opportunity cost.
 *  - Remaining PHEV loan has to be settled in both scenarios and therefore
 *    does not change the comparison; it only affects the cash needed today.
 */
(function (root, factory) {
  if (typeof module === 'object' && module.exports) {
    module.exports = factory();
  } else {
    root.PhevEvCalc = factory();
  }
})(typeof self !== 'undefined' ? self : this, function () {
  'use strict';

  var DEFAULTS = {
    years: 6,
    annualKm: 18000,
    homeChargingShare: 80,
    homeElectricityPrice: 2.2,
    publicChargingPrice: 4.5,
    electricityPriceIncrease: 2,
    petrolPrice: 13.5,
    petrolPriceIncrease: 2,
    opportunityReturn: 0,

    phevValue: 180000,
    phevLoan: 0,
    phevElectricShare: 40,
    phevPetrolPer100: 6.5,
    phevKwhPer100: 20,
    phevInsurance: 7000,
    phevTax: 2500,
    phevService: 5000,
    phevDepreciation: 12,

    evPrice: 330000,
    evKwhPer100: 17,
    evInsurance: 7500,
    evTax: 1500,
    evService: 3000,
    evDepreciation: 12,
    chargerCost: 12000,
    subsidy: 0
  };

  var MAX_BREAK_EVEN_YEARS = 30;

  function pct(v) {
    return v / 100;
  }

  function blendedElectricityPrice(i) {
    var home = Math.min(Math.max(pct(i.homeChargingShare), 0), 1);
    return home * i.homeElectricityPrice + (1 - home) * i.publicChargingPrice;
  }

  function escalate(price, increasePct, year) {
    return price * Math.pow(1 + pct(increasePct), year - 1);
  }

  function residualValue(value, depreciationPct, year) {
    return value * Math.pow(1 - pct(depreciationPct), year);
  }

  function discount(amount, ratePct, year) {
    return amount / Math.pow(1 + pct(ratePct), year);
  }

  function phevAnnualCost(i, year) {
    var elecShare = Math.min(Math.max(pct(i.phevElectricShare), 0), 1);
    var elecPrice = escalate(blendedElectricityPrice(i), i.electricityPriceIncrease, year);
    var petrolPrice = escalate(i.petrolPrice, i.petrolPriceIncrease, year);
    var energy =
      i.annualKm * elecShare * (i.phevKwhPer100 / 100) * elecPrice +
      i.annualKm * (1 - elecShare) * (i.phevPetrolPer100 / 100) * petrolPrice;
    var fixed = i.phevInsurance + i.phevTax + i.phevService;
    return { energy: energy, fixed: fixed, total: energy + fixed };
  }

  function evAnnualCost(i, year) {
    var elecPrice = escalate(blendedElectricityPrice(i), i.electricityPriceIncrease, year);
    var energy = i.annualKm * (i.evKwhPer100 / 100) * elecPrice;
    var fixed = i.evInsurance + i.evTax + i.evService;
    return { energy: energy, fixed: fixed, total: energy + fixed };
  }

  function validate(i) {
    var errors = [];
    Object.keys(DEFAULTS).forEach(function (key) {
      if (typeof i[key] !== 'number' || !isFinite(i[key])) {
        errors.push(key + ' must be a number');
      } else if (i[key] < 0) {
        errors.push(key + ' must not be negative');
      }
    });
    if (errors.length === 0) {
      if (i.years < 1 || i.years > MAX_BREAK_EVEN_YEARS || Math.floor(i.years) !== i.years) {
        errors.push('years must be a whole number between 1 and ' + MAX_BREAK_EVEN_YEARS);
      }
      ['homeChargingShare', 'phevElectricShare', 'phevDepreciation', 'evDepreciation'].forEach(
        function (key) {
          if (i[key] > 100) errors.push(key + ' must be between 0 and 100');
        }
      );
    }
    return errors;
  }

  function calculate(input) {
    var i = Object.assign({}, DEFAULTS, input || {});
    var errors = validate(i);
    if (errors.length) {
      return { ok: false, errors: errors };
    }

    var r = i.opportunityReturn;
    var upfrontSwitch = i.evPrice + i.chargerCost - i.subsidy;
    var cashNeededToday = upfrontSwitch - (i.phevValue - i.phevLoan);

    var keepRunning = 0;
    var switchRunning = 0;
    var rows = [{ year: 0, keep: 0, switch: upfrontSwitch - i.evPrice, phevAnnual: 0, evAnnual: 0 }];
    var breakEvenYear = null;

    for (var t = 1; t <= MAX_BREAK_EVEN_YEARS; t++) {
      var p = phevAnnualCost(i, t);
      var e = evAnnualCost(i, t);
      keepRunning += discount(p.total, r, t);
      switchRunning += discount(e.total, r, t);

      var keepCum =
        i.phevValue - discount(residualValue(i.phevValue, i.phevDepreciation, t), r, t) + keepRunning;
      var switchCum =
        upfrontSwitch - discount(residualValue(i.evPrice, i.evDepreciation, t), r, t) + switchRunning;

      if (breakEvenYear === null && switchCum <= keepCum) {
        var prev = rows[t - 1];
        var prevGap = prev.switch - prev.keep;
        var gap = switchCum - keepCum;
        breakEvenYear = prevGap <= 0 ? t - 1 : t - 1 + prevGap / (prevGap - gap);
      }

      rows.push({
        year: t,
        keep: keepCum,
        switch: switchCum,
        phevAnnual: p.total,
        evAnnual: e.total,
        phevEnergy: p.energy,
        evEnergy: e.energy
      });
    }

    var horizon = rows[i.years];
    var savings = horizon.keep - horizon.switch;
    var extraInvestment = upfrontSwitch - i.phevValue;
    var roi = extraInvestment > 0 ? savings / extraInvestment : null;

    var verdict;
    var threshold = 0.01 * i.evPrice;
    if (savings > threshold) verdict = 'good';
    else if (savings < -threshold) verdict = 'bad';
    else verdict = 'borderline';

    return {
      ok: true,
      inputs: i,
      years: i.years,
      rows: rows.slice(0, i.years + 1),
      keepTotal: horizon.keep,
      switchTotal: horizon.switch,
      savings: savings,
      annualSavingsYear1: rows[1].phevAnnual - rows[1].evAnnual,
      extraInvestment: extraInvestment,
      cashNeededToday: cashNeededToday,
      roi: roi,
      breakEvenYear: breakEvenYear,
      verdict: verdict
    };
  }

  return {
    DEFAULTS: DEFAULTS,
    calculate: calculate,
    validate: validate,
    blendedElectricityPrice: blendedElectricityPrice,
    phevAnnualCost: phevAnnualCost,
    evAnnualCost: evAnnualCost
  };
});
