# Agentic Engineering Slides

A B&R Industrial Automation themed Slidev event deck: a 30-minute introduction, a 60-minute Agentic Engineering workshop, and a 75-minute DevOps in industry workshop. The rendered source deck contains 67 pages: 60 numbered presentation slides (`01-60`) and 7 unnumbered utility or reference pages. The numbered sequence follows source order: introduction `02-11`, Agentic Engineering `12-34`, the workshop handoff `35`, and Workshop Two `36-60`.

## Run

```powershell
npm install
npm run dev
```

Slidev opens the presentation at `http://localhost:3030`. Press `P` for presenter mode and `O` for the slide overview.

The Skills slide uses a companion local development proxy so the live `skills.sh` page remains interactive inside its iframe during `npm run dev`. The proxy runs one port above Slidev (for example, `3031` when Slidev runs on `3030`). The public site intentionally sends `X-Frame-Options: DENY` and `frame-ancestors 'none'`; therefore a static GitHub Pages build keeps the external `OPEN` link, but cannot provide the live embedded page.

## Build

```powershell
npm run build
```

The static site is written to `dist/`.

## GitHub Pages

The repository includes a GitHub Actions workflow at `.github/workflows/deploy-slides.yml` that builds and publishes this deck as a static GitHub Pages site. It runs for pushes to the `main` branch that change `Slides/`, and can also be started manually from the Actions tab.

Before the first deployment, set **Settings > Pages > Build and deployment > Source** to **GitHub Actions**. The published deck will be available at:

```text
https://brdk-public.github.io/EventAiAndDevOps/
```

The workflow builds with the repository base path and hash routing, so slide navigation and asset URLs work from the GitHub Pages subdirectory. To reproduce that build locally:

```powershell
npm run build -- --base /EventAiAndDevOps/ --router-mode hash
```

## Export

```powershell
npm run export
```

Export requires the Playwright Chromium browser. In this environment, its automatic download is currently blocked by a local certificate-chain error. Install the browser through the approved corporate certificate/proxy path before exporting.

## Event-Day Checks

- Replace the structured demo operations in the presenter notes with commands tested against the exact event build and target configuration.
- Rehearse both the live ARsim/as path and a recorded or static evidence fallback for the bottle-conveyor demonstrator.
- Confirm the canonical task names and variable paths before showing any numeric result; the repository contains more than one test path with different module names.
- Keep simulation acceleration wording tied to the verified event setup. Do not present a time factor as a benchmark or universal capability.
- Keep simulation evidence, HIL, physical validation, functional safety, and release approval as separate engineering boundaries.
- Confirm every component status against approved product communication before presenting.
- Verify that no credentials, customer paths, or project-sensitive data are visible.

`slides.md` is the source of truth for the current slide order. The 27 Agentic Engineering content sections remain documented in `agentic-engineering-customer-slide-plan.md`; the cover, D1 handoff, and D2 Workshop 2 intro are retained framing slides. Workshop 2 uses the checked-in bottle-conveyor project as a demonstrator and labels general principles, repository observations, and event-verified functionality separately.