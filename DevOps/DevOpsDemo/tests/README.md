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

Show the Chrome window while the test runs:

```powershell
npm run test:hmi
```

The same command accepts additional Playwright arguments, so this also opens Chrome:

```powershell
npm run test:hmi -- --reporter=line
```

Headless:

```powershell
npm run test:hmi:headless
```

The single live-HMI flow logs in as `operator`, `maintenance`, and `engineer`, closes the user menu, simulates ten production batches, then stays on the Production, Service, and Alarm tabs while verifying each WebViewer resource and exercising the batch, maintenance, checklist, filtering, acknowledgment, trigger, and reset controls. The headed run pauses between these interactions so the workflow can be followed during a demo.

If the HMI reports that the maximum number of clients has been reached, close other HMI browser sessions and run the test again.

## Live mappView demo test

The simple demo command runs the complete headed HMI workflow against mappView at `http://127.0.0.1:81`. It opens one Chrome window, tests all three users, starts the machine, waits for `STATE_EXECUTE`, produces and verifies ten bottles, then navigates through the real Production, Service, and Alarm tabs with 1.5-second pauses between interactions. It uses the same single end-to-end test as `test:hmi`.

```powershell
npm run test:demo
```

The single browser workflow covers PLC/PVI setup, user access, machine state and production feedback, plus Production batch controls, Alarm filtering and acknowledgment, and Service inspection and checklist actions inside their WebViewer iframes.