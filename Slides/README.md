# Agentic Engineering Slides

A B&R Industrial Automation themed Slidev event deck: a 30-minute introduction, a 60-minute Agentic Engineering workshop, and a retained break handoff into a separate DevOps workshop with its opening slide. The rendered source deck contains 30 slides: `COVER`, `I1-I10`, `W1-W17`, `D1`, and `D2`. DevOps workshop content beyond the opening slide and backup slides are outside this source deck and the customer plan.

## Run

```powershell
npm install
npm run dev
```

Slidev opens the presentation at `http://localhost:3030`. Press `P` for presenter mode and `O` for the slide overview.

## Build

```powershell
npm run build
```

The static site is written to `dist/`.

## Export

```powershell
npm run export
```

Export requires the Playwright Chromium browser. In this environment, its automatic download is currently blocked by a local certificate-chain error. Install the browser through the approved corporate certificate/proxy path before exporting.

## Event-Day Checks

- Replace the structured demo operations with commands tested against the exact event build.
- Confirm every component status against approved product communication before presenting.
- Keep the recorded demo fallback ready.
- Verify that no credentials, customer paths, or project-sensitive data are visible.

`slides.md` is the source of truth for the current slide order. The 27 content sections remain documented in `agentic-engineering-customer-slide-plan.md`; the cover, D1 handoff, and D2 Workshop 2 intro are retained framing slides.