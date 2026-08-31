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

async function expectState(page, expectedState) {
  const stateWidget = page.locator(stateDisplay);
  await expect(stateWidget, 'PackML state display in the HMI header').toBeVisible();
  await expect.poll(
    async () => (await stateWidget.innerText()).trim(),
    {
      message: `expected HMI state to become ${expectedState}`,
      timeout: 30_000
    }
  ).toBe(expectedState);
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
  await page.locator(widgetSelector).click();
  const keyboard = page.locator(loginKeyboard);
  const keyboardInput = keyboard.locator('input');
  await expect(keyboardInput, 'mappView virtual keyboard input').toBeVisible();
  await keyboardInput.press('Control+A');
  await keyboardInput.press('Backspace');
  await page.keyboard.type(value);
  await keyboard.locator('button.enter').click();
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
  await page.locator(dashboard.navigationButton).click();
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

test('HMI production, access, and dashboard flow', async ({ page }) => {
  test.setTimeout(5 * 60_000);
  await test.step('connect to the running PLC', async () => {
    await runAsCli(['plc', 'connect', '--ip', '127.0.0.1']);
  });

  await test.step('restart the PLC through Main:Reboot', async () => {
    await restartMainTask();
  });
  await waitForHmi(page);
  await pauseForDemo(page);

  await expect(page.locator(userMenuButton), 'upper-left user menu button').toBeVisible();

  await page.locator(userMenuButton).click();
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
      await page.locator(loginSubmitButton).click();
      await expect(page.locator(loginMessage), 'login result message').toBeVisible();
      await expect(page.locator(loginMessage), 'login result message').toContainText(
        `User changed to: ${user.username}`,
        { timeout: 30_000 }
      );
      await pauseForDemo(page);
    });
  }

  await page.locator(userMenuButton).click();
  await expect(page.locator(userConfigFlyout), 'user login flyout').not.toHaveClass(/show/);
  await expectState(page, 'STATE_STOPPED');

  await test.step('reset the production counter and bottle input', async () => {
    await writePlcVariable('productionCycleCount', 0, 'EM_Conveyo');
    await writePlcVariable('hw.di_bottleReady', false, 'EM_Conveyo');
    await expectCounter(page, 0);
  });

  await expect(page.locator(startButton), 'HMI play button').toBeVisible({ timeout: 30_000 });
  await expect(page.locator(stopButton), 'HMI stop button').toBeVisible({ timeout: 30_000 });

  await page.locator(startButton).click();
  await expectState(page, 'STATE_EXECUTE');
  await pauseForDemo(page);

  for (let batchNumber = 1; batchNumber <= 10; batchNumber += 1) {
    await test.step(`simulate batch ${batchNumber}`, async () => {
      await writePlcVariable('hw.di_bottleReady', true, 'EM_Conveyo');
      await page.waitForTimeout(100);
      await writePlcVariable('hw.di_bottleReady', false, 'EM_Conveyo');
      await expectCounter(page, batchNumber);
    });
  }

  await page.locator(stopButton).click();
  await expectState(page, 'STATE_STOPPED');
  await pauseForDemo(page);

  await test.step('navigate to Production and simulate a batch', async () => {
    const productionFrame = await openDashboard(page, dashboardRoutes.production);
    await pauseForDemo(page);
    await productionFrame.locator('#production-reset-demo').click();
    await expect(productionFrame.locator('#production-output')).toHaveText(/0 batches/);
    await pauseForDemo(page);
    await productionFrame.locator('#production-simulate-batch').click();
    await expect(productionFrame.locator('#production-output')).toHaveText(/1 batches/);
    await expect(productionFrame.locator('#production-good')).toHaveText(/1 units/);
    await pauseForDemo(page);
    await productionFrame.locator('#production-simulate-batch').click();
    await expect(productionFrame.locator('#production-output')).toHaveText(/2 batches/);
    await expect(productionFrame.locator('#production-good')).toHaveText(/2 units/);
    await expect(productionFrame.locator('[data-batch-id="B-002"]')).toBeVisible();
    await pauseForDemo(page);
    await productionFrame.locator('#production-reset-demo').click();
    await expect(productionFrame.locator('#production-output')).toHaveText(/0 batches/);
    await pauseForDemo(page);
  });

  await test.step('navigate to Service and complete maintenance checks', async () => {
    const serviceFrame = await openDashboard(page, dashboardRoutes.service);
    await pauseForDemo(page);
    await serviceFrame.locator('#service-reset-demo').click();
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
    await pauseForDemo(page);
    await serviceFrame.locator('#service-inspect-capper').click();
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('3 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-due-count')).toHaveText('0');
    await pauseForDemo(page);
    await serviceFrame.locator('#service-inspect-all').click();
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('3 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-due-count')).toHaveText('0');
    await pauseForDemo(page);
    await serviceFrame.locator('#service-task-pressure').check();
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('3 / 4 COMPLETE');
    await pauseForDemo(page);
    await serviceFrame.locator('#service-task-capper').check();
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('4 / 4 COMPLETE');
    await pauseForDemo(page);
    await serviceFrame.locator('#service-reset-demo').click();
    await expect(serviceFrame.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
    await expect(serviceFrame.locator('#service-checklist-summary')).toHaveText('2 / 4 COMPLETE');
    await pauseForDemo(page);
  });

  await test.step('navigate to Alarm and acknowledge a triggered event', async () => {
    const alarmFrame = await openDashboard(page, dashboardRoutes.alarm);
    await pauseForDemo(page);
    await alarmFrame.locator('#alarm-reset-demo').click();
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('2');
    await pauseForDemo(page);
    await alarmFrame.locator('[data-filter="critical"]').click();
    await expect(alarmFrame.locator('#alarm-row-ALM-001')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeHidden();
    await pauseForDemo(page);
    await alarmFrame.locator('#alarm-ack-ALM-001').click();
    await expect(alarmFrame.locator('#alarm-unacknowledged-count')).toHaveText('1');
    await pauseForDemo(page);
    await alarmFrame.locator('[data-filter="warning"]').click();
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-001')).toBeHidden();
    await pauseForDemo(page);
    await alarmFrame.locator('[data-filter="active"]').click();
    await expect(alarmFrame.locator('#alarm-row-ALM-002')).toBeVisible();
    await expect(alarmFrame.locator('#alarm-row-ALM-003')).toBeHidden();
    await pauseForDemo(page);
    await alarmFrame.locator('#alarm-trigger-demo').click();
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('3');
    await pauseForDemo(page);
    await alarmFrame.locator('#alarm-acknowledge-all').click();
    await expect(alarmFrame.locator('#alarm-unacknowledged-count')).toHaveText('0');
    await pauseForDemo(page);
    await alarmFrame.locator('#alarm-reset-demo').click();
    await expect(alarmFrame.locator('#alarm-active-count')).toHaveText('2');
    await pauseForDemo(page);
  });
});