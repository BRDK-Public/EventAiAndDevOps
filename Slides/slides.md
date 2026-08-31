---
theme: default
title: The future of automation
titleTemplate: '%s | B&R Industrial Automation'
author: B&R Industrial Automation
colorSchema: light
aspectRatio: 16/9
canvasWidth: 1280
transition: slide-left
duration: 90min
timer: countdown
drawings:
  enabled: true
  persist: false
fonts:
  sans: IBM Plex Sans
  serif: Barlow Condensed
  mono: IBM Plex Mono
  provider: google
exportFilename: agentic-engineering
---

<img class="cover-image" src="/evolution.png" alt="Evolution from AI assistant to AI agent and agentic AI">
<img class="cover-logo" src="/br-logo.svg" alt="B&R Industrial Automation">

<div class="eyebrow" v-motion :initial="{ opacity: 0, x: -30 }" :enter="{ opacity: 1, x: 0, transition: { delay: 150 } }">
  AI · DEVOPS · AGENTIC ENGINEERING
</div>

<div class="cover-event" v-motion :initial="{ opacity: 0, x: -30 }" :enter="{ opacity: 1, x: 0, transition: { delay: 280 } }">
  <span>03 SEP 2026</span><span>ODENSE</span><span>08.30–13.00</span>
</div>

# The future of<br><span class="accent">automation</span>

<p class="cover-sub" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 450 } }">
  How do we create real value in industrial engineering?
</p>

<div class="bridge-visual" v-motion :initial="{ opacity: 0, y: 24 }" :enter="{ opacity: 1, y: 0, transition: { delay: 700 } }">
  <div class="bridge-node"><span>01</span> IDEA</div>
  <div class="bridge-track"><i></i><i></i><i></i><i></i><i></i></div>
  <div class="bridge-node is-proof"><span>02</span> VERIFIED MACHINE BEHAVIOR</div>
</div>
<div class="slide-id">COVER · 01</div>

<!--
Godmorgen og velkommen. Det centrale spørgsmål i dag er ikke, hvilken AI-model der ligger nummer ét på en benchmark i denne uge. Spørgsmålet er, hvordan vi skaber reel og dokumenterbar værdi i udviklingen af maskiner og anlæg.

Vi vil derfor tale mindre om magiske prompts og mere om versionsstyring, kontekst, værktøjer, test, sporbarhed og menneskeligt ansvar.

Målet er, at I går herfra med en realistisk måde at komme i gang på. Først ser vi dagens samlede forløb.
-->

---
layout: default
class: agenda-slide dark-slide
---

<div class="kicker">TODAY · PRACTICAL INFO</div>

<div class="agenda-layout">
  <div class="agenda-intro" v-motion :initial="{ opacity: 0, x: -24 }" :enter="{ opacity: 1, x: 0 }">
    <h1>One morning.<br><span class="accent">A shared workflow.</span></h1>
    <p class="agenda-lead">A practical path from why this matters to how we build trustworthy agentic workflows for industrial engineering.</p>
    <div class="agenda-event-mark">
      <span>03</span>
      <div><b>SEPTEMBER 2026</b><small>ODENSE · B&R INDUSTRIAL AUTOMATION</small></div>
    </div>
  </div>

  <div class="agenda-timeline" v-motion :initial="{ opacity: 0, x: 28 }" :enter="{ opacity: 1, x: 0, transition: { delay: 220 } }">
    <div class="agenda-row">
      <time datetime="08:30">08.30</time><i aria-hidden="true"></i><div><b>Arrival and breakfast</b><small>Settle in</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="09:00">09.00</time><i aria-hidden="true"></i><div><b>Welcome and introduction</b><small>Why DevOps + Agentic Engineering</small></div>
    </div>
    <div class="agenda-row is-session">
      <time datetime="09:30">09.30</time><i aria-hidden="true"></i><div><b>Agentic Engineering</b><small>Definitions · bridge · constraints</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="10:30">10.30</time><i aria-hidden="true"></i><div><b>Break and networking</b><small>30 minutes</small></div>
    </div>
    <div class="agenda-row is-session">
      <time datetime="11:00">11.00</time><i aria-hidden="true"></i><div><b>DevOps in industry</b><small>Version · build · test · release</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="12:15">12.15</time><i aria-hidden="true"></i><div><b>Questions, lunch and networking</b><small>Until 13.00</small></div>
    </div>
  </div>
</div>

<div class="slide-id">I1 · 02</div>

<!--
Her er dagens samlede forløb. Donara og jeg åbner formiddagen, og klokken 09.30 går vi ind i AI i praksis med fokus på det fundament, der gør agentisk engineering anvendelig i industrien.

Efter pausen tager Mads over med DevOps i industrien. De to sessioner hænger tæt sammen: AI kan skabe ændringer hurtigere, mens DevOps gør ændringerne synlige, testbare og kontrollerede.

Vi slutter med frokost og tid til at sammenligne erfaringer. Først vil jeg gøre klart, hvilken type AI-præsentation dette ikke bliver.
-->

---
layout: default
class: light-grid
---

<div class="kicker">WHY THIS EVENT · 04 MIN</div>

# You have not<br><span class="accent">missed the moment.</span>

<div class="split-verdicts">
  <div class="verdict no" v-click>
    <div class="verdict-head"><mdi-close-circle-outline /> WHAT WE WILL NOT TELL YOU</div>
    <div class="verdict-row"><b>Everyone else has</b><span>solved AI</span></div>
    <div class="verdict-row"><b>Copy our</b><span>productivity percentage</span></div>
    <div class="verdict-row"><b>Buy one tool and</b><span>transformation follows</span></div>
  </div>
  <div class="verdict yes" v-click>
    <div class="verdict-head"><mdi-check-circle-outline /> WHAT WE WILL TELL YOU</div>
    <div class="verdict-row"><b>Industrial AI is</b><span>still emerging</span></div>
    <div class="verdict-row"><b>Results depend on</b><span>context and process</span></div>
    <div class="verdict-row"><b>Start with one</b><span>bounded workflow</span></div>
  </div>
</div>

<div class="bottom-statement" v-click>
  Industrial automation is early enough to <strong>shape the right foundations.</strong>
</div>

<div class="slide-id">I2 · 03</div>

<!--
Jeg har selv været til mange AI-foredrag og konferencer. Ofte hører man om en virksomhed, der har løst næsten alt med AI og er blevet 30, 40 eller 50 procent mere produktiv. Historien lyder bagefter: "Gør bare som os."

Problemet er, at man sjældent får hele regnestykket med. Man hører ikke altid om investeringerne, fejlene, datagrundlaget eller de særlige forudsætninger. Derfor går man let hjem med en fornemmelse af at være bagud.

Sådan skal det ikke være i dag. AI i automationsbranchen er stadig nyt. I har ikke sovet i timen, men tidspunktet er godt til at begynde systematisk. Vi viser både det, der virker nu, og det, der stadig kræver jeres egen kontekst, proces og ansvar.

Transition: Lad os se på, hvordan DevOps og Agentic Engineering supplerer hinanden.
-->

---
layout: default
class: dark-slide
---

<div class="kicker">COMPLEMENTARY SYSTEMS · 03 MIN</div>

# DevOps + Agentic<br><span class="accent">Engineering</span>

<div class="maturity-line">
  <div class="maturity-stage done" v-click><span>01</span><b>DevOps</b><small>version · build · test</small></div>
  <div class="maturity-link" v-click></div>
  <div class="maturity-stage done" v-click><span>02</span><b>Agent</b><small>context · action · observe</small></div>
  <div class="maturity-link" v-click></div>
  <div class="maturity-stage active" v-click><span>03</span><b>Shared feedback</b><small>application says what happened</small></div>
  <div class="maturity-link dashed" v-click></div>
  <div class="maturity-stage next" v-click><span>04</span><b>Engineering</b><small>prove · approve · improve</small></div>
</div>

<div class="signal-callout" v-click>
  <div class="signal-pulse"></div>
  <p>DevOps gives agents rails.<br><strong>Agents make the rails more useful.</strong></p>
</div>
<div class="slide-id">I3 · 04</div>

<!--
DevOps og Agentic Engineering har forskellig control flow, men de har brug for den samme platform.
DevOps udfører en kendt sekvens: checkout, build, test, package og publish. En agent er nyttig, når næste handling afhænger af feedback: Hvilken fil er relevant? Hvorfor fejlede build? Hvilken ændring bør prøves nu?

Begge kræver versionsstyring, en ren build, kontrollerede targets, strukturerede diagnostics, objektive assertions og sporbar evidence. Uden DevOps-fundament kan agenten producere ændringer hurtigere, men organisationen kan ikke styre eller bevise kvaliteten.
-->

---
layout: default
---

<div class="kicker">DEFINITION · 04 MIN</div>

<div class="layer-stack">
  <div class="stack-layer harness-layer" v-click>
    <div class="layer-index">03</div>
    <div class="layer-job">Context · tools · permissions · logs</div>
    <mdi-message-processing-outline />
  </div>
  <div class="stack-layer platform-layer" v-click>
    <div class="layer-title">AGENT</div>
    <div class="layer-job">Goal · chooses actions · observes results</div>
    <mdi-source-pull />
  </div>
  <div class="stack-layer git-layer" v-click>
    <div class="layer-index">01</div>
    <div class="layer-title">MODEL</div>
    <div class="layer-job">Patterns · reasoning · next-step prediction</div>
    <mdi-source-commit />
  </div>
</div>

<div class="record-rail" v-click>
  <small>WITH A GOAL, TOOLS AND FEEDBACK</small>
</div>

<div class="slide-id">I4 · 05</div>
<!--
Modellen alene har ingen adgang til Automation Studio, et project, en PLC eller en logbook. Den kan kun arbejde med den context, den får.

Agenten opstår, når modellen kan vælge et tool, kalde det, se resultatet og beslutte næste trin. Harnesset er miljøet rundt om agenten: context, tools, permissions, logging, handoffs, budgets og approvals.
Git er versionsstyringen. GitHub eller Azure DevOps lægger samarbejde ovenpå med issues, pull requests og CI/CD. Repository, issue, commit, pull request og testresultat er de holdbare artefakter. En chatsamtale er ikke system of record.
Transition: Hvorfor er dette sket hurtigere i IT end i OT?
-->
---
layout: default
class: process-slide
---
<div class="kicker">FOUNDATION · 04 MIN</div>

# IT + OT are<br><span class="accent">converging</span>

<div class="devops-track">
  <div class="track-step" v-click>
    <div class="step-icon"><mdi-source-branch /></div>
    <span>01</span><b>Git</b><small>visible + reversible</small>
  </div>
  <div class="track-step" v-click>
    <div class="step-icon"><mdi-hammer-wrench /></div>
    <span>02</span><b>Repeatable build</b><small>reproducible result</small>
  </div>
  <div class="track-step" v-click>
    <div class="step-icon"><mdi-test-tube /></div>
    <span>03</span><b>Automated test</b><small>objective feedback</small>
  </div>
  <div class="track-arrow" v-click><mdi-arrow-right /></div>
  <div class="track-step" v-click>
    <div class="step-icon"><mdi-shield-check-outline /></div>
    <span>04</span><b>Reviewable release</b><small>evidence + approval</small>
  </div>
</div>
<div class="amplifier-band" v-click>
  <div class="amp-label"><mdi-auto-fix /> AI</div>
  <div class="amp-wave"><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i></div>
  <div class="amp-copy">amplifies the engineering system <strong>around it</strong></div>
  </div>

<div class="margin-note">SOFTWARE MOVED FIRST BECAUSE ITS FEEDBACK LOOP BECAME<br>CHEAP, VISIBLE, AND REVERSIBLE.</div>

<div class="slide-id">I5 · 06</div>
<!--
IT er ikke foran, fordi softwareudviklere er klogere. Kode og configuration er tekst, Git gør ændringer diffable og reversible, APIs og CLIs gør handlinger scriptbare, og CI giver hurtig feedback.

OT har yderligere udfordringer: fysiske konsekvenser, lange livscyklusser, hardware- og versionsafhængigheder, motion, safety og mindre standardiseret feedback.
IT og OT konvergerer nu, fordi flere automation-artifacts bliver inspectable, flere operationer bliver scriptbare, og simulation og diagnostics kan indgå i et feedback-loop.

Transition: Det vigtigste hul er forskellen mellem at generere kode og at verificere engineering.
-->
---
layout: default
class: feedback-slide dark-slide
---

<div class="kicker">EXECUTABLE FEEDBACK · 03 MIN</div>

# Close the industrial<br><span class="accent">engineering loop</span>

<div class="industrial-loop">
  <div class="industrial-node source" v-click><mdi-file-code-outline /><span>SOURCE</span></div>
  <div class="industrial-arrow" v-click><mdi-arrow-right /></div>
  <div class="industrial-node" v-click><mdi-hammer-wrench /><span>BUILD</span></div>
  <div class="industrial-arrow" v-click><mdi-arrow-right /></div>
  <div class="industrial-node" v-click><mdi-monitor-dashboard /><span>ARSIM / TEST</span></div>
  <div class="industrial-arrow" v-click><mdi-arrow-right /></div>
  <div class="industrial-node" v-click><mdi-chart-timeline-variant-shimmer /><span>VARIABLES + LOGBOOK</span></div>
  <div class="industrial-arrow" v-click><mdi-arrow-right /></div>
  <div class="industrial-node evidence" v-click><mdi-shield-check-outline /><span>EVIDENCE</span></div>
</div>

<div class="loop-backline" v-click><i></i><span>feedback drives the next bounded action</span><mdi-arrow-up-left /></div>

<div class="workflow-agent-compare">
  <div v-click><span>DEVOPS</span><b>runs a known loop</b><small>deterministic sequence</small></div>
  <div v-click><span>AGENT</span><b>chooses the next action</b><small>from bounded feedback</small></div>
</div>

<div class="contract-note" v-click>ONE COMMAND CONTRACT · ENGINEER · TEST · PIPELINE · AGENT</div>

<div class="slide-id">I6 · 07</div>

<!--
Et agentforslag er først værdifuldt, når vi kan lukke loopet. Projektet skal kunne bygges reproducerbart. Vi skal kunne starte en kontrolleret simulation, stimulere en tilstand, observere variable og logbook og sammenligne resultatet med et krav.

DevOps udfører en kendt sekvens deterministisk. Agenten vælger næste afgrænsede handling ud fra feedback. Det er derfor vigtigt, at det samme command contract kan anvendes af en engineer, en test, en pipeline og en agent.

Transition: Det er præcis den rejse, B&R selv har været igennem.
-->

---
layout: default
class: agent-loop-slide
---

<div class="kicker">JOURNEY · 04 MIN</div>

# What B&R<br><span class="accent">learned on the journey</span>

<div class="definition-strip">
  <div class="definition-card" v-click>
    <span>MODEL</span>
    <mdi-brain />
    <b>Patterns + reasoning</b>
  </div>
  <div class="definition-card" v-click>
    <span>DOMAIN CONTEXT</span>
    <mdi-database-search-outline />
    <b>Project + B&R knowledge</b>
  </div>
  <div class="definition-card featured" v-click>
    <span>CLOSED WORKFLOW</span>
    <mdi-account-hard-hat-outline />
    <b>Action + feedback + evidence</b>
  </div>
</div>

<div class="action-loop" v-click>
  <div class="loop-node goal"><span>01</span>CHAT</div>
  <div class="loop-node"><span>02</span>PROJECT CONTEXT</div>
  <div class="loop-node"><span>03</span>B&amp;R KNOWLEDGE</div>
  <div class="loop-node"><span>04</span>AS ACTIONS</div>
  <div class="loop-node"><span>05</span>EVIDENCE</div>
  <div class="loop-return"><mdi-arrow-u-left-top /> repeat / stop</div>
</div>

<div class="slide-id">I7 · 08</div>

<!--
Vi startede med et enkelt spørgsmål: Kan en stærk model hjælpe med Structured Text og et Automation Studio-projekt?

Svaret var hurtigt ja, men kun til et vist punkt. Projektstrukturen, hardware, packages, configurations, libraries, generated artifacts og online behavior kræver domæneviden.

Dokumentation alene er heller ikke nok. Agenten skal have en vej til build, simulation, variable og diagnostics. Den vigtigste læring var, at en god command- og context-grænse kan bruges af mennesker, scripts, automatiske test, CI/CD og forskellige agent harnesses.

Transition: B&R skal ikke eje alle lag. Vi skal eje det lag, hvor vores domæneviden skaber unik værdi.
-->

---
layout: default
class: strategy-slide
---

<div class="kicker">STRATEGY · 05 MIN</div>

# Own the model<br><span class="accent">or own the bridge?</span>

<div class="strategy-grid">
  <div class="strategy-card integrated" v-click>
    <div class="strategy-top"><mdi-layers-triple-outline /><span>VERTICALLY INTEGRATED AI</span></div>
    <ul>
      <li>One selected experience</li>
      <li>Model-specific specialization</li>
      <li>Tight product coupling</li>
      <li>Vendor controls the full stack</li>
    </ul>
  </div>
  <div class="versus" v-click>OR</div>
  <div class="strategy-card portable" v-click>
    <div class="strategy-top"><mdi-bridge /><span>PORTABLE ENGINEERING BRIDGE</span></div>
    <ul>
      <li>Choice of model + harness</li>
      <li>Context supplied at runtime</li>
      <li>Stable domain + tool interfaces</li>
      <li>Customer keeps policy choices</li>
    </ul>
  </div>
</div>

<div class="br-investment" v-click>
  <span>THE OUTCOME</span>
  <strong>repeatable engineering value</strong><i>+</i><strong>portable automation capability</strong>
</div>

<div class="slide-id">I8 · 09</div>

<!--
Nogle leverandører vælger en vertikalt integreret løsning. Det kan give en enkel brugeroplevelse, og det er et legitimt valg.

B&R vælger en anden retning. Modeller og harnesses ændrer sig hurtigere end en normal industriel produktcyklus. Det, B&R kan noget unikt om, er Automation Studio, hardware, motion, libraries, diagnostics og automation workflows.

Derfor bør vores differentierede værdi ligge i broen, som bringer den viden og de handlinger ind i det miljø, kunden ønsker at bruge. Kunden kan vælge model, harness, cloud eller lokal behandling efter opgave, politik og økonomi.

Transition: Hvorfor bør en maskinbygger investere i den workflow?
-->

---
layout: default
class: takeaway-slide
---

<div class="kicker">CUSTOMER VALUE · 02 MIN</div>

# Why should customers<br><span class="accent">care?</span>

<div class="takeaway-layout">
  <div class="takeaway-target">
    <div class="target-ring"><span>01</span></div>
    <div class="target-copy"><small>THE POINT</small><b>Turn knowledge<br>into repeatable<br>engineering.</b></div>
  </div>
  <div class="takeaway-list">
    <div v-click><span>01</span><b>Knowledge becomes executable</b><small>workflows, checks, and cited context</small></div>
    <div v-click><span>02</span><b>Expert attention moves upward</b><small>intent, architecture, validation, and risk</small></div>
    <div v-click><span>03</span><b>Speed can fund quality</b><small>more tests, review, and evidence</small></div>
    <div v-click><span>04</span><b>Capacity becomes more elastic</b><small>less waiting for one specialist</small></div>
  </div>
</div>

<div class="slide-id">I9 · 10</div>

<!--
En agent er en ny abstraktion i softwareudviklingen. Hver gang vi er flyttet op - fra assembler til compiler, libraries og frameworks - er interfaces, architecture, test og debugging blevet vigtigere.

Agentic Engineering gør implementation billigere. Den besparelse kan omsættes til flere test, bedre review og mere dokumenteret kvalitet - ikke kun flere features.

Stabil viden skal flyttes fra enkelte personers hukommelse til ejede workflows, instructions, tests og dokumentation. Eksperten er stadig nødvendig, men kan bruge mere tid på de beslutninger, hvor ekspertisen skaber mest værdi.

Transition: I workshoppen ser vi derfor ikke på en smartere chat. Vi ser på workflowen rundt om den.
-->

---
layout: default
class: workshop-cover dark-slide
---

<div class="part-label">PART 2 · AGENTIC ENGINEERING WORKSHOP · 60 MIN</div>

# Challenge: warnings<br><span class="accent">into governed work</span>

<p class="requirement-copy" v-click>
  Turn build warnings and runtime logbook findings into <strong>classified</strong>,<br>
  <strong>owned</strong>, behavior-preserving work with reviewable evidence.
</p>

<div class="devops-spine" v-click>
  <div><span>01</span><b>COLLECT</b><small>baseline findings</small></div>
  <i></i>
  <div><span>02</span><b>CLASSIFY</b><small>cause · owner · risk</small></div>
  <i></i>
  <div><span>03</span><b>REMEDIATE</b><small>isolated change</small></div>
  <i></i>
  <div><span>04</span><b>PROVE</b><small>regression evidence</small></div>
</div>

<div class="audience-checkin" v-click>
  <span>THE STARTING POINT</span>
  <b>An existing brownfield project.<br>Intended machine behavior must remain unchanged.</b>
  <small>BUILD WARNINGS · RUNTIME LOGBOOK · VERSIONED PROJECT · REVIEWABLE PR</small>
</div>

<div class="slide-id">I10 · 11</div>

<!--
Vi følger et brownfield-eksempel: Projektet har build warnings og runtime findings i logbook. Opgaven er ikke bare at få et grønt skærmbillede. Vi skal forstå hvert finding, bevare den tilsigtede machine behavior og producere en reviewbar ændring med evidens.

Først registrerer vi baseline. Hvad er nyt, og hvad var allerede accepteret? Hvilke configurations er påvirket? Er finding i customer source, generated code, vendor library eller configuration?

Transition: Først gør vi workflowen til den centrale enhed.
-->

---
layout: default
class: devops-cover ai-workshop-cover dark-slide
---

<div class="devops-chapter">01</div>
<img class="devops-logo" src="/br-logo.svg" alt="B&R Industrial Automation">

<div class="kicker">WORKSHOP 01 · 60 MIN</div>
<div class="part-label">LARS JENSEN · AUTOMATION ENGINEER</div>

# It's all about<br><span class="accent">the workflow</span>

<p class="devops-cover-copy">The model proposes. The workflow governs. The evidence earns trust.</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>GOAL</b><small>what outcome matters?</small></div>
  <i></i>
  <div><span>02</span><b>CONTEXT</b><small>what must it know?</small></div>
  <i></i>
  <div><span>03</span><b>OT TOOLS</b><small>how can it act?</small></div>
  <i></i>
  <div><span>04</span><b>FEEDBACK</b><small>what proves done?</small></div>
</div>

<div class="audience-checkin" v-click>
  <span>START WITH THE ROOM</span>
  <b>Which engineering workflow should<br>become repeatable?</b>
  <small>RESEARCH · DEBUGGING · TESTING · DOCUMENTATION · REVIEW · DEPLOYMENT</small>
</div>

<div class="slide-id">W1 · 12</div>

<!--
Den vigtigste enhed er ikke modellen eller agenten. Det er workflowen.

Modellen kan udskiftes. Harnesset kan ændres. Men workflowen definerer, hvordan intent bliver til issues, hvordan ændringer isoleres, hvilken feedback der kræves, og hvem der må godkende resultatet.

Den er et levende engineering-system. Den skal versionsstyres, måles, vedligeholdes og forbedres, præcis som andre dele af jeres platform.
-->

---
layout: default
class: bridge-slide dark-slide
---

<div class="status-badge direction">DIRECTION</div>
<div class="kicker">THE BRIDGE · 03 MIN</div>

# The Automation Studio<br><span class="accent">Agentic Bridge</span>

<div class="architecture">
  <div class="architecture-top" v-click>
    <mdi-application-braces-outline />
    <div><b>COMPATIBLE AGENT HARNESS</b><small>+ selected model</small></div>
  </div>
  <div class="architecture-connectors" v-click><i></i><i></i><i></i></div>
  <div class="architecture-pillars">
    <div class="pillar" v-click>
      <span>01 · WORKFLOW</span>
      <mdi-book-cog-outline />
      <b>Instructions<br>+ skills</b>
    </div>
    <div class="pillar orange" v-click>
      <span>02 · KNOWLEDGE</span>
      <mdi-access-point-network />
      <b>B&amp;R context<br>through MCP</b>
    </div>
    <div class="pillar" v-click>
      <span>03 · EXECUTION</span>
      <mdi-console-line />
      <b>AS-CLI<br>do + observe</b>
    </div>
  </div>
  <div class="architecture-base" v-click>
    <mdi-file-code-outline /> INSPECTABLE PROJECT ARTIFACTS <i>+</i> <mdi-source-branch /> GIT
  </div>
</div>

<div class="bridge-equation" v-click>
  <span>CONTEXT</span><i>+</i><span>TOOLS</span><i>+</i><span>FEEDBACK</span><b>= WORKFLOW</b>
</div>

<div class="slide-id">W2 · 13</div>

<!--
Agentic Bridge er ikke én stor agent og ikke én ny model. Det er en samling af grænseflader og byggesten.


Kombinationen er vigtig: Viden uden handling giver en informeret rådgiver. Handling uden kontekst kan være farligt. Kontekst, værktøjer og feedback i en kontrolleret proces giver engineering.

Brug den godkendte releaseformulering på dagen. Skeln mellem det, der er tilgængeligt, demonstreres, eller stadig er retning.
-->

---
layout: default
class: assets-slide
---

<div class="kicker">BRIDGE ASSETS · 03 MIN</div>

# Your agent contains<br><span class="accent">different assets.</span>

<div class="asset-matrix">
  <div class="asset-row context" v-click>
    <span>01</span><mdi-database-outline /><b>CONTEXT</b><p>Facts needed <strong>now</strong></p><small>project · AS version · current finding</small>
  </div>
  <div class="asset-row instruction" v-click>
    <span>02</span><mdi-sign-direction /><b>INSTRUCTION</b><p>Always-relevant <strong>constraint</strong></p><small>do not edit generated artifacts directly</small>
  </div>
  <div class="asset-row skill" v-click>
    <span>03</span><mdi-format-list-checks /><b>SKILL</b><p>Reusable <strong>procedure</strong></p><small>inspect · change · verify · return evidence</small>
  </div>
  <div class="asset-row tool" v-click>
    <span>04</span><mdi-wrench-cog-outline /><b>TOOL</b><p>Typed <strong>action / observation</strong></p><small>read logbook through AS-CLI</small>
  </div>
</div>

<div class="asset-rule" v-click>
  If it touches reality, make it a <strong>tool with a clear contract.</strong>
</div>

<div class="slide-id">W3 · 14</div>

<!--
Context er de fakta, modellen skal bruge til den aktuelle opgave. En instruction er en kort regel, der skal gælde inden for sit scope. En skill er en genbrugelig flertrinsprocedure. Et tool er den eksekverbare grænseflade, der læser, ændrer eller verificerer noget.

En god tommelfingerregel er: Hvis noget altid skal begrænse adfærden, er det en instruction. Hvis det beskriver en tilbagevendende opgave, er det en skill. Hvis det skal røre virkeligheden, skal det være et tool med en tydelig kontrakt.

Lange instruction-filer er ikke automatisk bedre. De vigtigste regler skal være korte, ejet og versionsstyret. Detaljer hentes, når opgaven kræver dem.
-->

---
layout: default
class: llm-slide
---

<div class="kicker">OFFICIAL KNOWLEDGE · 03 MIN</div>

# Official B&R MCP:<br><span class="accent">knowledge at work</span>

<div class="token-machine">
  <div class="token-input" v-click>
    <small>AGENT QUESTION</small>
    <div><span>What</span><span>does</span><span>this</span><span>warning</span><span>mean?</span></div>
  </div>
  <div class="token-core" v-click>
    <div class="core-rings"><i></i><i></i><i></i><b>MCP</b></div>
    <small>APPROVED CONTEXT INTERFACE</small>
  </div>
  <div class="token-output" v-click>
    <small>CITED RESPONSE</small>
    <b>answer + source</b><span>version-qualified</span>
    <div class="prob-bar"><i></i></div>
  </div>
</div>

<div class="model-definition" v-click>
  MCP gives a harness a standard way to expose <strong>approved resources, tools and context</strong> to an agent.
</div>

<div class="mini-timeline">
  <div v-click><span>01</span>QUESTION</div><i v-click></i>
  <div v-click><span>02</span>RETRIEVE</div><i v-click></i>
  <div v-click><span>03</span>CITE</div><i v-click></i>
  <div v-click><span>04</span>DECIDE NEXT ACTION</div>
</div>

<div class="slide-id">W4 · 15</div>

<!--
MCP er en standardforbindelse mellem harnesset og eksterne data eller tools. Det er ikke en model og ikke en database. Det er protokol-laget, der gør capabilities discoverable.

Værdien af et officielt B&R-interface er governance: Hvilken source kom svaret fra? Hvilken version gælder det for? Har brugeren adgang? Hvornår er informationen opdateret?

Brug kun de source-kategorier, som er godkendt i den aktuelle product communication. Vis citations, version og eventuelle antagelser. MCP er forbindelsen til viden, ikke en garanti for at alle svar automatisk er korrekte.
-->

---
layout: default
class: br-role-slide
---

<div class="kicker">COMMUNITY CONNECTORS · 03 MIN</div>

# Practical knowledge<br><span class="accent">connectors</span>

<div class="br-role-stack">
  <div class="role-layer knowledge" v-click>
    <div class="role-number">03</div>
    <mdi-access-point-network />
    <div><span>COMMUNITY</span><b>AS Help MCP</b><small>search installed Automation Studio help</small></div>
    <div class="micro-status community">COMMUNITY</div>
  </div>
  <div class="role-layer workflow" v-click>
    <div class="role-number">02</div>
    <mdi-forum-outline />
    <div><span>COMMUNITY</span><b>B&amp;R Community MCP</b><small>research discussions and practical experience</small></div>
    <div class="micro-status community">COMMUNITY</div>
  </div>
  <div class="role-layer execution" v-click>
    <div class="role-number">01</div>
    <mdi-book-open-page-variant-outline />
    <div><span>SOURCE AUTHORITY</span><b>Official documentation first</b><small>label source, version, and applicability</small></div>
    <div class="micro-status direction">CONFIRM</div>
  </div>
</div>

<div class="community-rail" v-click>
  <div class="micro-status community">USE CASES</div>
  <span>Q&amp;A · ONBOARDING · SUPPORT PREPARATION · ERROR-CODE RESEARCH</span>
  <small>Show citations and uncertainty. A connector is not automatically an official product.</small>
</div>

<div class="shared-contract" v-click>
  <mdi-book-search-outline /> SEARCH <i>·</i> <mdi-format-quote-close /> CITE <i>·</i> <mdi-source-branch /> VERSION <i>·</i> <mdi-account-check-outline /> VERIFY
  <b>SEPARATE SOURCE AUTHORITY FROM CONNECTOR STATUS</b>
</div>

<div class="status-caution">STATUS LABELS: RECONFIRM BEFORE EVENT</div>
<div class="slide-id">W5 · 16</div>

<!--
Community MCPs viser, hvor hurtigt specialiseret knowledge kan forbindes til et agent workflow.

AS Help MCP kan søge i installeret Automation Studio help og hente konkrete sider eller Help IDs. B&R Community MCP kan supplere med erfaringer og diskussioner.

Men skeln mellem source og connector. En community-maintained MCP, der læser officiel dokumentation, bliver ikke automatisk et officielt B&R-produkt. Vis tydeligt COMMUNITY, og lad den officielle source have højere authority end et forumindlæg.

Brug en syntetisk eller offentlig question. Vis citations, version og uncertainty. Ingen customer cases eller restricted support data.
-->

---
layout: default
class: demo-slide dark-slide as-cli-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR</div>
<div class="kicker">EXECUTION · 04 MIN</div>

# AS-CLI:<br><span class="accent">action + observation</span>

<div class="demo-steps">
  <div v-click><span>01</span><b>SIMULATE</b><small>output: running</small></div>
  <div v-click><span>02</span><b>BUILD</b><small>5 warnings · 0 errors</small></div>
  <div v-click><span>03</span><b>READ PV</b><small>bottleCount → 42 UINT</small></div>
  <div v-click><span>04</span><b>WRITE PV</b><small>main.reset → completed</small></div>
  <div v-click><span>05</span><b>READ LOGBOOK</b><small>arsyslog → messages</small></div>
  <div v-click><span>06</span><b>CREATE PIP</b><small>config ID → artifact</small></div>
</div>

<TerminalCli />

<div class="evidence-boundary" v-click>
  <mdi-information-outline /> Show only operations verified with the event build. Keep physical-target access and <strong>online writes</strong> outside this demo.
</div>

<div class="slide-id">W6 · 17</div>

<!--
AS-CLI er action- og observation-laget. Et command-line interface kan bruges af en engineer, et script, en automatisk test, en CI-pipeline og en agent.

Terminalen på denne slide genbruger den eksisterende evidence-terminal fra implementation-demoen. Den viser command contract, structured output og en kontrolleret ARsim/PVI-observation. Brug de præcise event-testede commands og den præcise AS-CLI- og Automation Studio-version på dagen. Teksten her er en visualiseret placeholder, indtil integration runneren er låst.

Struktureret output er vigtigt. En agent skal ikke aflæse pixels fra en dialog, hvis samme resultat kan leveres som tydelig JSON med explicit errors.

Deployment til fysisk target, online writes, motion og safety-relaterede handlinger kræver en separat least-privilege operating model og kompetent approval.
-->

---
layout: default
class: context-slide dark-slide
---

<div class="kicker">MODEL CHOICE · 03 MIN</div>

# Model choice, data<br><span class="accent">boundary + context</span>

<div class="context-compare">
  <div class="tuning-card" v-click>
    <div class="compare-head"><mdi-tune-vertical /><span>MODEL / FINE-TUNING</span></div>
    <div class="model-weight-visual"><i></i><i></i><i></i><i></i><b>Δ WEIGHTS</b></div>
    <ul>
      <li>Cloud, private endpoint, or local</li>
      <li>Useful for stable repeated behavior</li>
      <li>Not a home for current project facts</li>
      <li>Dedicated evaluation required</li>
    </ul>
  </div>
  <div class="context-card" v-click>
    <div class="compare-head"><mdi-database-arrow-right-outline /><span>RUNTIME CONTEXT</span></div>
    <div class="runtime-context-visual">
      <span>AS VERSION</span><span>PROJECT</span><span>POLICY</span><span>LOGBOOK</span><mdi-arrow-down />
    </div>
    <ul>
      <li>Data residency and retention</li>
      <li>Current facts + variants</li>
      <li>Portable + inspectable</li>
      <li>Start here before fine-tuning</li>
    </ul>
  </div>
</div>

<div class="strategy-sequence" v-click>
  <span>CONTEXT</span><i>+</i><span>TOOLS</span><i>+</i><span>EVALUATIONS</span><mdi-arrow-right /><strong>MEASURED GAP?</strong><mdi-arrow-right /><b>THEN CONSIDER FINE-TUNING</b>
</div>

<div class="slide-id">W7 · 18</div>

<!--
Model choice er en policy- og routingbeslutning, ikke et religionsvalg. En billig model kan være god til classification eller simple implementation tasks. En stærkere reasoning-model kan være relevant til architecture og review. Local models kan være relevante ved særlige data- eller latency-krav.

Fine-tuning er ikke et godt sted at gemme project facts, aktuelle versionsdata eller live machine state. Det hører hjemme i runtime context fra en authoritative source.

Evaluer modeller på jeres egne repræsentative opgaver: correctness, tool selection, latency, cost, data boundary og stopping behavior.
-->

---
layout: default
class: context-window-slide dark-slide
---

<div class="kicker">FINITE CONTEXT · 04 MIN</div>

# Every session is<br><span class="accent">a new colleague</span>

<div class="context-gauge" v-click>
  <div class="gauge-label"><span>HIGH SIGNAL</span><small>"smart zone"</small></div>
  <div class="gauge-track">
    <i class="signal"></i><i class="crowded"></i><i class="degraded"></i>
    <b>goal · files · tools · results · chat · logs · patches · history</b>
  </div>
  <div class="gauge-label right"><span>DEGRADED ATTENTION</span><small>crowded context</small></div>
</div>

<div class="context-constraints">
  <div v-click><span>01</span><mdi-database-off-outline /><b>No durable memory</b><small>by default</small></div>
  <div v-click><span>02</span><mdi-format-align-middle /><b>Lost in the middle</b><small>attention is uneven</small></div>
  <div v-click><span>03</span><mdi-directions-fork /><b>Trajectory + anchoring</b><small>early choices bias later ones</small></div>
  <div v-click><span>04</span><mdi-arrow-collapse-horizontal /><b>Horizontal tasks degrade</b><small>prefer vertical outcomes</small></div>
</div>

<div class="restart-pattern" v-click>
  <div class="trajectory-noise"><span>accumulated trajectory</span><i></i><i></i><i></i><i></i></div>
  <mdi-restart />
  <div class="durable-restart"><span>FRESH SESSION</span><b>spec · issue · Git · evidence</b></div>
</div>

<div class="measurement-note" v-click>NO UNIVERSAL TOKEN THRESHOLD · MEASURE YOUR MODEL + HARNESS</div>

<div class="slide-id">W8 · 19</div>

<!--
Forestil jer, at en dygtig ny kollega møder ind til hver opgave, men uden hukommelse om gårsdagens samtale. Agenten har et context window med instructions, chat, filer, tool results og sit eget svar.

Et større vindue hjælper, men mere kontekst er ikke altid bedre. Information i midten kan få mindre effektiv opmærksomhed, og gamle beslutninger og store logs konkurrerer med de vigtige facts.

En lang session opbygger også trajectory og anchoring. Hvis retningen er forkert, er en frisk session fra en kort spec, et issue og friske artifacts ofte bedre end at argumentere mod hele historikken.

Subagents og sandboxes kan give isolation, men de fjerner ikke handoffs, coordination cost eller approval. Mål den konkrete model, harness og opgave.
-->

---
layout: default
class: enforcement-slide
---

<div class="kicker">TRUST · 02 MIN</div>

# Steering guides.<br><span class="accent">Gates decide.</span>

<div class="control-compare">
  <div class="steering-side" v-click>
    <div class="control-head"><mdi-sign-direction /><span>STEERING / GUARDRAILS</span></div>
    <div class="control-signal probability"><i></i><i></i><i></i><i></i><i></i></div>
    <ul>
      <li>Instructions + examples</li>
      <li>Plans + retrieved context</li>
      <li>Influences the next action</li>
      <li>Can drift in noisy context</li>
    </ul>
    <small>PROBABILISTIC GUIDANCE</small>
  </div>
  <div class="enforcement-side" v-click>
    <div class="control-head"><mdi-shield-lock-outline /><span>DETERMINISTIC ENFORCEMENT</span></div>
    <div class="control-signal gate"><span>INPUT</span><i></i><b>PASS / BLOCK</b></div>
    <ul>
      <li>Compiler + schemas / types</li>
      <li>Tests + policy checks</li>
      <li>Permissions + CI gates</li>
      <li>Returns an enforceable verdict</li>
    </ul>
    <small>REPRODUCIBLE ENCODED CRITERION</small>
  </div>
</div>

<div class="control-bottom" v-click>
  <div><span>USE STEERING</span><b>to guide the trajectory</b></div>
  <mdi-arrow-right />
  <div><span>USE GATES</span><b>to decide whether output may proceed</b></div>
</div>

<div class="final-formula" v-click>
  <span>CONTEXT</span><i>+</i><span>ACTION</span><i>+</i><span>EVIDENCE</span><i>+</i><span>ACCOUNTABILITY</span><b>= AGENTIC ENGINEERING</b>
</div>

<div class="slide-id">W9 · 20</div>

<!--
Instructions og guardrails styrer en probabilistisk model. De er vigtige, men de er adfærdsvejledning - ikke enforcement.

Deterministiske tools kører uafhængigt af agentens opmærksomhed: compiler, schemas, permissions, architecture checks og blocking tests. Det betyder ikke, at checket er komplet eller at testen nødvendigvis er rigtig. Mennesker skal stadig reviewe test-oraklet.

Pull requesten samler requirement, diff, testresultater, assumptions, unresolved risk og reproduktionskommandoer. Build, static checks og behavior tests blokerer. En kompetent person accepterer de strategiske valg og release.
-->

---
layout: default
class: maturity-compare-slide
---

<div class="kicker">ENGINEERING MATURITY · 03 MIN</div>

# Vibe coding vs<br><span class="accent">Agentic Engineering</span>

<div class="maturity-compare">
  <div class="vibe-panel" v-click>
    <div class="panel-label"><mdi-flask-outline /> VIBE CODING</div>
    <div class="maturity-flow"><span>INTENT</span><mdi-arrow-right /><span class="plausible">PLAUSIBLE OUTPUT</span></div>
    <div class="compare-rows">
      <p><b>Context</b><span>lives in chat</span></p>
      <p><b>Feedback</b><span>manual trial + error</span></p>
      <p><b>Review</b><span>every generated line</span></p>
      <p><b>Verdict</b><span>"it looks right"</span></p>
    </div>
    <small>EXCELLENT FOR EXPLORATION</small>
  </div>
  <div class="engineering-panel" v-click>
    <div class="panel-label"><mdi-shield-check-outline /> AGENTIC ENGINEERING</div>
    <div class="maturity-flow"><span>SPEC</span><mdi-arrow-right /><span>ACTION</span><mdi-arrow-right /><span class="evidence">EVIDENCE</span></div>
    <div class="compare-rows">
      <p><b>Context</b><span>versioned / retrieved</span></p>
      <p><b>Feedback</b><span>automated gates</span></p>
      <p><b>Review</b><span>evidence + decisions</span></p>
      <p><b>Verdict</b><span>criteria demonstrated</span></p>
    </div>
    <small>FOR CONTROLLED PRODUCT WORK</small>
  </div>
</div>

<div class="machine-verdict" v-click>
  On a machine, <strong>"it looks right" is not an acceptance criterion.</strong>
</div>

<div class="slide-id">W10 · 21</div>

<!--
Vibe coding kan være effektivt til learning og prototypes. Problemet opstår, når conversational confidence bliver forvekslet med production control.

Agentic Engineering kan bruge præcis den samme model. Forskellen er workflowen: durable context, controlled tools, objective checks, traceable changes og accountable approval.

På en maskine er "det ser rigtigt ud" ikke et acceptkriterium.
-->

---
layout: default
class: accountability-slide dark-slide
---

<div class="kicker">OPERATING MODEL · 03 MIN</div>

# Speed creates a<br><span class="accent">new bottleneck</span>

<div class="speed-meter" v-click>
  <div class="meter-agent"><mdi-robot-industrial-outline /><span>AGENT OUTPUT</span><b>FAST</b></div>
  <div class="meter-track"><i></i></div>
  <div class="meter-human"><mdi-account-search-outline /><span>HUMAN REVIEW</span><b>FINITE</b></div>
</div>

<div class="ownership-levels">
  <div v-click>
    <span>ASSISTANT</span><b>"Here is the code<br>I suggest."</b><small>SUGGESTS</small>
  </div>
  <div v-click>
    <span>AGENT</span><b>"I changed, built,<br>observed, corrected."</b><small>OWNS THE LOOP</small>
  </div>
  <div class="accountable" v-click>
    <span>AGENTIC SYSTEM</span><b>"Approved gates passed.<br>Ready for review."</b><small>RETURNS EVIDENCE</small>
  </div>
</div>

<div class="delegate-line" v-click>
  DELEGATE THE <strong>IMPLEMENTATION LOOP</strong> · RETAIN <strong>INTENT + ACCOUNTABILITY</strong>
</div>

<div class="slide-id">W11 · 22</div>

<!--
Det imponerende ved agents er deres hastighed. Det frustrerende er, at den samme hastighed hurtigt gør engineerens manuelle review til flaskehalsen.

Lad agenten tage operationelt ejerskab for implementation-loopet: implementere, bygge, køre checks, undersøge fejl, rette og forklare resultatet. Mennesket ejer fortsat intent, arkitektur, test-orakel, risiko og release.

Review flytter fra korrekturlæsning af al produceret kode til vurdering af strategiske valg, testene og den evidens, workflowet har produceret. Det virker kun, hvis de deterministiske checks er stærke nok.
-->

---
layout: default
class: testing-slide dark-slide
---

<div class="kicker">TDD + EVALUATION · 03 MIN</div>

# Tests are the<br><span class="accent">sensor system</span>

<div class="baseline-banner" v-click>
  <mdi-radar /> <span>TEST-DRIVEN RULE</span>
  <b>Clear acceptance criteria give agents a fast signal. Establish the regression baseline <strong>before</strong> delegating feature work.</b>
</div>

<div class="test-pyramid">
  <div class="test-level hil" v-click><span>04</span><b>HIL / PHYSICAL</b><small>where risk + fidelity require it</small></div>
  <div class="test-level arsim" v-click><span>03</span><b>ARSIM / SMOKE</b><small>controlled application behavior</small></div>
  <div class="test-level integration" v-click><span>02</span><b>INTEGRATION</b><small>interfaces + module behavior</small></div>
  <div class="test-level unit" v-click><span>01</span><b>UNIT</b><small>local logic</small></div>
</div>

<div class="two-oracles">
  <div v-click>
    <mdi-check-circle-outline />
    <span>PRODUCT TESTS</span>
    <b>Does machine behavior satisfy the requirement?</b>
  </div>
  <div v-click>
    <mdi-robot-confused-outline />
    <span>AGENT EVALUATIONS</span>
    <b>Did it use tools, obey policy, escalate, and stop?</b>
  </div>
</div>

<div class="oracle-warning" v-click>
  <mdi-account-search-outline /> TDD fits agents. Keep SDD <strong>living</strong>, and never make the agent the sole author and judge of its own test oracle.
</div>

<div class="slide-id">W12 · 23</div>

<!--
På et brownfield-projekt skal vi etablere en baseline for den eksisterende adfærd, før agenten ændrer projektet: bygge relevante konfigurationer, køre eksisterende regressioner og beskytte kritiske maskinflows.

Test er ikke kun den sidste kvalitetskontrol. For en agent er test og simulation sensorer i feedback-loopet.

Unit tests kan bevise lokal logik. Integrationstest kan bevise interfaces. ARsim og smoke tests kan bevise defineret applikationsadfærd i et kontrolleret miljø. HIL og fysisk validering tilføjes, hvor risiko og fidelity kræver det.

Agenten kan hjælpe med at skrive test, men den må ikke alene definere sin egen sandhed. Acceptance criteria eller reference behavior skal reviewes uafhængigt.
-->

---
layout: default
class: planning-slide dark-slide
---

<div class="kicker">WORKFLOWS · 04 MIN</div>

# Three workflows<br><span class="accent">everyone needs</span>

<AgentWorkflow />

<div class="slide-id">W13 · 24</div>

<!--
"Recover efter en aksefejl" lyder som en opgave, men det er ikke en specifikation. Agenten kan researche eksisterende states, variable og patterns. Product intent og trade-offs skal tilbage til engineer eller product owner.

Den første workflow handler om at få den rigtige opgave. Den anden kan være unattended, når den er bounded, isolated og har earned trust. Den sidste handler om accountability.

Start human-in-the-loop. Godkend mål, scope og permissions før kørsel. Stop ved tvetydighed, policy-konflikt eller irreversibel handling. Godkend evidence og engineering trade-offs til sidst.
-->

---
layout: default
class: handoff-slide
---

<div class="kicker">WORKFLOW 1 · HITL · SPECIFICATION</div>

# From warning<br>to <span class="accent">issues</span>

<div class="handoff-chain">
  <div class="handoff-artifact spec" v-click>
    <mdi-file-document-edit-outline />
    <span>RESEARCH</span>
    <b>build + runtime<br>warnings</b>
  </div>
  <div class="handoff-arrow" v-click><mdi-arrow-right /></div>
  <div class="handoff-artifact issue" v-click>
    <mdi-checkbox-marked-circle-plus-outline />
    <span>SAFE RESOLUTION</span>
    <b>error code + context<br>without changing intent</b>
  </div>
  <div class="handoff-arrow" v-click><mdi-arrow-right /></div>
  <div class="handoff-artifact pr" v-click>
    <mdi-source-pull />
    <span>ISSUES</span>
    <b>priority + dependencies<br>+ detailed handoff</b>
  </div>
</div>

<div class="vertical-slices">
  <div v-click><span>01</span><b>Research</b><small>agent reads build + logbook output</small></div>
  <div v-click><span>02</span><b>Look up codes</b><small>official, AS Help, and community sources</small></div>
  <div v-click><span>03</span><b>Propose safely</b><small>preserve intended logic</small></div>
  <div v-click><span>04</span><b>Create handoffs</b><small>severity + dependencies + next step</small></div>
</div>

<div class="living-note" v-click>
  Human checkpoint: <strong>does the proposed resolution preserve intent?</strong>
</div>

<div class="slide-id">W14 · 25</div>

<!--
Brug en levende product specification, som fastholder intent, invariants, constraints og den aktuelle definition of done. Lad implementationen udvikle sig gennem korte, verificerede iterationer.

Først registrerer vi baseline. Hvad er nyt, og hvad var allerede accepteret? Er finding i customer source, generated code, vendor library eller configuration?

Issues oprettes efter root cause og coherent remediation. De beskriver intent og evidence, så næste agent ikke skal genopfinde analysen.
-->

---
layout: default
class: demo-slide dark-slide
---

<div class="status-badge demonstrator">BOUNDED AFK</div>
<div class="kicker">WORKFLOW 2 · AFK · IMPLEMENTATION</div>

# Planning to<br><span class="accent">merge</span>

<div class="demo-steps">
  <div v-click><span>01</span><b>PLAN</b><small>open issues + dependencies</small></div>
  <div v-click><span>02</span><b>BRANCH</b><small>isolated checkout + handoff</small></div>
  <div v-click><span>03</span><b>IMPLEMENT</b><small>approved scope + tests</small></div>
  <div v-click><span>04</span><b>REVIEW</b><small>fresh context + guardrails</small></div>
  <div v-click><span>05</span><b>TEST</b><small>clean environment + evidence</small></div>
  <div v-click><span>06</span><b>CANDIDATE</b><small>PR, not silent merge</small></div>
</div>

<div class="demo-proof">
  <div v-click><span>IMPLEMENTER</span><b>fix + targeted test</b><mdi-check /></div>
  <div v-click><span>REVIEWER</span><b>scope + invariants</b><mdi-pause /></div>
  <div v-click><span>TEST RUNNER</span><b>build + regression</b><mdi-check-all /></div>
</div>

<div class="orchestration-grid">
  <div v-click><mdi-playlist-check /><span>FAIL</span><b>Return exact evidence</b><small>review or test finding</small></div>
  <div v-click><mdi-source-branch /><span>PASS</span><b>Prepare candidate</b><small>diff + provenance</small></div>
  <div v-click><mdi-account-check-outline /><span>HUMAN</span><b>Evaluate intent</b><small>risk + oracle + scope</small></div>
  <div v-click><mdi-shield-check-outline /><span>BOUNDARY</span><b>Approve release</b><small>only where authorized</small></div>
</div>

<div class="evidence-boundary" v-click>
  <mdi-information-outline /> Proves the declared workflow checks in its controlled environment. It does not prove physical timing, functional safety, conformity, or every target.
</div>

<div class="slide-id">W15 · 26</div>

<!--
Planneren vælger næste ready issue, vurderer afhængigheder og opretter en isoleret branch eller worktree. Implementeren ændrer kun det godkendte scope, tilføjer relevante tests og returnerer assumptions og evidence.
Reviewer-agenten arbejder fra frisk context og kontrollerer intent, invariants, customer instructions, generated artifacts, test quality, security og unexpected scope. Den er ikke en deterministic oracle.

Test runneren kører i et rent, kontrolleret miljø: relevante configurations, regression suite, targeted tests, ARsim/PVI hvor det gælder, warning comparison og provenance.

Integrationen forbereder en PR eller merge candidate. Den pusher ikke stille til en protected branch. Mennesket vurderer, om evidence er relevant og tilstrækkelig, og om merge eller release er autoriseret.
-->

---
layout: default
class: monday-slide dark-slide
---

<div class="brandbar end-brand">
  <div class="brandmark">B<span>&amp;</span>R</div>
  <div class="brandline">Industrial Automation</div>
</div>

<div class="kicker">MATURITY PATH · 04 MIN</div>

# Three ways to build<br><span class="accent">workflows</span>

<div class="monday-prompts workflow-prompts">
  <div v-click><span>01</span><mdi-format-list-checks /><b>Skills<br>+ HITL</b></div>
  <div v-click><span>02</span><mdi-robot-outline /><b>Agents<br>+ handoffs</b></div>
  <div v-click><span>03</span><mdi-cube-outline /><b>Isolated<br>platform</b></div>
</div>

<div class="monday-path" v-click>
  ENGINEER ORCHESTRATES <i>→</i> ROLES + GATES <i>→</i> SANDBOX + WORKTREE <i>→</i> EARNED TRUST
</div>

<div class="closing-question" v-click>
  <span>START WITH THE LOWEST SUFFICIENT COMPLEXITY</span>
  <b>Which workflow would<br>you make repeatable next?</b>
</div>

<div class="slide-id">W16 · 27</div>

<!--
Start med det simpleste. Skills giver hurtigt værdi og lærer jer, hvilke handoffs og checks workflowen faktisk behøver.

Næste niveau er explicit agents og orchestration i jeres eksisterende harness. Det giver mere repeatability, men kræver stadig approvals.

Et dedicated system kan køre workers i isolerede environments uden løbende desktop-dialoger. Det fjerner ikke governance. Systemet skal selv implementere credentials, network policy, audit og merge gates.

En agent kan hjælpe med at bygge en variant, men harnesset er platformkode. Review security og architecture, og versionér og evaluer resultatet som ethvert andet engineering-produkt.
-->

---
layout: default
class: devops-template-slide
---

<div class="template-badge">NEXT STEPS · 04 MIN</div>
<div class="kicker">WHAT COMES NEXT</div>

# Build the bridge.<br><span class="accent">Start with one workflow.</span>

<div class="devops-objectives">
  <div v-click><span>01 · B&amp;R</span><b>Make the bridge supportable</b><p>Supported editor, version-compatible actions, and cited context.</p></div>
  <div v-click><span>02 · CUSTOMER</span><b>Establish the baseline</b><p>Version the project, build inputs, and brownfield regression checks.</p></div>
  <div v-click><span>03 · WORKFLOW</span><b>Choose one bounded outcome</b><p>Define one objective oracle and one approval boundary.</p></div>
  <div v-click><span>04 · MEASURE</span><b>Earn more autonomy</b><p>Track accepted outcomes, escaped defects, lead time, and review effort.</p></div>
</div>

<div class="template-foot">CONTEXT · TOOLS · EVALUATIONS · APPROVALS · AWESOME-BRDK</div>

<div class="slide-id">W17 · 28</div>

<!--
Vi skal ikke starte med maksimal autonomi. Vi skal starte med én workflow, hvor consequence er bounded, actions er reversible og evidence er stærk.

B&R's opgave er at gøre Automation Studio tilgængelig gennem en robust bridge. Jeres mulighed er at kombinere den med den engineering-proces, der gør jeres maskiner unikke.

AWESOME-BRDK kan være en kilde til inspiration, men status og URL skal bekræftes før eventet. Brug de godkendte releaseformuleringer for bridge, MCP og AS-CLI.

Final line: B&R owns the bridge. You own the workflow. The evidence earns the trust.
-->

---
layout: default
class: devops-break-slide dark-slide
---

<img class="devops-logo" src="/br-logo.svg" alt="B&R Industrial Automation">

<div class="kicker">HANDOFF · 10.30</div>

# Pause the loop.<br><span class="accent">Keep the evidence.</span>

<div class="handoff-window">
  <div class="handoff-stop is-complete" v-click>
    <span>09.30–10.30</span>
    <b>AGENTIC ENGINEERING</b>
    <small>Workflows · bridge · tools · evidence</small>
  </div>
  <div class="handoff-connector" v-click><i></i><mdi-arrow-right /></div>
  <div class="handoff-stop is-break" v-click>
    <span>10.30–11.00</span>
    <b>BREAK + NETWORKING</b>
    <small>Compare one workflow you could make repeatable</small>
  </div>
  <div class="handoff-connector" v-click><i></i><mdi-arrow-right /></div>
  <div class="handoff-stop is-next" v-click>
    <span>11.00–12.15</span>
    <b>DEVOPS IN INDUSTRY</b>
    <small>Mads Andersen · Automation Engineer</small>
  </div>
</div>

<div class="devops-handoff-line" v-click>
  The workflow now needs a reliable engineering track. The same build, test, and evidence foundations become <strong>the subject of Workshop 2.</strong>
  <small>DevOps turns agent-ready actions into a repeatable, reviewable release process.</small>
</div>

<div class="slide-id">D1 · 29</div>

<!--
Vi holder nu en pause på 30 minutter og fortsætter klokken 11.00.

Tag gerne ét spørgsmål med ud i pausen: Hvilken manuel handling i jeres Automation Studio-flow ville give mest værdi, hvis den blev reproducerbar og gav et struktureret resultat?

Den første session har handlet om, hvordan en agent kan bruge kontekst, tools og feedback. Efter pausen vender Mads perspektivet: Hvordan bygger vi selve den reproducerbare engineering- og releaseproces, som både mennesker, CI og agenter kan stole på?
-->

---
layout: default
class: devops-cover ai-workshop-cover dark-slide
---

<div class="devops-chapter">02</div>
<img class="devops-logo" src="/br-logo.svg" alt="B&R Industrial Automation">

<div class="kicker">WORKSHOP 02 · 75 MIN</div>
<div class="part-label">MADS ANDERSEN · AUTOMATION ENGINEER</div>

# DevOps in<br><span class="accent">industry</span>

<p class="devops-cover-copy">What, why and how to get started with B&R</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>VERSION</b><small>known inputs</small></div>
  <i></i>
  <div><span>02</span><b>BUILD</b><small>repeatable output</small></div>
  <i></i>
  <div><span>03</span><b>TEST</b><small>behavioral evidence</small></div>
  <i></i>
  <div><span>04</span><b>RELEASE</b><small>reviewable change</small></div>
</div>

<div class="slide-id">D2 · 30</div>

<!--
Efter pausen tager Mads over med Workshop 2: DevOps i industrien.

Vi bygger videre på det samme command contract, men flytter fokus til den engineering- og releaseproces, som gør ændringer reproducerbare, testbare og reviewbare. Vi følger vejen fra kendte versioner og build inputs til test evidence, et pakket artifact og en kontrolleret release.

Transition: Først ser vi på, hvordan én ændring bevæger sig gennem en reproducerbar pipeline.
-->

---
layout: default
class: devops-intro-slide dark-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">WORKSHOP 02 · ORIENTATION · 04 MIN</div>

# What is<br><span class="accent">DevOps?</span>

<div class="devops-intro-lead">
  <span>DEVELOPMENT + OPERATIONS</span>
</div>

<div class="devops-loop" aria-label="The DevOps loop">
  <div class="devops-loop-stage development">
    <span class="devops-stage-number">01</span>
    <b>DEVELOPMENT</b>
    <ul>
      <li>Plan and code a change</li>
      <li>Build the application</li>
      <li>Test the expected behavior</li>
    </ul>
  </div>
  <div class="devops-loop-connector">
    <img class="devops-inf-logo" src="/DevOpsInfLogo.png" alt="DevOps infinity loop">
    <b>CONTINUOUS<br>FEEDBACK</b>
  </div>
  <div class="devops-loop-stage operations">
    <span class="devops-stage-number">02</span>
    <b>OPERATIONS</b>
    <ul>
      <li>Release and deploy</li>
      <li>Operate the machine</li>
      <li>Monitor real behavior</li>
    </ul>
  </div>
</div>

<br />
<br />
<br />

<div class="devops-beyond">
  <div class="devops-beyond-label"><span>OTHER DISCIPLINES</span><b>NOT COVERED TODAY</b></div>
  <ul aria-label="DevOps disciplines not covered today">
    <li>Automated Setup (IaC)</li>
    <li>Security / DevSecOps</li>
    <li>Issue reporting</li>
    <li>Team culture &amp; collaboration</li>
    <li>Coding Standards</li>
    <li>Documentation</li>
  </ul>
</div>

<div class="devops-intro-note">DevOps covers many practices and disciplines.
Today we focus on the software delivery flow: <strong>Code → Build → Test → Deploy.</strong></div>

<div class="slide-id">W2 · 31</div>
<!--
Title: What is DevOps
Development and Operations
DevOps can be MANY things.
We will not cover everything today
We will focus on CI/CD pipeline and how it can be done with B&R ecosystem
Visualization idea: Standard DevOps infinity symbol with a lot of DevOps related words floating around and then mark those with bold we will focus on
-->

---
layout: default
class: why-devops-slide dark-slide
---

<div class="kicker">WORKSHOP 02 · WHY DEVOPS?</div>

# Why <span class="accent">DevOps?</span>

<div class="why-devops-flow" aria-label="Agentic Engineering connected to DevOps">
  <section class="why-devops-panel agentic">
    <div class="why-devops-panel-label">01 · ACCELERATE CREATION</div>
    <div class="why-devops-panel-title"><mdi-robot-outline /><b>AGENTIC ENGINEERING</b></div>
    <ul>
      <li>Generates code faster</li>
      <li>Makes automated tests easier to create</li>
      <li>Turns ideas into prototypes quickly</li>
    </ul>
  </section>

  <div class="why-devops-bridge" aria-label="Needs guardrails">
    <span class="why-devops-bridge-line"></span>
    <div class="why-devops-bridge-core"><mdi-shield-check-outline /><b>NEEDS<br>GUARDRAILS</b></div>
    <span class="why-devops-bridge-line"></span>
  </div>

  <section class="why-devops-panel devops">
    <div class="why-devops-panel-label">02 · DELIVER RELIABLY</div>
    <div class="why-devops-panel-title"><mdi-source-branch /><b>DEVOPS</b></div>
    <div class="why-devops-practices">
      <div><mdi-hammer-wrench /><span>AUTOMATED BUILD + TEST</span></div>
      <div><mdi-shield-check-outline /><span>QUALITY CHECKS</span></div>
      <div><mdi-source-branch /><span>CONTROLLED DEPLOYMENT</span></div>
      <div><mdi-chart-timeline-variant-shimmer /><span>CONTINUOUS FEEDBACK</span></div>
    </div>
  </section>
</div>

<br />
<br />
<br />
<br />

<div class="why-devops-takeaway">
  <strong>AI helps us create software faster. DevOps helps us deliver it safely.</strong>
</div>

<div class="slide-id">W2 · 31</div>

<!--
Remember: Agentic Engineering accelerates software creation; it does not make the result reliable by itself.

Walk left to right. AI can generate code and tests faster. DevOps adds the build, test, quality, deployment, and feedback controls needed to deliver the result reliably.

"If AI helps us create ten times more software changes, we need a system that can verify, test, and deliver ten times more changes as well. That's where DevOps comes in."

Keep the claim bounded. DevOps provides controls and evidence for delivery; it does not replace engineering judgment, safety validation, or release accountability.
-->

---
layout: default
class: old-way-slide dark-slide
---

<div class="kicker">WORKSHOP 02 · THE OLD WAY · 04 MIN</div>

# Why <span class="accent">change?</span>

<div class="old-way-flow" aria-label="The old manual delivery flow">
  <div class="old-way-step">
    <span class="old-way-number">01</span>
    <mdi-account-hard-hat-outline />
    <b>ENGINEER</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step">
    <span class="old-way-number">02</span>
    <mdi-file-edit-outline />
    <b>CODE CHANGE</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step">
    <span class="old-way-number">03</span>
    <mdi-hammer-wrench />
    <b>BUILD<br>MANUALLY</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step">
    <span class="old-way-number">04</span>
    <mdi-folder-multiple-outline />
    <b>COPY FILES<br>AROUND</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step">
    <span class="old-way-number">05</span>
    <mdi-test-tube />
    <b>RUN TESTS<br>MANUALLY (IF ANY)</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step">
    <span class="old-way-number">06</span>
    <mdi-package-variant-closed-check />
    <b>DEPLOY<br>MANUALLY</b>
  </div>
  <div class="old-way-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <div class="old-way-step warning">
    <span class="old-way-number">07</span>
    <mdi-help-circle-outline />
    <b>HOPE NOTHING<br>BROKE</b>
  </div>
</div>

<div class="old-way-pain">
  <div class="old-way-pain-label"><span>PAIN POINTS</span><b>MANUAL DELIVERY CREATES BLIND SPOTS</b></div>
  <ul>
    <li><mdi-hammer-wrench /><span>Manual build steps</span></li>
    <li><mdi-monitor-multiple /><span>Different PC configurations</span></li>
    <li><mdi-test-tube-empty /><span>Missing tests</span></li>
    <li><mdi-undo-variant /><span>Difficult rollbacks</span></li>
    <li><mdi-help-circle-outline /><span>Hard to know what was deployed</span></li>
  </ul>
</div>

<br />
<br />
<br />
<br />
<br />

<div class="old-way-takeaway">
  <blockquote>As software creation accelerates (due to AI), delivery must become more systematic and automated.</blockquote>
</div>

<div class="slide-id">W2 · 32</div>

<!--
"Traditionally, many software delivery activities have been manual. An engineer makes a change, builds locally, runs a few checks, maybe copies files to a test system, and eventually deploys the result."

"That works when changes are infrequent. But Agentic Engineering changes the equation. If we can generate code, tests, and prototypes much faster, we can also expect more changes, more experiments, and more iterations."

"At that point, the bottleneck is no longer creating software. The bottleneck becomes verifying and delivering it consistently."

"That's why, as software creation accelerates, delivery must become more systematic and automated."
-->

---
layout: default
class: devops-tooling dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS · 03 MIN</div>

<div class="delivery-heading">
  <div>
    <h1>Continuous<br><span class="accent">Integration</span></h1>
    <p>Every change is built and checked while it is still small.</p>
  </div>
  <div class="delivery-definition-mark"><span>CI</span><small>FAST FEEDBACK<br>BEFORE RELEASE</small></div>
</div>

<div class="delivery-flow ci-flow" aria-label="Continuous Integration stages">
  <section class="delivery-flow-stage is-code" aria-label="Code">
    <span class="delivery-flow-number">01</span>
    <mdi-source-commit />
    <b>CODE</b>
    <small>change is versioned</small>
  </section>
  <div class="delivery-flow-arrow" v-click="1" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-ci" v-click="1" aria-label="Build">
    <span class="delivery-flow-number">02</span>
    <mdi-hammer-wrench />
    <b>BUILD</b>
    <small>repeatable output</small>
  </section>
  <div class="delivery-flow-arrow" v-click="2" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-ci" v-click="2" aria-label="Test">
    <span class="delivery-flow-number">03</span>
    <mdi-test-tube />
    <b>TEST</b>
    <small>expected behavior</small>
  </section>
  <div class="delivery-flow-arrow" v-click="3" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-verify" v-click="3" aria-label="Verify">
    <span class="delivery-flow-number">04</span>
    <mdi-shield-check-outline />
    <b>VERIFY</b>
    <small>evidence recorded</small>
  </section>
</div>

<div class="delivery-footer" v-click="3">
  <div class="delivery-footer-label"><mdi-check-circle-outline /><span>CI QUESTION</span></div>
  <strong>Does this change still behave as expected?</strong>
  <small>Fast feedback keeps the change easy to understand and easy to fix.</small>
</div>

<div class="slide-id">W2 · 33</div>

<!--
Continuous Integration means that each change meets the same build and test process. The goal is not to make every change perfect before it moves. The goal is to find problems while the change is still small enough to understand.

The engineer creates and versions the change. The pipeline produces a repeatable output, runs the expected checks, and records evidence. A green result does not replace engineering judgment, but it gives the engineer something objective to review.

Transition: Once software is verified, how do we move it toward a controlled release?
-->

---
layout: default
class: where-agentic-fits dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS · 03 MIN</div>

<div class="delivery-heading">
  <div>
    <h1>Continuous<br><span class="accent">Delivery</span></h1>
    <p>Verified software becomes a traceable candidate for controlled release.</p>
  </div>
  <div class="delivery-definition-mark"><span>CD</span><small>READY TO RELEASE<br>WHEN APPROVED</small></div>
</div>

<div class="delivery-handoff" v-click="1">
  <mdi-check-circle-outline />
  <span>FROM CI</span>
  <strong>VERIFIED ARTIFACT</strong>
  <small>same bits, named and traceable</small>
</div>

<div class="delivery-flow cd-flow" aria-label="Continuous Delivery stages">
  <section class="delivery-flow-stage is-package">
    <span class="delivery-flow-number">05</span>
    <mdi-package-variant-closed />
    <b>PACKAGE</b>
    <small>traceable artifact</small>
  </section>
  <div class="delivery-flow-arrow" v-click="1" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-cd" v-click="1">
    <span class="delivery-flow-number">06</span>
    <mdi-clipboard-check-outline />
    <b>RELEASE CANDIDATE</b>
    <small>ready for decision</small>
  </section>
  <div class="delivery-gate-slot" v-click="2">
    <div class="delivery-gate-arrow" aria-hidden="true"><mdi-arrow-right /></div>
    <div class="delivery-gate">
      <mdi-account-check-outline />
      <span>HUMAN GATE</span>
      <b>release decision</b>
    </div>
  </div>
  <section class="delivery-flow-stage is-deploy" v-click="3">
    <span class="delivery-flow-number">07</span>
    <mdi-upload-network-outline />
    <b>DEPLOY</b>
    <small>controlled target</small>
  </section>
  <div class="delivery-flow-arrow" v-click="4" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-monitor" v-click="4">
    <span class="delivery-flow-number">08</span>
    <mdi-chart-timeline-variant-shimmer />
    <b>MONITOR</b>
    <small>feeds the next change</small>
  </section>
</div>

<div class="delivery-footer" v-click="4">
  <div class="delivery-footer-label"><mdi-shield-check-outline /><span>CD QUESTION</span></div>
  <strong>Can we move this verified artifact safely to its target?</strong>
  <small>Automation prepares the release; people own the decision.</small>
</div>

<div class="slide-id">W2 · 34</div>

<!--
Continuous Delivery begins with the verified result from Continuous Integration. The pipeline packages that result so it can be identified, reproduced, and moved without rebuilding it by hand.

The release candidate is ready, but ready does not mean automatic. A human release decision remains visible between the candidate and the deployment target. After deployment, monitoring tells us what happened in the real environment and provides feedback for the next change.

Transition: CI and CD are most useful when we see them as one connected delivery flow.
-->

---
layout: default
class: devops-pipeline dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS · 05 MIN</div>

<div class="delivery-heading combined-heading">
  <div>
    <h1>CI/CD<br><span class="accent">putting it together</span></h1>
    <p>CI makes changes trustworthy. CD makes verified software releasable.</p>
  </div>
  <div class="delivery-principle"><span>ONE SYSTEM</span><strong>ENGINEER CREATES THE CHANGE.<br>PIPELINE EXECUTES THE PROCESS.</strong></div>
</div>

<div class="delivery-combined-flow" aria-label="The combined DevOps delivery flow">
  <section class="delivery-region ci-region" aria-label="Continuous Integration">
    <div class="delivery-region-heading"><span>CONTINUOUS INTEGRATION</span><small>make the change trustworthy</small></div>
    <div class="delivery-region-flow ci-region-flow">
      <section class="delivery-flow-stage is-code">
        <span class="delivery-flow-number">01</span>
        <mdi-source-commit />
        <b>CODE</b>
        <small>engineer creates</small>
      </section>
      <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-ci">
        <span class="delivery-flow-number">02</span>
        <mdi-hammer-wrench />
        <b>BUILD</b>
        <small>repeatable output</small>
      </section>
      <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-ci">
        <span class="delivery-flow-number">03</span>
        <mdi-test-tube />
        <b>TEST</b>
        <small>expected behavior</small>
      </section>
      <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-verify">
        <span class="delivery-flow-number">04</span>
        <mdi-shield-check-outline />
        <b>VERIFY</b>
        <small>evidence recorded</small>
      </section>
    </div>
  </section>

  <div class="delivery-combined-handoff" v-click="1" aria-hidden="true">
    <span>VERIFIED SOFTWARE<br>BECOMES A<br>RELEASE CANDIDATE</span>
    <mdi-arrow-right />
  </div>

  <section class="delivery-region cd-region" v-click="1" aria-label="Continuous Delivery">
    <div class="delivery-region-heading"><span>CONTINUOUS DELIVERY</span><small>move it with control</small></div>
    <div class="delivery-region-flow cd-region-flow">
      <section class="delivery-flow-stage is-package">
        <span class="delivery-flow-number">05</span>
        <mdi-package-variant-closed />
        <b>PACKAGE</b>
        <small>traceable artifact</small>
      </section>
      <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-cd">
        <span class="delivery-flow-number">06</span>
        <mdi-clipboard-check-outline />
        <b>RELEASE</b>
        <small>ready for decision</small>
      </section>
      <div class="delivery-approval-slot" v-click="1">
        <mdi-arrow-right class="delivery-approval-arrow" aria-hidden="true" />
        <div class="delivery-inline-gate">
          <mdi-account-check-outline />
          <span>RELEASE DECISION</span>
        </div>
      </div>
      <section class="delivery-flow-stage is-deploy" v-click="1">
        <span class="delivery-flow-number">07</span>
        <mdi-upload-network-outline />
        <b>DEPLOY</b>
        <small>controlled target</small>
      </section>
      <div class="delivery-flow-arrow" v-click="1" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-monitor" v-click="1">
        <span class="delivery-flow-number">08</span>
        <mdi-chart-timeline-variant-shimmer />
        <b>MONITOR</b>
        <small>feeds the next change</small>
      </section>
    </div>
  </section>
</div>

<div class="slide-id">W2 · 35</div>

<!--
This is the whole delivery flow in one picture. Continuous Integration takes the engineer's change through build, test, and verification. Continuous Delivery takes the verified result through packaging, release, deployment, and monitoring.

The handoff matters: the pipeline does not silently rebuild a different version. It moves a named artifact forward. The release decision is deliberately visible, because controlled delivery still needs human context and accountability.

Monitoring closes the loop. What happens in the target environment becomes evidence for the next change, so delivery is not a one-way copy operation but a repeatable engineering system.
-->

---
layout: default
class: tooling-matters-slide dark-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">WORKSHOP 02 · TOOLING · 04 MIN</div>

# Why <span class="accent">Tooling Matters</span>

<div class="tooling-subtitle">Automation requires programmable access to engineering tools.</div>

<div class="tooling-access-grid" aria-label="Human-driven and pipeline-driven engineering workflows">
  <section class="tooling-workflow-panel gui-workflow-panel" aria-label="Human-driven workflow">
    <div class="tooling-panel-label">01 · HUMAN-DRIVEN WORKFLOW</div>
    <div class="tooling-panel-title"><mdi-monitor-dashboard /><b>GUI WORKFLOW</b></div>
    <div class="tooling-gui-window" v-click="1">
      <div class="tooling-window-bar"><span>ENGINEERING APPLICATION</span><i></i><i></i><i></i></div>
      <div class="tooling-step-list">
        <div class="tooling-step"><span>01</span><mdi-folder-open-outline /><b>OPEN PROJECT</b><span class="tooling-click-icon"><mdi-cursor-default-click-outline /></span></div>
        <div class="tooling-step-arrow"><mdi-arrow-down /></div>
        <div class="tooling-step"><span>02</span><mdi-tune-variant /><b>SELECT CONFIGURATION</b><span class="tooling-click-icon"><mdi-cursor-default-click-outline /></span></div>
        <div class="tooling-step-arrow"><mdi-arrow-down /></div>
        <div class="tooling-step"><span>03</span><mdi-hammer-wrench /><b>CLICK BUILD</b><span class="tooling-click-icon"><mdi-cursor-default-click-outline /></span></div>
        <div class="tooling-step-arrow"><mdi-arrow-down /></div>
        <div class="tooling-step"><span>04</span><mdi-text-box-search-outline /><b>READ RESULT</b><span class="tooling-click-icon"><mdi-cursor-default-click-outline /></span></div>
        <div class="tooling-step-arrow"><mdi-arrow-down /></div>
        <div class="tooling-step"><span>05</span><mdi-upload-network-outline /><b>CLICK TRANSFER</b><span class="tooling-click-icon"><mdi-cursor-default-click-outline /></span></div>
      </div>
      <div class="tooling-manual-cue"><mdi-cursor-default-click-outline /><span>REPEAT EACH HANDOFF BY HAND</span></div>
    </div>
    <p class="tooling-panel-note" v-click="1">Effective for engineering work, difficult for unattended execution.</p>
  </section>

  <div class="tooling-interface-bridge" v-click="2" aria-label="Complementary interfaces">
    <div class="tooling-bridge-box"><strong>GUI</strong><small>FOR PEOPLE</small></div>
    <mdi-arrow-down />
    <div class="tooling-bridge-caption">SAME<br>ENGINEERING<br>CAPABILITY</div>
    <mdi-arrow-down />
    <div class="tooling-bridge-box is-automation"><strong>CLI / API</strong><small>FOR AUTOMATION</small></div>
  </div>
  <section class="tooling-workflow-panel pipeline-workflow-panel" aria-label="Pipeline-driven workflow">
    <div class="tooling-panel-label">02 · PIPELINE-DRIVEN WORKFLOW</div>
    <div class="tooling-panel-title" v-click="2"><mdi-console-line /><b>PROGRAMMABLE INTERFACE</b></div>
    <div class="tooling-runner-shell" v-click="2">
      <div class="tooling-runner-bar"><mdi-source-branch /><span>PIPELINE RUNNER</span></div>
      <div class="tooling-runner-question"><mdi-help-circle-outline /><b>NEED A<br>PROGRAMMABLE INTERFACE</b></div>
    </div>
    <div class="tooling-cli-boundary" v-click="2">
      <div class="tooling-cli-label"><mdi-console-line /><b>CLI / API</b><small>ONE AUTOMATED BOUNDARY</small></div>
      <div class="tooling-automated-steps">
        <div><mdi-hammer-wrench /><b>BUILD</b></div>
        <div><mdi-test-tube /><b>TEST</b></div>
        <div><mdi-package-variant-closed /><b>PACKAGE</b></div>
        <div><mdi-upload-network-outline /><b>TRANSFER</b></div>
        <div><mdi-file-check-outline /><b>RETURN RESULT</b></div>
      </div>
    </div>
    <p class="tooling-panel-note" v-click="2">The same operation can be executed consistently every time.</p>
  </section>
</div>

<div class="tooling-takeaway" v-click="3">
  <strong>If a human must click it, a pipeline cannot reliably automate it.</strong>
  <small>The capability must also be exposed programmatically.</small>
</div>

<div class="slide-id">W2 · 46</div>

<!--
The build, test, and transfer capabilities may already exist. The challenge is access.

A person can operate a graphical engineering application. A pipeline needs a stable, scriptable, non-interactive interface that can run unattended and return a result that a machine can inspect.

The GUI is not the problem and it does not disappear. It is the interface designed for people. The CLI or API is the complementary interface designed for repeatable automation.

Reveal the complete GUI workflow first. Then introduce the programmable interface together with the complementary GUI and CLI / API bridge and the automated workflow. Finish with the takeaway.
-->

---
layout: default
class: as-cli-intro-slide dark-slide
---

<div class="status-badge general">B&amp;R TOOLING</div>
<div class="kicker">WORKSHOP 02 · AS-CLI · DEMO ROADMAP</div>

# New <span class="accent">as-cli</span>

<div class="as-cli-subtitle">One programmable interface for pipelines, agents, and engineers.</div>

<div class="as-cli-consumer-row" aria-label="Consumers of as-cli">
  <article class="as-cli-consumer-card as-cli-consumer-devops" v-click="1">
    <div class="as-cli-consumer-icon"><mdi-source-branch /></div>
    <div class="as-cli-consumer-copy">
      <span>01 · CONSUMER</span>
      <b>DEVOPS PIPELINE</b>
    </div>
    <mdi-arrow-down class="as-cli-consumer-arrow" />
  </article>
  <article class="as-cli-consumer-card as-cli-consumer-engineer" v-click="1">
    <div class="as-cli-consumer-icon"><mdi-account-hard-hat-outline /></div>
    <div class="as-cli-consumer-copy">
      <span>02 · CONSUMER</span>
      <b>ENGINEER</b>
    </div>
    <mdi-arrow-down class="as-cli-consumer-arrow" />
  </article>
  <article class="as-cli-consumer-card as-cli-consumer-agent" v-click="1">
    <div class="as-cli-consumer-icon"><mdi-robot-outline /></div>
    <div class="as-cli-consumer-copy">
      <span>03 · CONSUMER</span>
      <b>AI AGENT</b>
    </div>
    <mdi-arrow-down class="as-cli-consumer-arrow" />
  </article>
</div>

<div class="as-cli-core-row" aria-label="as-cli programmable tool layer">
  <section class="as-cli-core" aria-label="as-cli command-line tool">
    <div class="as-cli-core-topline"><span>PROGRAMMABLE TOOL LAYER</span><small>B&amp;R ENGINEERING ACCESS</small></div>
    <div class="as-cli-terminal-line"><span>&gt;_</span> <strong>as-cli</strong></div>
    <div class="as-cli-core-name">AUTOMATION STUDIO COMMAND LINE INTERFACE</div>
  </section>
</div>

<div class="as-cli-roadmap" aria-label="as-cli demonstration roadmap">
  <div class="as-cli-capability-grid">
    <article class="as-cli-capability-card as-cli-capability-build" v-click="1">
      <div class="as-cli-capability-head"><span>01</span><mdi-hammer-wrench /></div>
      <b class="as-cli-capability-name">BUILD</b>
      <div class="as-cli-capability-purpose">Compile the project</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> build</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-test" v-click="1">
      <div class="as-cli-capability-head"><span>02</span><mdi-test-tube /></div>
      <b class="as-cli-capability-name">TEST INTERACTION</b>
      <div class="as-cli-capability-purpose">Set inputs and inspect behavior</div>
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> var write ...</span></div>
        <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> var read ...</span></div>
      </div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-package" v-click="1">
      <div class="as-cli-capability-head"><span>03</span><mdi-package-variant-closed /></div>
      <b class="as-cli-capability-name">PACKAGE</b>
      <div class="as-cli-capability-purpose">Create an installation package</div>
      <small class="as-cli-capability-sublabel">PROJECT INSTALLATION PACKAGE</small>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> build pip --output ...</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-transfer" v-click="1">
      <div class="as-cli-capability-head"><span>04</span><span class="as-cli-approval-icon" title="Controlled deployment"><mdi-account-check-outline /></span></div>
      <div class="as-cli-capability-icon"><mdi-upload-network-outline /></div>
      <b class="as-cli-capability-name">TRANSFER</b>
      <div class="as-cli-capability-purpose">Transfer to a target</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> transfer online --ip ...</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-diagnostics" v-click="1">
      <div class="as-cli-capability-head"><span>05</span><mdi-file-search-outline /></div>
      <b class="as-cli-capability-name">DIAGNOSTICS</b>
      <div class="as-cli-capability-purpose">Read controller logbook entries</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as-cli</strong> logbook read</span></div>
    </article>
  </div>
</div>

<div class="slide-id">W2 · 47</div>

<!--
The previous slide established that pipelines and agents need programmable access to engineering tools. This is the role of as-cli.

as-cli is not the DevOps pipeline. The pipeline decides which operations should run and when they should run. as-cli provides a repeatable way to execute the requested engineering operation.

as-cli is also not the AI agent. An agent can decide that it needs to build a project, inspect a variable, or retrieve diagnostics. It still needs a tool to perform the operation.

This is where DevOps and Agentic Engineering meet. Both depend on the same programmable access to engineering capabilities.

Walk through the five cards as the roadmap for the demonstration:

1. Build the Automation Studio project.
2. Write and read runtime variables as part of a test scenario.
3. Create a Project Installation Package.
4. Perform a controlled transfer to a target.
5. Retrieve logbook information for diagnostics and feedback.

Clarify that variable operations and logbook access require a connection to a controller or simulation.

Do not describe variable read and write as a complete test framework. They are building blocks that can be used in an automated test scenario.

Keep the deployment claim bounded. Programmable transfer does not remove engineering approval, machine validation, commissioning, or safety responsibilities.

End with:

"Rather than explain every command, let's use these five pipeline needs as our demo roadmap."
-->

---
layout: default
class: as-cli-demo-slide dark-slide
---

<div class="status-badge demonstrator">DEMO 1 / 3</div>
<div class="kicker">AS-CLI DEVELOPMENT · DEVOPS IN PRACTICE</div>

# How <span class="accent">as-cli</span> tests itself

<div class="as-cli-devops-flow" aria-label="as-cli development test gates">
  <article class="as-cli-devops-gate as-cli-devops-unit">
    <div class="as-cli-devops-gate-head"><span>01 · FAST GATE</span><mdi-test-tube /></div>
    <b class="as-cli-devops-gate-name">PURE UNIT TESTS</b>
    <p>Fast tests of isolated logic, with no live Automation Studio</p>
    <code>.\tests\run-tests.ps1</code>
    <br />
  </article>
  <div class="as-cli-devops-arrow" aria-hidden="true"><span>THEN</span><mdi-arrow-right /></div>
  <article class="as-cli-devops-gate as-cli-devops-integration">
    <div class="as-cli-devops-gate-head"><span>02 · REAL SYSTEM</span><mdi-monitor-eye /></div>
    <b class="as-cli-devops-gate-name">INTEGRATION TESTS</b>
    <p>Slower tests that verify the complete system up against an Automation Studio simulator </p>
    <code>.\tests\run-integration-tests.ps1</code>
    <br />
  </article>
</div>

<div class="as-cli-devops-result">
  <mdi-shield-check-outline />
  <span>PASS / FAIL</span>
  <strong>Protects quality. Builds confidence that nothing breaks.</strong>
</div>

<div class="slide-id">W2 · 48</div>

<!--
Demo 1 shows the DevOps loop used to develop as-cli itself.

Start with the fast gate. run-tests.ps1 locates the .NET Framework csc.exe compiler, compiles a curated
SDK-free subset of production code with the hand-rolled test harness, and runs it in seconds. This is the
default check for every change.

Then show the real-system gate. run-integration-tests.ps1 rebuilds as-cli unless asked to reuse the binary,
drives the committed Automation Studio integration fixture through ARsim and PVI, checks design-time and
online behavior, and cleans up the daemon and simulator. It is slower and local because the B&R SDK is required.

The point is the separation of feedback speed from system fidelity: fast proof first, real-system proof before
an SDK-bound change is ready for review. Do not imply that the integration runner is hosted CI; the repository
has no hosted CI because Automation Studio is not available on a runner.
-->

---
layout: default
class: machine-demo-slide dark-slide
---

<div class="status-badge demonstrator">DEMO 2 / 3</div>
<div class="kicker">FULL CI/CD PIPELINE · TEST PROJECT</div>

# The <span class="accent">orange</span> juice machine

<div class="machine-demo-subtitle">Demo Project our GitHub workflow will build, test, package and deploy</div>

<div class="machine-demo-meta">
  <span>PROJECT IN GITHUB</span>
  <span class="machine-demo-path">.\EventAiAndDevOps\DevOps\DevOpsDemo</span>
</div>

<div class="machine-demo-machine">
  <BottleConveyor state="running" :count="42" />
</div>

<div class="slide-id">W2 · 49</div>

<!--
Demo 2 is the handoff into the live full-pipeline demonstration.

Show the conveyor as the example machine represented by the DevOpsDemo project. It is a visual
demonstrator, not an official B&R machine template. Let the running animation establish the machine
context, then Alt+Tab to the repository and show how one push or GitHub tag starts the workflow.

Do not explain the workflow from this slide. The live repository view carries the build, test, release,
package, and deployment sequence.
-->

---
layout: default
class: playwright-hmi-demo-slide dark-slide
---

<div class="status-badge demonstrator">DEMO 3 / 3</div>
<div class="kicker">FULL CI/CD PIPELINE · HMI FEEDBACK</div>

# Test the HMI<br><span class="accent">like a user</span>

<div class="playwright-hmi-subtitle">Playwright turns browser actions into repeatable HMI feedback.</div>

<div class="playwright-hmi-flow">
  <section class="playwright-hmi-runner" aria-label="Playwright CLI test runner">
    <div class="playwright-hmi-panel-head"><span>PLAYWRIGHT CLI</span><mdi-test-tube /></div>
    <div class="playwright-hmi-command"><span>&gt;</span> npm run test:hmi <b>-- --headed --reporter=line</b></div>
    <div class="playwright-hmi-checks">
      <div><span>01</span><b>OPEN</b><small>launch the HMI in a real browser</small></div>
      <div><span>02</span><b>INTERACT</b><small>follow a meaningful operator workflow</small></div>
      <div><span>03</span><b>ASSERT</b><small>check controls, state, and feedback</small></div>
    </div>
    <div class="playwright-hmi-runner-foot"><span>REPEATABLE CHECK</span><b>BROWSER + RUNTIME</b></div>
  </section>

  <div class="playwright-hmi-bridge" aria-label="Browser and PLC handoff">
    <span>DRIVES +<br>OBSERVES</span>
    <mdi-arrow-right />
  </div>

  <section class="playwright-hmi-browser" aria-label="Chrome HMI session">
    <div class="playwright-hmi-browser-bar"><span>CHROME · 127.0.0.1:81</span><i></i><i></i><i></i></div>
    <div class="playwright-hmi-screen">
      <div class="playwright-hmi-screen-nav"><span>HMI SESSION</span><b>OPERATOR</b></div>
      <div class="playwright-hmi-screen-body">
        <div class="playwright-hmi-state-tile"><small>MACHINE STATUS</small><strong>READY</strong><span>VISIBLE FEEDBACK</span></div>
        <div class="playwright-hmi-counter-tile"><small>TEST SIGNAL</small><b>OK</b><span>EXPECTED RESULT</span></div>
      </div>
      <div class="playwright-hmi-screen-actions"><span>START</span><span>STOP</span><b>PASS</b></div>
    </div>
  </section>
</div>

<div class="playwright-hmi-proof" aria-label="HMI test evidence">
  <div><span>RESULT</span><strong><mdi-shield-check-outline /> PASS / FAIL</strong></div>
  <div><span>OBSERVATION</span><strong>VISIBLE FEEDBACK</strong></div>
  <div><span>ASSERTION</span><strong>EXPECTED RESULT</strong></div>
  <div><span>INTERFACE</span><strong>REAL BROWSER</strong></div>
</div>

<div class="slide-id">W2 · 50</div>

<!--
Demo 3 introduces browser-level verification for an industrial HMI.

Run the Playwright CLI against the HMI in headed mode so the audience can see the test and the application together.

The general pattern is simple: open the HMI in a real browser, perform a meaningful user workflow, and assert the visible controls, state, and feedback. A runtime interface such as as-cli can provide setup and observation alongside the browser test.

Point out the boundary. Browser automation proves the declared HMI workflow in its controlled environment. It does not prove physical timing, functional safety, or every target variant.

Transition: the machine is visible, the pipeline is concrete, and the user-facing layer now produces evidence too.
-->

---
layout: default
class: devops-definition-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">DEFINITION · 04 MIN</div>

# DevOps can be<br><span class="accent">many things.</span>

<div class="devops-spectrum">
  <div class="spectrum-line"></div>
  <div class="spectrum-point manual" v-click>
    <span>01</span>
    <mdi-account-hard-hat-outline />
    <b>MANUAL + VISIBLE</b>
    <small>shared checklist<br>known handoff</small>
  </div>
  <div class="spectrum-point scripted" v-click>
    <span>02</span>
    <mdi-console-line />
    <b>SCRIPTED</b>
    <small>one command<br>repeatable steps</small>
  </div>
  <div class="spectrum-point governed" v-click>
    <span>03</span>
    <mdi-shield-check-outline />
    <b>GOVERNED</b>
    <small>gates + evidence<br>approved release</small>
  </div>
</div>

<div class="definition-focus" v-click>
  <span>TODAY'S FOCUS</span>
  <b>VERSION · BUILD · TEST · EVIDENCE · RELEASE</b>
</div>

<div class="definition-note" v-click>
  DevOps is the <strong>practice of making change visible, repeatable, and accountable.</strong>
</div>

<div class="slide-id">W2 · 32</div>

<!--
Remember: DevOps is a set of practices. It can be a small manual checklist, a script used by one engineer, or a fully gated release process.

Do not turn this into a tool survey. The common thread is collaboration, automation where it helps, fast feedback, and clear responsibility. The smallest useful version is often a visible, repeatable handoff.

Reveal the three points from left to right. Then illuminate the five stages we will use today. This keeps the definition broad while making the workshop concrete.

Transition: AI changes the economics of this workflow, but it does not remove the need for the workflow.

Status: General DevOps principle.
-->

---
layout: default
class: why-now-slide dark-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">WHY NOW · 05 MIN</div>

# Why talk about<br>DevOps <span class="accent">now?</span>

<div class="why-now-flow">
  <div class="why-now-block agent" v-click>
    <mdi-robot-outline />
    <span>AGENTIC ENGINEERING</span>
    <b>More changes<br>arrive faster</b>
    <small>code · tests · documentation · fixes</small>
  </div>
  <div class="why-now-connector" v-click><mdi-arrow-right /></div>
  <div class="why-now-block devops" v-click>
    <mdi-radar />
    <span>DEVOPS</span>
    <b>More quality<br>signals keep pace</b>
    <small>build · test · evidence · approval</small>
  </div>
  <div class="why-now-connector" v-click><mdi-arrow-right /></div>
  <div class="why-now-outcome" v-click>
    <mdi-shield-check-outline />
    <span>THE OUTCOME</span>
    <b>Trustworthy<br>industrial change</b>
  </div>
</div>

<div class="ai-economics" v-click>
  <span>AI LOWERS THE COST OF DRAFTING TESTS.</span>
  <strong>IT DOES NOT LOWER THE COST OF TRUSTING THE ORACLE.</strong>
</div>

<div class="why-now-rail" v-click>
  WRITE MORE TESTS <i>+</i> VERIFY THE ORACLE <i>+</i> REVIEW THE RELEASE
</div>

<div class="slide-id">W2 · 33</div>

<!--
Remember: AI can increase the rate of change and lower the cost of drafting tests. DevOps keeps the feedback and governance signal strong enough to review that change.

Connect directly to Workshop 1: the model proposes and the workflow governs. A capable agent may draft a test, but it cannot make an acceptance criterion true. Someone must own the oracle and the release decision.

Reveal the agent block, the DevOps block, and the outcome. Then show the bottom line: use the new capacity for more tests, better evidence, and stronger review rather than only more output.

Transition: Industrial delivery adds consequences that an ordinary web release does not.

Status: General principle connected to the retained Agentic Engineering workshop. No productivity percentage or AI capability claim.
-->

---
layout: default
class: industrial-difference-slide
---

<div class="status-badge illustrative">ILLUSTRATIVE</div>
<div class="kicker">CONTEXT · 04 MIN</div>

# A machine release has a<br><span class="accent">physical consequence.</span>

<div class="delivery-compare" v-click>
  <div class="delivery-head"><span></span><b>WEB / SERVICE DELIVERY</b><b>MACHINE / INDUSTRIAL DELIVERY</b></div>
  <div class="delivery-row"><span>CHANGE</span><p>source + configuration</p><p>source + configuration + target variant</p></div>
  <div class="delivery-row"><span>FEEDBACK</span><p>deploy, observe, roll back</p><p>simulation, target state, diagnostics, physical behavior</p></div>
  <div class="delivery-row"><span>RISK</span><p>service or data impact</p><p>motion, process, equipment, and safety boundary</p></div>
  <div class="delivery-row"><span>LIFETIME</span><p>frequent platform change</p><p>long-lived assets and maintained variants</p></div>
  <div class="delivery-row"><span>DECISION</span><p>ship when the service gate passes</p><p>release with competent engineering accountability</p></div>
</div>

<div class="industrial-rule" v-click>
  Source history is necessary.<br><strong>It is not machine behavior.</strong>
</div>

<div class="slide-id">W2 · 34</div>

<!--
Remember: An industrial release is source plus runtime, state, hardware, and responsibility. Source history alone cannot tell us how a machine will behave.

Use this as a comparison, not a claim that all web or industrial systems work identically. Industrial systems add hardware and firmware dependencies, long-lived variants, physical state, motion, process risk, and a more explicit safety boundary.

Reveal the rows from change to decision. Ask which row creates the biggest difference in the audience's organization.

Transition: The practical response is a chain of proof from version to release.

Status: Illustrative comparison. Automation Studio-specific capabilities and safety terminology must be confirmed for the event.
-->

---
layout: default
class: engineering-loop-slide dark-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">THE ENGINEERING LOOP · 07 MIN</div>

# One change.<br><span class="accent">Five proofs.</span>

<div class="engineering-chain">
  <div class="chain-stage" v-click>
    <span>01</span><mdi-source-commit /><b>VERSION</b><small>what changed?</small><em>commit / tag</em>
  </div>
  <i v-click><mdi-arrow-right /></i>
  <div class="chain-stage" v-click>
    <span>02</span><mdi-hammer-wrench /><b>BUILD</b><small>can it be made?</small><em>declared output</em>
  </div>
  <i v-click><mdi-arrow-right /></i>
  <div class="chain-stage" v-click>
    <span>03</span><mdi-test-tube /><b>TEST</b><small>does it behave?</small><em>test result</em>
  </div>
  <i v-click><mdi-arrow-right /></i>
  <div class="chain-stage" v-click>
    <span>04</span><mdi-file-chart-outline /><b>EVIDENCE</b><small>what happened?</small><em>traceable record</em>
  </div>
  <i v-click><mdi-arrow-right /></i>
  <div class="chain-stage release" v-click>
    <span>05</span><mdi-package-variant-closed-check /><b>RELEASE</b><small>may it proceed?</small><em>approved candidate</em>
  </div>
</div>

<div class="approval-gate" v-click>
  <mdi-account-check-outline />
  <span>APPROVAL GATE</span>
  <b>evidence informs a human engineering decision</b>
</div>

<div class="chain-question" v-click>
  What would be invisible if we skipped this stage?
</div>

<div class="slide-id">W2 · 35</div>

<!--
Remember: Each stage should produce an artifact that makes the next decision inspectable. Approval sits between evidence and release.

Walk one hypothetical change across the chain. Version tells us what changed. Build tells us whether the declared inputs can produce an output. Test observes behavior. Evidence records what happened. Release is the permission decision, not an automatic consequence of a green check.

Reveal the five stages left to right, then the approval gate. Ask the room what becomes invisible when any one stage is omitted.

Transition: The first hard question is what makes the build repeatable.

Status: General industrial DevOps pattern mapped to the demonstrator.
-->

---
layout: default
class: build-inputs-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">REPEATABLE BUILDS · 05 MIN</div>

# Git is not<br><span class="accent">the build.</span>

<div class="build-contract" v-click>
  <div class="build-source">
    <mdi-source-branch />
    <span>GIT</span>
    <b>history + source</b>
    <small>what changed?</small>
  </div>
  <div class="build-arrow"><mdi-arrow-right /></div>
  <div class="build-engine">
    <mdi-hammer-wrench />
    <span>BUILD CONTRACT</span>
    <b>known inputs<br>declared action</b>
    <small>what exactly runs?</small>
  </div>
  <div class="build-arrow"><mdi-arrow-right /></div>
  <div class="build-output">
    <mdi-package-variant-closed />
    <span>OUTPUT</span>
    <b>artifact + result</b>
    <small>what was produced?</small>
  </div>
</div>

<div class="build-input-rail" v-click>
  <div><span>AS VERSION</span><small>editor / runtime context</small></div>
  <div><span>PACKAGES</span><small>technology dependencies</small></div>
  <div><span>TARGET / CONFIG</span><small>declared machine variant</small></div>
  <div><span>LIBRARIES</span><small>source and binaries</small></div>
  <div><span>TOOLING</span><small>same action contract</small></div>
</div>

<div class="build-rule" v-click>
  <strong>SOURCE + HISTORY</strong> tells us what changed.<br>
  <span>THE BUILD CONTRACT tells us what to run.</span>
</div>

<div class="slide-id">W2 · 36</div>

<!--
Remember: Git preserves source and history. A repeatable build also needs a declared environment, project inputs, target, dependencies, and build action.

Explain why the same branch can behave differently when the Automation Studio version, technology packages, target configuration, generated artifacts, libraries, or tooling differ. Do not imply that adding every folder to Git automatically solves this.

Reveal Git, the build contract, and the output. Then reveal the input rail as the missing context. The checked-in project metadata is a demonstrator observation, not a supported-version promise.

Transition: Once the input set is declared, we need enough provenance to explain the output.

Status: General principle with repository-observed input categories. No bit-for-bit reproducibility claim.
-->

---
layout: default
class: provenance-slide dark-slide
---

<div class="status-badge illustrative">ILLUSTRATIVE</div>
<div class="kicker">PROVENANCE · 04 MIN</div>

# Make the output<br><span class="accent">explainable.</span>

<div class="provenance-lanes">
  <div class="provenance-lane same" v-click>
    <div class="lane-label"><span>DECLARED RECIPE A</span><b>same input set</b></div>
    <div class="lane-flow"><span>INPUT SET</span><mdi-arrow-right /><span>BUILD</span><mdi-arrow-right /><strong>OUTPUT A</strong></div>
    <small>record version · target · packages · action · result</small>
  </div>
  <div class="provenance-lane hidden" v-click>
    <div class="lane-label"><span>UNDECLARED INPUT</span><b>same source, different context</b></div>
    <div class="lane-flow"><span>SOURCE</span><mdi-arrow-right /><span>BUILD?</span><mdi-arrow-right /><em>UNKNOWN OUTPUT</em></div>
    <small>the procedure may look repeatable while the result is unexplained</small>
  </div>
</div>

<div class="provenance-record" v-click>
  <div><span>INPUT SET</span><b>what was known?</b></div>
  <div><span>OUTPUT</span><b>what was produced?</b></div>
  <div><span>EVIDENCE</span><b>what was observed?</b></div>
  <div><span>PROVENANCE</span><b>who, when, how?</b></div>
</div>

<div class="provenance-rule" v-click>
  Repeatability is a <strong>declared recipe plus provenance.</strong><br>
  Reproducibility is something we demonstrate and measure.
</div>

<div class="slide-id">W2 · 37</div>

<!--
Remember: Repeatability is a declared recipe plus provenance. Reproducibility is not a feeling and does not automatically mean byte-for-byte identity.

Contrast the two lanes. In the first, the input set and action are recorded. In the second, an undeclared environment detail makes the output hard to explain even if the source is identical.

Reveal recipe, output, and evidence. Only claim identical bytes, hashes, or measured equivalence if the event build has actually demonstrated and approved it.

Transition: With controlled inputs, test behavior at the cheapest faithful layer.

Status: General principle with an illustrative build pattern. No benchmark or output-identity claim.
-->

---
layout: default
class: test-ladder-slide dark-slide
---

<div class="status-badge verify">VERIFY EVENT SETUP</div>
<div class="kicker">TEST STRATEGY · 06 MIN</div>

# Test behavior at the<br><span class="accent">cheapest faithful layer.</span>

<div class="test-ladder-new">
  <div class="test-ladder-axis"><span>FASTER FEEDBACK</span><i></i><span>HIGHER FIDELITY</span></div>
  <div class="test-ladder-step unit" v-click><span>01</span><b>LOGIC</b><small>local rules and calculations</small></div>
  <div class="test-ladder-step integration" v-click><span>02</span><b>INTEGRATION</b><small>interfaces and module contracts</small></div>
  <div class="test-ladder-step simulation" v-click><span>03</span><b>AUTOMATION STUDIO SIMULATION</b><small>controlled application behavior</small></div>
  <div class="test-ladder-step hil" v-click><span>04</span><b>HIL / HARDWARE</b><small>real hardware where fidelity requires it</small></div>
</div>

<div class="simulation-callout" v-click>
  <mdi-speedometer />
  <div><span>LONG PRODUCTION BATCH</span><b>A faster simulation clock can shorten feedback.</b><small>Confirm the supported method and observed event setup before presenting a command or factor.</small></div>
</div>

<div class="test-boundary" v-click>
  Simulation evidence is valuable.<br><strong>It is not automatically physical or safety validation.</strong>
</div>

<div class="slide-id">W2 · 38</div>

<!--
Remember: Choose the fastest layer that is faithful enough for the risk. Add simulation, HIL, or physical validation when fidelity requires it.

Explain that long production batches are often a poor fit for manual testing. In a controlled simulation setup, a faster simulation clock can make the feedback loop practical. The exact method, factor, supported setup, and event wording must be verified before showing a command.

Reveal logic and integration first, then simulation, then HIL or hardware. Make the boundary explicit: simulation can expose application behavior; it does not by itself prove physical timing, functional safety, conformity, or every target.

Transition: The most useful integration tests assert contracts at the machine boundary.

Status: General testing principle. Simulation acceleration and HIL wording are event-specific details to verify.
-->

---
layout: default
class: integration-contract-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR EXAMPLES</div>
<div class="kicker">INTEGRATION TESTS · 08 MIN</div>

# Integration tests that<br><span class="accent">pay rent.</span>

<div class="contract-table">
  <div class="contract-table-head"><span>SCENARIO</span><span>STIMULUS</span><span>ORACLE</span></div>
  <div class="contract-row" v-click><b>START / STOP / ABORT / CLEAR</b><span>command a state transition</span><strong>modules reach the expected state</strong></div>
  <div class="contract-row" v-click><b>BOTTLE FLOW</b><span>sensor or simulated bottle event</span><strong>one cycle, one count, no silent loss</strong></div>
  <div class="contract-row" v-click><b>STATION HANDSHAKE</b><span>filler + capper ready / start</span><strong>both complete before the count advances</strong></div>
  <div class="contract-row fault-row" v-click><b>FAULT + RECOVERY</b><span>inject a bounded axis fault</span><strong>abort, hold, clear, resume, complete</strong></div>
  <div class="contract-row" v-click><b>LOGBOOK</b><span>read runtime findings</span><strong>no unexpected error entries</strong></div>
</div>

<div class="contract-question" v-click>
  Which row would catch a real regression in your machine?
</div>

<div class="contract-footnote">
  ASSERT OBSERVABLE BEHAVIOR · NOT A SCREENSHOT
</div>

<div class="slide-id">W2 · 39</div>

<!--
Remember: A useful integration test stimulates an interface and checks observable machine behavior. It is not a screenshot or a UI click path.

Use the checked-in demonstrator as the concrete example. The repository runner checks state transitions, bottle flow, filler/capper coordination, a fault and recovery path, and runtime logbook results. Keep exact task names and variable paths in the presenter notes until the canonical runner is confirmed.

Reveal the rows one at a time. Ask the room which row would catch a regression in their own machine. Emphasize that the oracle must describe behavior that matters to the requirement.

Transition: A pass becomes useful only when it leaves evidence that a human can evaluate.

Status: General testing method with repository demonstrator examples. It is not customer evidence.
-->

---
layout: default
class: approval-slide dark-slide
---

<div class="status-badge general">GOVERNANCE PRINCIPLE</div>
<div class="kicker">EVIDENCE · 03 MIN</div>

# A green test is not<br><span class="accent">release approval.</span>

<div class="approval-sequence">
  <div v-click><span>01</span><mdi-file-document-check-outline /><b>REQUIREMENT</b><small>what must be true?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>02</span><mdi-ruler-square /><b>ORACLE</b><small>how do we know?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>03</span><mdi-check-all /><b>RESULT</b><small>what happened?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>04</span><mdi-file-chart-outline /><b>EVIDENCE</b><small>can we review it?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div class="human-decision" v-click><span>05</span><mdi-account-check-outline /><b>HUMAN DECISION</b><small>may it proceed?</small></div>
</div>

<div class="approval-verdict" v-click>
  <span>PASS</span><i>≠</i><strong>PERMISSION</strong>
</div>

<div class="approval-boundaries" v-click>
  <div><mdi-shield-check-outline /><b>REVIEW INTENT</b><small>scope · assumptions · invariants</small></div>
  <div><mdi-account-hard-hat-outline /><b>RETAIN ACCOUNTABILITY</b><small>safety · risk · release authority</small></div>
  <div><mdi-robot-outline /><b>BOUND THE AGENT</b><small>suggests and acts within permission</small></div>
</div>

<div class="slide-id">W2 · 40</div>

<!--
Remember: Tests provide evidence for a human engineering decision. They do not transfer safety or release accountability to an agent or pipeline.

Walk from requirement to oracle, result, evidence, and human decision. A wrong oracle can produce a green result that says very little. Review the intent, scope, assumptions, invariants, and safety boundary separately.

Reveal the sequence, then the PASS is not PERMISSION statement. Use the three lower boundaries to make the operating model explicit.

Transition: Now apply the chain to one small industrial vertical slice.

Status: General governance principle. This is not a certification or safety claim.
-->

---
layout: default
class: conveyor-intro-slide dark-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR</div>
<div class="kicker">VERTICAL SLICE · 02 MIN</div>

# One conveyor.<br><span class="accent">Two stations.</span>

<div class="conveyor-intro-layout">
  <div class="conveyor-story">
    <div class="conveyor-story-line" v-click><span>01</span><b>BOTTLE IN</b><small>observable input</small></div>
    <div class="conveyor-story-line" v-click><span>02</span><b>FILL</b><small>station ready + done</small></div>
    <div class="conveyor-story-line" v-click><span>03</span><b>CAP</b><small>station ready + done</small></div>
    <div class="conveyor-story-line highlighted" v-click><span>04</span><b>COUNT</b><small>cycle evidence</small></div>
    <div class="conveyor-demo-note" v-click>
      <span>VISUAL WORKSHOP DEMONSTRATOR</span>
      <b>Not an official B&R machine template.</b>
    </div>
  </div>
  <div class="conveyor-stage-large" v-click>
    <BottleConveyor state="running" :count="42" />
  </div>
</div>

<div class="conveyor-contract" v-click>
  Before we run it: name three pass criteria.
</div>

<div class="slide-id">W2 · 41</div>

<!--
Remember: One vertical slice makes version, build, test, and evidence tangible.

This visual represents the checked-in conveyor, filler, and capper modules. It is a presentation demonstrator, not an official B&R machine reference. The current control logic coordinates station readiness and completion from the conveyor flow; the spatial layout is a communication device.

Reveal bottle input, filler, capper, and count. Ask the room for three pass criteria before running the clean path. Good answers should be observable: count, state, station completion, or logbook result.

Transition: Run the clean path and collect the evidence instead of relying on the animation.

Status: Demonstrator-only visualization.
-->

---
layout: default
class: clean-demo-slide dark-slide
---

<div class="status-badge demonstrator">LIVE / FALLBACK</div>
<div class="kicker">DEMO · CLEAN PATH · 06 MIN</div>

# Can we prove<br><span class="accent">one clean run?</span>

<div class="clean-demo-layout">
  <div class="demo-contract-list">
    <div v-click><span>01</span><b>INSPECT</b><small>project + configuration</small></div>
    <div v-click><span>02</span><b>BUILD</b><small>declared simulation target</small></div>
    <div v-click><span>03</span><b>START + CONNECT</b><small>simulator + observation channel</small></div>
    <div v-click><span>04</span><b>RUN</b><small>machine state + counter</small></div>
    <div v-click><span>05</span><b>CAPTURE</b><small>result + logbook evidence</small></div>
  </div>

  <div class="clean-demo-machine" v-click>
    <BottleConveyor state="running" :count="42" />
  </div>
</div>

<div class="demo-evidence-strip" v-click>
  <span>DECLARED INPUTS</span><i></i><span>BUILD RESULT</span><i></i><span>STATE / COUNT</span><i></i><span>LOGBOOK</span>
</div>

<div class="demo-fallback-note">
  Use the exact event-tested command transcript live; use the same evidence bundle in the recording.
</div>

<div class="slide-id">W2 · 42</div>

<!--
Remember: A controlled run is valuable because it leaves observable state, behavior, and evidence from one declared sequence.

Follow the repository-tested shape: inspect the project, build and start the simulator, wait for readiness, connect through the observation channel, start the machine, observe state and count, and capture the logbook result. Insert only the exact event-tested commands and versions before the event.

Reveal one operation at a time. If the live setup is unavailable, play the recorded capture or show a static evidence frame. The fallback must tell the same story and must not invent timings or output.

Transition: The same contract should make a bounded failure observable.

Status: Event-tested demonstrator once the exact event environment is confirmed; placeholder until then.
-->

---
layout: default
class: fault-demo-slide dark-slide
---

<div class="status-badge demonstrator">REPOSITORY DEMONSTRATOR</div>
<div class="kicker">DEMO · FAULT + RECOVERY · 05 MIN</div>

# When the machine stops,<br><span class="accent">keep the proof.</span>

<div class="fault-phase-grid">
  <div class="fault-phase" v-click>
    <div class="phase-label"><span>01</span>BASELINE</div>
    <BottleConveyor state="running" :count="24" compact />
    <small>run is progressing</small>
  </div>
  <div class="fault-phase is-fault" v-click>
    <div class="phase-label"><span>02</span>FAULT</div>
    <BottleConveyor state="fault" :count="25" compact />
    <small>abort observed · counter holds</small>
  </div>
  <div class="fault-phase is-recovered" v-click>
    <div class="phase-label"><span>03</span>RECOVERED</div>
    <BottleConveyor state="recovered" :count="100" compact />
    <small>clear · resume · batch complete</small>
  </div>
</div>

<div class="fault-timeline" v-click>
  <span>FAULT</span><i></i><span>ABORT</span><i></i><span>HOLD</span><i></i><span>CLEAR</span><i></i><strong>RESUME</strong>
</div>

<div class="fault-verification-note">
  Confirm the event build's fault point, task names, variables, and final count before showing numeric values.
</div>

<div class="slide-id">W2 · 43</div>

<!--
Remember: A bounded failure should produce an observable abort or hold, a controlled recovery, and evidence that the intended batch completed.

The repository runner attempts a 100-bottle batch, injects a conveyor axis fault, checks that the machine aborts and the counter holds, clears and restarts, and checks completion. The visual uses the repository's current 24, 25, and 100 story as a demonstrator placeholder.

Reveal baseline, fault, held counter, and recovery. Before the event, confirm the exact injection point, task name, variables, event-build result, and whether the visual count is faithful. Do not make a physical safety or production-performance claim.

Transition: Evidence is what lets a release candidate move forward.

Status: Repository demonstrator-only until rehearsed against the event build.
-->

---
layout: default
class: release-handoff-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR WORKFLOW</div>
<div class="kicker">CONTROLLED RELEASE · 04 MIN</div>

# Release is a<br><span class="accent">controlled handoff.</span>

<div class="release-chain">
  <div v-click><span>01</span><mdi-tag-outline /><b>TAG / VERSION</b><small>known candidate</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>02</span><mdi-hammer-wrench /><b>BUILD + TEST</b><small>evidence first</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>03</span><mdi-package-variant-closed /><b>CANDIDATE</b><small>package the result</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div class="release-approval" v-click><span>04</span><mdi-account-check-outline /><b>APPROVAL</b><small>authorized decision</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div class="release-publish" v-click><span>05</span><mdi-upload-network-outline /><b>PUBLISH</b><small>controlled handoff</small></div>
</div>

<div class="release-detail-grid" v-click>
  <div><span>DEMO PATH</span><b>tag → E2E test → package → archive</b></div>
  <div><span>PUBLICATION RULE</span><b>version marker last</b></div>
  <div><span>HUMAN BOUNDARY</span><b>approval before release</b></div>
</div>

<div class="release-caution" v-click>
  The checked-in flow is a demonstrator release path, not a production deployment recommendation.
</div>

<div class="slide-id">W2 · 44</div>

<!--
Remember: Release packages approved evidence and known inputs. It is not simply copying the newest files.

The checked-in workflow updates a configuration version from a tag, runs the ARsim end-to-end tests, builds a project installation package, creates an archive, and publishes the version marker last. Mention the marker filename only if it is approved for the event.

Reveal the stages left to right. Keep credentials, customer paths, and production target details out of the deck. Explain that marker-last publication prevents a consumer from seeing a version signal before the rest of the demonstrator files are present.

Transition: The adoption path is deliberately smaller than this full demonstrator.

Status: Repository demonstrator workflow plus general release principle. Verify the event-approved presentation wording.
-->

---
layout: default
class: adoption-slide dark-slide
---

<div class="status-badge general">TAKEAWAY</div>
<div class="kicker">ADOPTION · 05 MIN</div>

# Start with one<br><span class="accent">workflow.</span>

<div class="adoption-path">
  <div v-click><span>01</span><mdi-flag-checkered /><b>BASELINE</b><small>what happens today?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>02</span><mdi-format-list-checks /><b>DECLARE INPUTS</b><small>what must be known?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div v-click><span>03</span><mdi-radar /><b>TEST + EVIDENCE</b><small>what proves done?</small></div>
  <i v-click><mdi-arrow-right /></i>
  <div class="adoption-approve" v-click><span>04</span><mdi-account-check-outline /><b>APPROVE + IMPROVE</b><small>who owns the decision?</small></div>
</div>

<div class="adoption-prompt" v-click>
  <span>PAIR COMMITMENT</span>
  <b>Which workflow will you make repeatable first?</b>
  <div><small>WORKFLOW</small><i></i><small>PASS CRITERION</small><i></i><small>OWNER / FIRST GATE</small></div>
</div>

<div class="adoption-guardrails" v-click>
  <span>BOUNDED</span><i>·</i><span>REVERSIBLE</span><i>·</i><span>MEASURABLE</span><i>·</i><strong>HUMAN-APPROVED</strong>
</div>

<div class="closing-line" v-click>
  Trustworthy repetition beats maximum automation.
</div>

<div class="slide-id">W2 · 45</div>

<!--
Remember: Start with one bounded workflow, explicit inputs, one meaningful oracle, captured evidence, and a human approval boundary.

Recommend a low-consequence and reversible starting point such as a build-and-regression check or diagnostic evidence collection. Do not prescribe one universal tool stack. Let the first workflow teach the organization which inputs, handoffs, and gates it actually needs.

Reveal the four adoption steps, then give pairs two minutes to fill in the workflow, pass criterion, and owner or first gate. Ask for one or two commitments from the room.

Close with the guardrails: bounded, reversible, measurable, and human-approved. The workshop ends here; questions and lunch follow at 12.15.

Status: General adoption guidance and illustrative examples.
-->

---
layout: default
class: working-in-progress dark-slide
---

<!--
Make an ending slide about "what we are working on" (Robust docker image, Package Manager).
Maybe use wording like OT does not become IT in a year.
-->

---
layout: default
class: Questions dark-slide
---

<!--
Questions
-->