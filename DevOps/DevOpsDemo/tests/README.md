# HMI tests

## Python integration tests

These pytest tests run the same ARsim and PLC integration workflow as `run-integration-tests.ps1`.
Run them from this directory:

```powershell
pytest -q -s test_machine_sim.py -rA
```

The `-s` option shows the parsed build, ARsim, PLC, and runtime logbook responses while the tests run.

These Playwright tests check the running DevOpsDemo HMI.

## Get started

From this directory, install the dependencies once:

```powershell
npm install
```

Before running a test:

- Start the HMI at `http://127.0.0.1:81`.
- Make sure PVI Manager and the PLC/ARsim are available.
- Make sure the running Main task contains the `Reboot` BOOL variable.

If the HMI reports that the maximum number of clients has been reached, close other HMI browser sessions and try again.

## Run the tests

For a visible demo, open Chrome and watch the workflow:

```powershell
npm run test:demo
```

For a normal or CI check, run the same workflow headlessly:

```powershell
npm run test:hmi
```

Both commands test the same HMI workflow. The only difference is that `test:demo` shows the browser and presentation feedback, while `test:hmi` runs without a visible browser.