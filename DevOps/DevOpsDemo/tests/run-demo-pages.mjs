import { expect, test } from '@playwright/test';

async function expectCanvas(page) {
  await expect.poll(() => page.evaluate(() => ({
    width: document.documentElement.scrollWidth,
    height: document.documentElement.scrollHeight
  }))).toEqual({ width: 1260, height: 720 });
}

test.describe('standalone HMI demo pages', () => {
  test('Production Cockpit supports a deterministic batch workflow', async ({ page }) => {
    await page.goto('/production.html');
    await expect(page).toHaveTitle('Production Cockpit');
    await expectCanvas(page);
    await expect(page.locator('#production-simulate-batch')).toBeVisible();
    await page.locator('#production-simulate-batch').click();
    await expect(page.locator('#production-output')).toHaveText(/1 batches/);
    await expect(page.locator('#production-good')).toHaveText(/1 units/);
    await expect(page.locator('[data-batch-id="B-001"]')).toBeVisible();
    await page.locator('#production-reset-demo').click();
    await expect(page.locator('#production-output')).toHaveText(/0 batches/);
  });

  test('Alarm Command Center supports filtering and acknowledgment', async ({ page }) => {
    await page.goto('/alarm.html');
    await expect(page).toHaveTitle('Alarm Command Center');
    await expectCanvas(page);
    await expect(page.locator('#alarm-active-count')).toHaveText('2');
    await page.locator('#alarm-ack-ALM-001').click();
    await expect(page.locator('#alarm-unacknowledged-count')).toHaveText('1');
    await page.locator('[data-filter="warning"]').click();
    await expect(page.locator('#alarm-row-ALM-002')).toBeVisible();
    await expect(page.locator('#alarm-row-ALM-001')).toBeHidden();
    await page.locator('#alarm-trigger-demo').click();
    await expect(page.locator('#alarm-active-count')).toHaveText('3');
    await page.locator('#alarm-acknowledge-all').click();
    await expect(page.locator('#alarm-unacknowledged-count')).toHaveText('0');
    await page.locator('#alarm-reset-demo').click();
    await expect(page.locator('#alarm-active-count')).toHaveText('2');
  });

  test('Service and Diagnostics supports inspection and checklist workflows', async ({ page }) => {
    await page.goto('/service.html');
    await expect(page).toHaveTitle('Service and Diagnostics');
    await expectCanvas(page);
    await expect(page.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
    await page.locator('#service-inspect-capper').click();
    await expect(page.locator('#service-line-health')).toHaveText('3 / 3 HEALTHY');
    await expect(page.locator('#service-due-count')).toHaveText('0');
    await page.locator('#service-task-pressure').check();
    await expect(page.locator('#service-checklist-summary')).toHaveText('3 / 4 COMPLETE');
    await page.locator('#service-reset-demo').click();
    await expect(page.locator('#service-line-health')).toHaveText('2 / 3 HEALTHY');
  });
});