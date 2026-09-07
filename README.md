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
