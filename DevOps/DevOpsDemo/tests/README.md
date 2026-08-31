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

Run the complete HMI workflow headlessly, including from a CI workflow:

```powershell
npm run test:hmi
```

The same command accepts additional Playwright arguments:

```powershell
npm run test:hmi -- --reporter=line
```

The explicit headless name remains available as an alias:

```powershell
npm run test:hmi:headless
```

The single live-HMI flow logs in as `operator`, `maintenance`, and `engineer`, closes the user menu, simulates ten production batches, then stays on the Production, Service, and Alarm tabs while verifying each WebViewer resource and exercising the batch, maintenance, checklist, filtering, acknowledgment, trigger, and reset controls. The headless run uses the same workflow without opening a visible browser window.

If the HMI reports that the maximum number of clients has been reached, close other HMI browser sessions and run the test again.

## Live mappView demo test

The demo command runs the same complete HMI workflow against mappView at `http://127.0.0.1:81`, but opens one Chrome window so the interactions can be followed. It tests all three users, starts the machine, waits for `STATE_EXECUTE`, produces and verifies ten bottles, then navigates through the real Production, Service, and Alarm tabs with 1.5-second pauses between interactions. It uses the same single end-to-end test as `test:hmi`.

For presentation use, the headed run also slows Playwright actions and shows a large pointer with an orange pulse at each click, including clicks inside the dashboard iframes. This visual treatment is only enabled by `test:demo`; the headless workflow remains unchanged.

```powershell
npm run test:demo
```

The single browser workflow covers PLC/PVI setup, user access, machine state and production feedback, plus Production batch controls, Alarm filtering and acknowledgment, and Service inspection and checklist actions inside their WebViewer iframes.