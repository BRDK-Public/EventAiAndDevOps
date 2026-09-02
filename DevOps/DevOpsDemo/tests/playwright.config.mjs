import { defineConfig } from '@playwright/test';

const demoMode = process.argv.includes('--headed');

export default defineConfig({
  testDir: '.',
  testMatch: 'run-hmi-test.mjs',
  timeout: 30_000,
  reporter: 'list',
  use: {
    baseURL: 'http://127.0.0.1:81',
    browserName: 'chromium',
    channel: 'chrome',
    headless: true,
    launchOptions: demoMode ? { slowMo: 350 } : undefined,
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure'
  }
});