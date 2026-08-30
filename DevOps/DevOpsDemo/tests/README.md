# HMI tests

These Playwright tests check the running DevOpsDemo HMI.

## Before you start

- Start the HMI at `http://127.0.0.1:81`.
- Make sure PVI Manager and the running PLC/ARsim are available.
- The running Main task must contain the `Reboot` BOOL variable.

The test first writes `Main:Reboot` to `TRUE` and waits for the PLC to return to `Run`.
It does not build, transfer, or start the project.

## Install

From this directory, run once:

```powershell
npm install
```

## Run

Headless:

```powershell
npm run test:hmi
```

Show the browser while the test runs:

```powershell
npm run test:hmi -- --headed --reporter=line
```

The test logs in as `operator`, `maintenance`, and `engineer`, closes the user menu, then simulates ten production batches and checks the visible counter.

If the HMI reports that the maximum number of clients has been reached, close other HMI browser sessions and run the test again.