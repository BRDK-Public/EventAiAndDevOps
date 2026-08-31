import { expect, test } from '@playwright/test';
import { execFile } from 'node:child_process';
import { join, resolve } from 'node:path';
import { promisify } from 'node:util';

const execFileAsync = promisify(execFile);
const projectRoot = resolve(import.meta.dirname, '..');
const asCliPath = join(projectRoot, 'as-cli.exe');
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
    throw new Error(`as-cli ${args.join(' ')} failed: ${detail}`);
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

test('HMI production and user access flow', async ({ page }) => {
  test.setTimeout(5 * 60_000);
  await test.step('connect to the running PLC', async () => {
    await runAsCli(['plc', 'connect', '--ip', '127.0.0.1']);
  });

  await test.step('restart the PLC through Main:Reboot', async () => {
    await restartMainTask();
  });
  await waitForHmi(page);

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
      await page.waitForTimeout(1_000);
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
});