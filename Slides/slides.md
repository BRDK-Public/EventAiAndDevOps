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

Transition: For at forstå arkitekturen skal vi skelne mellem model, agent og harness.
-->

---
layout: default
class: stack-slide dark-slide
---

<div class="kicker">DEFINITION · 04 MIN</div>

# What is an<br><span class="accent">agent?</span>

<div class="layer-stack">
  <div class="stack-layer harness-layer" v-click>
    <div class="layer-index">03</div>
    <div class="layer-title">HARNESS</div>
    <div class="layer-job">Context · tools · permissions · logs</div>
    <mdi-message-processing-outline />
  </div>
  <div class="stack-layer platform-layer" v-click>
    <div class="layer-index">02</div>
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
  <mdi-database-check-outline />
  <span>AN AGENT IS A MODEL IN A HARNESS</span>
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
  <div class="track-arrow" v-click><mdi-arrow-right /></div>
  <div class="track-step" v-click>
    <div class="step-icon"><mdi-hammer-wrench /></div>
    <span>02</span><b>Repeatable build</b><small>reproducible result</small>
  </div>
  <div class="track-arrow" v-click><mdi-arrow-right /></div>
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

Instructions og skills fortæller agenten, hvordan et Automation Studio-projekt bør behandles. MCP giver adgang til relevant og versionspassende B&R-viden. AS-CLI giver et kommandobaseret interface til udvalgte Automation Studio-handlinger og observationer.

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
  <div v-click><span>01</span><b>INSPECT</b><small>project + configuration</small></div>
  <div v-click><span>02</span><b>BUILD</b><small>declared target</small></div>
  <div v-click><span>03</span><b>SIMULATE</b><small>start controlled ARsim</small></div>
  <div v-click><span>04</span><b>CONNECT</b><small>PVI observation channel</small></div>
  <div v-click><span>05</span><b>READ</b><small>variables + logbook</small></div>
  <div v-click><span>06</span><b>PACKAGE</b><small>artifacts + evidence</small></div>
</div>

<div class="evidence-terminal">
  <div class="terminal-title"><i></i><i></i><i></i><span>AS-CLI · CONTROLLED OBSERVATION</span><small>EVENT VERSION TO CONFIRM</small></div>
  <div class="terminal-body">
    <div v-click><span class="time">09:41:02</span><span class="op">[AS-CLI]</span><b>project inspect --configuration ARsim</b><em class="ok">JSON</em></div>
    <div v-click><span class="time">09:41:18</span><span class="op">[AS-CLI]</span><b>build --target ARsim</b><em class="ok">PASS</em></div>
    <div v-click><span class="time">09:41:46</span><span class="op">[AS-CLI]</span><b>arsim start --profile controlled</b><em class="ok">READY</em></div>
    <div v-click><span class="time">09:42:05</span><span class="op">[AS-CLI]</span><b>pvi connect --target ARsim</b><em class="ok">CONNECTED</em></div>
    <div v-click><span class="time">09:42:21</span><span class="op">[AS-CLI]</span><b>var read Batch.Counter</b><em class="ok">42</em></div>
    <div v-click><span class="time">09:42:37</span><span class="op">[AS-CLI]</span><b>logbook read --severity warning,error</b><em class="ok">CAPTURED</em></div>
  </div>
  <div class="terminal-footer">MCP GIVES KNOWLEDGE · AS-CLI GIVES CONTROLLED ACTION + OBSERVATION</div>
</div>

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

<div class="request-card" v-click>
  <span>THE SHARED PATTERN</span>
  <b>Human intent.<br>Agent action.<br>Human evaluation.</b>
  <small>HITL · AFK · HITL</small>
</div>

<div class="question-field">
  <div v-click><span>01 · HITL</span>Idea / bug → specification → issues</div>
  <div v-click><span>02 · AFK</span>Plan → implement → review → test → candidate</div>
  <div v-click><span>03 · HITL</span>Evaluate the evidence → PR decision</div>
  <div v-click><span>04</span>Human owns intent and priorities</div>
  <div v-click><span>05</span>Agents own bounded implementation</div>
  <div v-click><span>06</span>Gates return facts, not confidence</div>
</div>

<div class="plan-purpose" v-click>
  <div><mdi-account-voice /><span>HITL</span><b>decide intent</b></div>
  <div><mdi-robot-outline /><span>AFK</span><b>run the loop</b></div>
  <div class="not-purpose"><mdi-account-check-outline /><span>HITL</span><b>accept the result</b></div>
</div>

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

<p class="devops-cover-copy">From one command contract to a traceable release.</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>VERSION</b><small>known inputs</small></div>
  <i></i>
  <div><span>02</span><b>BUILD</b><small>repeatable output</small></div>
  <i></i>
  <div><span>03</span><b>TEST</b><small>behavioral evidence</small></div>
  <i></i>
  <div><span>04</span><b>RELEASE</b><small>reviewable change</small></div>
</div>

<div class="audience-checkin" v-click>
  <span>THE SECOND SESSION</span>
  <b>Make engineering changes<br>repeatable and reviewable.</b>
  <small>VERSION · BUILD · TEST · RELEASE · PROVENANCE</small>
</div>

<div class="slide-id">D2 · 30</div>

<!--
Efter pausen tager Mads over med Workshop 2: DevOps i industrien.

Vi bygger videre på det samme command contract, men flytter fokus til den engineering- og releaseproces, som gør ændringer reproducerbare, testbare og reviewbare. Vi følger vejen fra kendte versioner og build inputs til test evidence, et pakket artifact og en kontrolleret release.

Transition: Først ser vi på, hvordan én ændring bevæger sig gennem en reproducerbar pipeline.
-->