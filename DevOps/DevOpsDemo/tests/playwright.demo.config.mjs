import { defineConfig } from '@playwright/test';
import { resolve } from 'node:path';

const webRoot = resolve(import.meta.dirname, '..', 'Logical', 'mappView', 'Resources', 'Media', 'web');

export default defineConfig({
  testDir: '.',
  testMatch: 'run-demo-pages.mjs',
  timeout: 30_000,
  reporter: 'line',
  webServer: {
    command: `python -m http.server 4174 --bind 127.0.0.1 --directory "${webRoot}"`,
    url: 'http://127.0.0.1:4174/production.html',
    reuseExistingServer: true,
    timeout: 30_000
  },
  use: {
    baseURL: 'http://127.0.0.1:4174',
    browserName: 'chromium',
    channel: 'chrome',
    headless: true,
    viewport: { width: 1260, height: 720 },
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure'
  }
});