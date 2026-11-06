# Event AI and DevOps

## Slides
https://brdk-public.github.io/EventAiAndDevOps/#/2

## Automation Studio CLI

CLI path:
```text
.\EventAiAndDevOps\DevOps\DevOpsDemo\as.exe
```

Run it in a terminal, or add it to your `PATH`.

## Tests

Automation Studio project:
```text
.\EventAiAndDevOps\DevOps\DevOpsDemo
```

Run integration tests:
```powershell
.\EventAiAndDevOps\DevOps\DevOpsDemo\tests\run-integration-tests.ps1
```

Run the Playwright HMI test with the simulator already running:
```powershell
cd .\EventAiAndDevOps\DevOps\DevOpsDemo\tests
npm run test:demo
```

## PHEV → EV investment calculator

Static website (no build step) that estimates whether swapping a plug-in hybrid for an EV pays off.

Open `PhevToEvCalculator/index.html` in a browser, or serve the folder:
```bash
cd PhevToEvCalculator
python3 -m http.server 8000
```

Run the calculation unit tests (Node 18+):
```bash
cd PhevToEvCalculator
npm test
```
