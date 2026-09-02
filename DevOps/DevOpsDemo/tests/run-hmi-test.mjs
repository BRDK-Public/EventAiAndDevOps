import { expect, test } from '@playwright/test';
import { execFile } from 'node:child_process';
import { join, resolve } from 'node:path';
import { promisify } from 'node:util';

const execFileAsync = promisify(execFile);
const projectRoot = resolve(import.meta.dirname, '..');
const asCliPath = join(projectRoot, 'as.exe');
const projectPath = join(projectRoot, 'DevOpsDemo.apj');
const startButton = '#HD_LS1_contentMain_StartButton';
const stopButton = '#HD_LS1_contentMain_StopButton';
const stateDisplay = '#HD_LS1_contentHeader_TextOutput52';
const counterFrame = '#HD_LS1_contentMain_WebViewer1 iframe';
const counterDisplay = '#bottle-counter';
const userMenuButton = '#HD_LS1_contentNavigation_ButtonUserSettings';
const userConfigFlyout = '#HD_LS1_contentNavigation_FlyOutUserConfig';
const loginUserWidget = '#HD_LS1_contentNavigation_Login1_liUser';
const loginPasswordWidget = '#HD_LS1_contentNavigation_Login1_liPassword';
const loginSubmitButton = '#HD_LS1_contentNavigation_Login1_liButton';
const loginMessage = '#HD_LS1_contentNavigation_Login1_liMessageLabel';
const loginKeyboard = '#breaseKeyBoard';
const demoPauseMs = 1_500;
let demoMode = false;

async function installDemoPointer(page) {
  await page.evaluate(() => {
    if (window.__hmiDemoPointer) return;

    const style = document.createElement('style');
    style.textContent = `
      #hmi-playwright-demo-overlay {
        position: fixed;
        inset: 0;
        z-index: 2147483647;
        pointer-events: none;
      }
      .hmi-playwright-demo-pointer {
        position: fixed;
        top: 0;
        left: 0;
        width: 34px;
        height: 34px;
        opacity: 0;
        background: #fff;
        clip-path: polygon(0 0, 0 100%, 27% 74%, 45% 100%, 57% 93%, 40% 67%, 100% 67%);
        filter: drop-shadow(0 1px 1px #111) drop-shadow(0 0 5px rgba(255, 122, 0, 0.95));
        transform: translate(-3px, -3px);
        transition: left 320ms ease-out, top 320ms ease-out, opacity 120ms ease-out;
      }
      .hmi-playwright-demo-pointer.is-visible {
        opacity: 1;
      }
      .hmi-playwright-demo-focus {
        position: fixed;
        top: 0;
        left: 0;
        width: 76px;
        height: 76px;
        border: 5px solid #ff7a00;
        border-radius: 50%;
        opacity: 0;
        box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.8), 0 0 22px rgba(255, 122, 0, 0.9);
        transform: translate(-50%, -50%) scale(0.3);
      }
      .hmi-playwright-demo-focus.is-pulse {
        animation: hmi-playwright-demo-pulse 850ms ease-out;
      }
      .hmi-playwright-demo-target {
        position: fixed;
        top: 0;
        left: 0;
        border: 3px solid #45d18a;
        border-radius: 5px;
        opacity: 0;
        box-shadow: 0 0 0 3px rgba(21, 23, 25, 0.85), 0 0 24px rgba(69, 209, 138, 0.95);
        pointer-events: none;
      }
      .hmi-playwright-demo-target.is-proof {
        animation: hmi-playwright-demo-proof 3_000ms ease-out;
      }
      .hmi-playwright-demo-proof {
        position: fixed;
        display: grid;
        width: 330px;
        padding: 10px 14px 11px;
        border: 2px solid #45d18a;
        color: #fff;
        background: rgba(21, 23, 25, 0.96);
        box-shadow: 0 6px 24px rgba(0, 0, 0, 0.45), 0 0 18px rgba(69, 209, 138, 0.4);
        opacity: 0;
        transform: translateY(6px);
        transition: opacity 150ms ease-out, transform 150ms ease-out;
      }
      .hmi-playwright-demo-proof.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
      .hmi-playwright-demo-proof-kicker {
        color: #45d18a;
        font: 800 10px/1.2 Bahnschrift, 'Cascadia Code', Consolas, monospace;
        letter-spacing: 0.14em;
      }
      .hmi-playwright-demo-proof-action {
        margin-top: 5px;
        font: 800 15px/1.1 Bahnschrift, 'Trebuchet MS', sans-serif;
        letter-spacing: 0.04em;
        white-space: nowrap;
      }
      .hmi-playwright-demo-proof-state {
        margin-top: 4px;
        color: #b9c7c9;
        font: 700 11px/1.2 'Cascadia Code', Consolas, monospace;
        letter-spacing: 0.06em;
      }
      @keyframes hmi-playwright-demo-pulse {
        0% { opacity: 1; transform: translate(-50%, -50%) scale(0.3); }
        100% { opacity: 0; transform: translate(-50%, -50%) scale(1.2); }
      }
      @keyframes hmi-playwright-demo-proof {
        0% { opacity: 0; transform: scale(0.96); }
        18% { opacity: 1; transform: scale(1); }
        78% { opacity: 1; transform: scale(1); }
        100% { opacity: 0; transform: scale(1.02); }
      }
    `;
    document.documentElement.append(style);

    const overlay = document.createElement('div');
    overlay.id = 'hmi-playwright-demo-overlay';
    overlay.innerHTML = `
      <div class="hmi-playwright-demo-focus"></div>
      <div class="hmi-playwright-demo-target"></div>
      <div class="hmi-playwright-demo-pointer"></div>
      <div class="hmi-playwright-demo-proof">
        <span class="hmi-playwright-demo-proof-kicker">ASSERTION PASSED</span>
        <strong class="hmi-playwright-demo-proof-action"></strong>
        <small class="hmi-playwright-demo-proof-state"></small>
      </div>
    `;
    document.documentElement.append(overlay);

    const pointer = overlay.querySelector('.hmi-playwright-demo-pointer');
    const focus = overlay.querySelector('.hmi-playwright-demo-focus');
    const target = overlay.querySelector('.hmi-playwright-demo-target');
    const proof = overlay.querySelector('.hmi-playwright-demo-proof');
    const proofAction = overlay.querySelector('.hmi-playwright-demo-proof-action');
    const proofState = overlay.querySelector('.hmi-playwright-demo-proof-state');
    let hideTimer;
    let proofTimer;

    window.__hmiDemoPointer = {
      move(box) {
        const x = box.x + box.width / 2;
        const y = box.y + box.height / 2;
        pointer.style.left = `${x}px`;
        pointer.style.top = `${y}px`;
        pointer.classList.add('is-visible');
        clearTimeout(hideTimer);
        hideTimer = setTimeout(() => pointer.classList.remove('is-visible'), 3_000);
      },
      pulse(box) {
        const x = box.x + box.width / 2;
        const y = box.y + box.height / 2;
        focus.style.left = `${x}px`;
        focus.style.top = `${y}px`;
        focus.classList.remove('is-pulse');
        void focus.offsetWidth;
        focus.classList.add('is-pulse');
      },
      assert(box, title, action, result, targetLabel) {
        const inset = 6;
        target.style.left = `${box.x - inset}px`;
        target.style.top = `${box.y - inset}px`;
        target.style.width = `${box.width + inset * 2}px`;
        target.style.height = `${box.height + inset * 2}px`;
        target.classList.remove('is-proof');
        void target.offsetWidth;
        target.classList.add('is-proof');

        proof.querySelector('.hmi-playwright-demo-proof-kicker').textContent = title;
        proofAction.textContent = `${action}  →  ${result}`;
        proofState.textContent = `${targetLabel} · ${result}`;
        const proofWidth = 330;
        const proofHeight = 82;
        const preferredLeft = box.x + box.width + 18;
        const left = preferredLeft + proofWidth <= window.innerWidth
          ? preferredLeft
          : Math.max(12, box.x - proofWidth - 18);
        const top = Math.min(Math.max(12, box.y - 8), window.innerHeight - proofHeight - 12);
        proof.style.left = `${left}px`;
        proof.style.top = `${top}px`;
        proof.classList.add('is-visible');
        clearTimeout(proofTimer);
        proofTimer = setTimeout(() => {
          proof.classList.remove('is-visible');
        }, 4_000);
      }
    };
  });
}

async function showDemoAction(page, locator) {
  if (!demoMode) return;

  await locator.scrollIntoViewIfNeeded();
  const box = await locator.boundingBox();
  if (!box) throw new Error('Demo pointer could not locate the scripted HMI action');

  await page.evaluate(targetBox => window.__hmiDemoPointer?.move(targetBox), box);
  await page.waitForTimeout(500);
  await page.evaluate(targetBox => window.__hmiDemoPointer?.pulse(targetBox), box);
}

async function demoClick(page, locator) {
  await showDemoAction(page, locator);
  return locator.click();
}

async function demoCheck(page, locator) {
  await showDemoAction(page, locator);
  return locator.check();
}

async function showDemoProof(page, locator, title, action, result, targetLabel) {
  if (!demoMode) return;

  const box = await locator.boundingBox();
  if (!box) throw new Error(`Demo proof could not locate ${targetLabel} for ${result}`);
  await page.evaluate(
    ({ targetBox, proofTitle, targetAction, targetResult, proofTargetLabel }) => window.__hmiDemoPointer?.assert(
      targetBox,
      proofTitle,
      targetAction,
      targetResult,
      proofTargetLabel
    ),
    { targetBox: box, proofTitle: title, targetAction: action, targetResult: result, proofTargetLabel: targetLabel }
  );
}

async function showDemoAssertion(page, locator, action, expectedState) {
  await showDemoProof(page, locator, 'ASSERTION PASSED', action, expectedState, 'HMI state display');
}

const dashboardRoutes = {
  production: {
    name: 'Production Cockpit',
    navigationButton: '#HD_LS1_contentNavigation_NavigationProduction',
    webViewer: '#HD_LS1_contentProductionMgt_WebViewerProduction',
    pagePath: 'production.html',
    readySelector: '#production-simulate-batch'
  },
  service: {
    name: 'Service and Diagnostics',
    navigationButton: '#HD_LS1_contentNavigation_NavigationService',
    webViewer: '#HD_LS1_contentServiceMgt_WebViewerService',
    pagePath: 'service.html',
    readySelector: '#service-inspect-capper'
  },
  alarm: {
    name: 'Alarm Command Center',
    navigationButton: '#HD_LS1_contentNavigation_NavigationButton2',
    webViewer: '#HD_LS1_contentAlarmMgt_WebViewerAlarm',
    pagePath: 'alarm.html',
    readySelector: '#alarm-ack-ALM-001'
  }
};

async function runAsCli(args) {
  try {
    return await execFileAsync(asCliPath, [
      '--project', projectPath,
      '--timeout', '30000',
      '--format', 'json',
      ...args
    ], {
      cwd: projectRoot,
      windowsHide: true,
      timeout: 45_000,
      maxBuffer: 1024 * 1024
    });
  } catch (error) {
    const detail = [error.stdout, error.stderr, error.message].filter(Boolean).join('\n');
    throw new Error(`as ${args.join(' ')} failed: ${detail}`);
  }
}

async function writePlcVariable(variableName, value, task) {
  await runAsCli([
    'var', 'write', variableName,
    '--value', String(value),
    '--task', task
  ]);
}

async function readPlcVariable(variableName, task) {
  const { stdout } = await runAsCli([
    'var', 'read', variableName,
    '--task', task
  ]);
  return JSON.parse(stdout).data.value;
}

async function readPlcStatus() {
  const { stdout } = await runAsCli(['plc', 'status']);
  return JSON.parse(stdout).data;
}

async function restartMainTask() {
  await writePlcVariable('Reboot', true, 'Main');

  await expect.poll(
    async () => {
      try {
        return String(await readPlcVariable('Reboot', 'Main')).toLowerCase();
      } catch {
        return 'unavailable';
      }
    },
    {
      message: 'Main:Reboot to clear after the warm restart',
      timeout: 60_000
    }
  ).toBe('false');

  await expect.poll(
    async () => {
      try {
        const status = await readPlcStatus();
        return status.connected && status.cpuState === 'Run' ? 'running' : 'restarting';
      } catch {
        return 'restarting';
      }
    },
    {
      message: 'PLC to return to Run after the Main task warm restart',
      timeout: 60_000
    }
  ).toBe('running');
}

async function expectState(page, expectedState, action = 'STATE', showProof = true) {
  const stateWidget = page.locator(stateDisplay);
  await expect(stateWidget, 'PackML state display in the HMI header').toBeVisible();
  await expect.poll(
    async () => (await stateWidget.innerText()).trim(),
    {
      message: `expected HMI state to become ${expectedState}`,
      timeout: 30_000
    }
  ).toBe(expectedState);
  if (showProof) await showDemoAssertion(page, stateWidget, action, expectedState);
}

async function waitForHmi(page) {
  await page.goto('/', { waitUntil: 'domcontentloaded', timeout: 10_000 });
  await expect.poll(
    async () => {
      const bodyText = await page.locator('body').innerText();
      if (bodyText.includes('Maximum number of clients reached!')) return 'client-limit';
      if (await page.locator(startButton).count() > 0) return 'ready';
      return 'loading';
    },
    {
      message: 'mappView did not become ready at http://127.0.0.1:81',
      timeout: 30_000
    }
  ).toBe('ready');
}

async function enterLoginValue(page, widgetSelector, value) {
  await demoClick(page, page.locator(widgetSelector));
  const keyboard = page.locator(loginKeyboard);
  const keyboardInput = keyboard.locator('input');
  await expect(keyboardInput, 'mappView virtual keyboard input').toBeVisible();
  await keyboardInput.press('Control+A');
  await keyboardInput.press('Backspace');
  await page.keyboard.type(value);
  await demoClick(page, keyboard.locator('button.enter'));
  await expect(keyboard).toBeHidden();
}

async function readHmiCounter(page) {
  const counterWidget = page.frameLocator(counterFrame).locator(counterDisplay);
  const input = counterWidget.locator('input');
  if (await input.count() > 0) return Number(await input.first().inputValue());
  return Number((await counterWidget.innerText()).trim());
}

async function expectCounter(page, expectedCounter) {
  const counterWidget = page.frameLocator(counterFrame).locator(counterDisplay);
  await expect(counterWidget, 'production counter in the HMI').toBeVisible();
  await expect.poll(
    () => readHmiCounter(page),
    {
      message: `expected HMI production counter to become ${expectedCounter}`,
      timeout: 30_000
    }
  ).toBe(expectedCounter);
}

async function openDashboard(page, dashboard) {
  await demoClick(page, page.locator(dashboard.navigationButton));
  const iframe = page.locator(`${dashboard.webViewer} iframe`);
  await expect(iframe, `${dashboard.name} WebViewer`).toBeAttached({ timeout: 30_000 });
  await expect(iframe, `${dashboard.name} page resource`).toHaveAttribute(
    'src',
    new RegExp(dashboard.pagePath.replace('.', '\\.')),
    { timeout: 30_000 }
  );
  const frame = page.frameLocator(`${dashboard.webViewer} iframe`);
  await expect(frame.locator(dashboard.readySelector), `${dashboard.name} ready control`).toBeVisible({ timeout: 30_000 });
  return frame;
}

async function pauseForDemo(page) {
  await page.waitForTimeout(demoPauseMs);
}

test('HMI production, access, and dashboard flow', async ({ page }, testInfo) => {
  test.setTimeout(5 * 60_000);
  demoMode = testInfo.project.use.headless === false || process.argv.includes('--headed');

  await test.step('connect to the running PLC', async () => {
    await runAsCli(['plc', 'connect', '--ip', '127.0.0.1']);
  });

  await test.step('restart the PLC through Main:Reboot', async () => {
    await restartMainTask();
  });
  await waitForHmi(page);
  if (demoMode) await installDemoPointer(page);
  await pauseForDemo(page);

  await expect(page.locator(userMenuButton), 'upper-left user menu button').toBeVisible();

  await demoClick(page, page.locator(userMenuButton));
  await expect(page.locator(userConfigFlyout), 'user login flyout').toHaveClass(/show/);
  await expect(page.locator(loginUserWidget), 'login username input').toBeVisible();
  await expect(page.locator(loginPasswordWidget), 'login password input').toBeVisible();

  const users = [
    { username: 'operator', password: 'operator' },
    { username: 'maintenance', password: 'maintenance' },
    { username: 'engineer', password: 'engineer' }
  ];

  for (const user of users) {
    await test.step(`login as ${user.username}`, async () => {
      await enterLoginValue(page, loginUserWidget, user.username);
      await enterLoginValue(page, loginPasswordWidget, user.password);
      await demoClick(page, page.locator(loginSubmitButton));
      await expect(page.locator(loginMessage), 'login result message').toBeVisible();
      await expect(page.locator(loginMessage), 'login result message').toContainText(
        `User changed to: ${user.username}`,
        { timeout: 30_000 }
      );
      await showDemoProof(
        page,
        page.locator(loginMessage),
        'LOGIN VERIFIED',
        'LOGIN',
        user.username.toUpperCase(),
        'HMI access result'
      );
      await pauseForDemo(page);
    });
  }

  await demoClick(page, page.locator(userMenuButton));
  await expect(page.locator(userConfigFlyout), 'user login flyout').not.toHaveClass(/show/);
  await expectState(page, 'STATE_STOPPED', 'STATE', false);

  await test.step('reset the production counter and bottle input', async () => {
    await writePlcVariable('productionCycleCount', 0, 'EM_Conveyo');
    await writePlcVariable('hw.di_bottleReady', false, 'EM_Conveyo');
    await expectCounter(page, 0);
  });

  await expect(page.locator(startButton), 'HMI play button').toBeVisible({ timeout: 30_000 });
  await expect(page.locator(stopButton), 'HMI stop button').toBeVisible({ timeout: 30_000 });

  await demoClick(page, page.locator(startButton));
  await expectState(page, 'STATE_EXECUTE', 'PLAY / STATE_STOPPED');
  await pauseForDemo(page);

  for (let batchNumber = 1; batchNumber <= 10; batchNumber += 1) {
    await test.step(`simulate batch ${batchNumber}`, async () => {
      await writePlcVariable('hw.di_bottleReady', true, 'EM_Conveyo');
      await page.waitForTimeout(100);
      await writePlcVariable('hw.di_bottleReady', false, 'EM_Conveyo');
      await expectCounter(page, batchNumber);
    });
  }

  await demoClick(page, page.locator(stopButton));
  await expectState(page, 'STATE_STOPPED', 'STOP / STATE_EXECUTE');
  await pauseForDemo(page);

  await test.step('navigate to Production and simulate a batch', async () => {
    const productionFrame = await openDashboard(page, dashboardRoutes.production);
    await pauseForDemo(page);
    await demoClick(page, productionFrame.locator('#production-reset-demo'));
    await expect(productionFrame.locator('#production-output')).toHaveText(/0 batches/);
    await pauseForDemo(page);
    await demoClick(page, productionFrame.locator('#production-simulate-batch'));
    await expect(productionFrame.locator('#production-output')).toHaveText(/1 batches/);
    await expect(productionFrame.locator('#production-good')).toHaveText(/1 units/);
    await pauseForDemo(page);
    await demoClick(page, productionFrame.locator('#production-simulate-batch'));
    await expect(productionFrame.locator('#production-output')).toHaveText(/2 batches/);
    await expect(productionFrame.locator('#production-good')).toHaveText(/2 units/);
    await expect(productionFrame.locator('[data-batch-id="B-002"]')).toBeVisible();
    await pauseForDemo(page);
    await demoClick(page, productionFrame.locator('#production-reset-demo'));
    await expect(productionFrame.locator('#production-output')).toHaveText(/0 batches/);
    await pauseForDemo(page);
  });

  await test.step('navigate to Service and complete maintenance checks', async () => {
    const serviceFrame = await openDashboard(page, dashboardRoutes.service);
    await pauseForDemo(page);
    await demoClick(page, serviceFrame.locator('#service-reset-demo'));
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
    await pauseForDemo(page);
    await demoClick(page, serviceFrame.locator('#service-inspect-capper'));
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('3 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-due-count')).toHaveText('0');
    await pauseForDemo(page);
    await demoClick(page, serviceFrame.locator('#service-inspect-all'));
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('3 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-due-count')).toHaveText('0');
    await pauseForDemo(page);
    await demoCheck(page, serviceFrame.locator('#service-task-pressure'));
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('3 / 4 COMPLETE');
    await pauseForDemo(page);
    await demoCheck(page, serviceFrame.locator('#service-task-capper'));
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('4 / 4 COMPLETE');
    await pauseForDemo(page);
    await demoClick(page, serviceFrame.locator('#service-reset-demo'));
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('2 / 4 COMPLETE');
    await pauseForDemo(page);
  });

  await test.step('navigate to Alarm and acknowledge a triggered event', async () => {
    const alarmFrame = await openDashboard(page, dashboardRoutes.alarm);
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('#alarm-reset-demo'));
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('2');
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('[data-filter="critical"]'));
    await expect(alarmFrame.locator('#alarm-row-ALM-001')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeHidden();
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('#alarm-ack-ALM-001'));
    await expect(alarmFrame.locator('#alarm-unacknowledged-count')).toHaveText('1');
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('[data-filter="warning"]'));
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-001')).toBeHidden();
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('[data-filter="active"]'));
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-003')).toBeHidden();
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('#alarm-trigger-demo'));
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('3');
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('#alarm-acknowledge-all'));
    await expect(alarmFrame.locator('#alarm-unacknowledged-count')).toHaveText('0');
    await pauseForDemo(page);
    await demoClick(page, alarmFrame.locator('#alarm-reset-demo'));
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('2');
    await pauseForDemo(page);
  });
});