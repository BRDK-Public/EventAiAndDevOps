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
defaults:
  layout: default
---

# Welcome!

<div class="welcome-grid">
  <div class="reference-photo welcome-photo-foodtruck"><img src="/welcome-foodtruck.jpg" alt="Foodtruck at the event"></div>
  <div class="reference-copy welcome-copy-feedback">
    <h2>Feedback</h2>
    <p>We value your feedback. Please complete the survey at the end of the day.</p>
  </div>
  <div class="reference-photo welcome-photo-audience"><img src="/welcome-audience.jpeg" alt="Audience at the event"></div>
  <div class="reference-copy welcome-copy-stay">
    <h2>Stay afterward</h2>
    <p>The event officially ends at 13:00, but you are welcome to stay if you have additional questions.</p>
  </div>
  <div class="reference-copy welcome-copy-lunch">
    <h2>Lunch</h2>
    <p>Foodtruck from Original Pita will be ready with lunch at 12.15.</p>
  </div>
  <div class="reference-photo welcome-photo-collaboration"><img src="/welcome-collaboration.jpeg" alt="People collaborating"></div>
  <div class="reference-copy welcome-copy-slides">
    <h2>Slides</h2>
    <p>All slides will be available after the event. Complete the survey to receive a link.</p>
  </div>
  <div class="reference-photo welcome-photo-networking"><img src="/welcome-networking.jpg" alt="People networking at the event"></div>
</div>

<img class="reference-brand" src="/br-logo.svg" alt="B&R Industrial Automation">

---
layout: default
class: reference-slide events-reference
---

# Upcoming Events<br><span class="accent">2026</span>

<div class="event-grid">
  <article class="event-card">
    <img src="/upcoming-adaptive.jpeg" alt="Adaptive automation robot and conveyor">
    <h2>Passion4AdaptiveAutomationDays 2026</h2>
    <p>Date: 6.-7. October 2026<br>Location: Orange Point, Malmö Sweden</p>
  </article>
  <article class="event-card">
    <img src="/upcoming-rugged.png" alt="Rugged automation controller in a field">
    <h2>Passion4RuggedAutomationDays 2026</h2>
    <p>Date: 10.-11. November 2026<br>Location: Orange Point, Malmö Sweden</p>
  </article>
</div>

<img class="reference-brand" src="/br-logo.svg" alt="B&R Industrial Automation">

---
layout: cover
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
  <div class="bridge-node is-proof"><span>02</span> DEPLOYMENT</div>
</div>
<div class="slide-id">01</div>

<!--
Introduktion af os selv.
Introduktion af vores arbejde med AI over de seneste 2 år og hvor vi er nu.

Hvorfor har vi valgt at kombinere Agentic Eng. og DevOps i samme event?
Mange synergier. AE sikrer produktivitet og DevOps sikrer kvalitet.

Både AI og DevOps deler vandende. AI er overalt og lover mere end hvad der er realistisk. 
Det er helt naturligt at have en sund skepsis.
DevOps introducerer en masse regler og struktur. Nogen ser det som religion, andre som rigide processer der dræber kreativiteten og produktiviten.

Vi vil vise vores take på det. Hvad kan man i B&R og hvad er vores vision for fremtidens automation! 
-->

---
layout: default
class: agenda-slide dark-slide
---

<div class="kicker">TODAY · PRACTICAL INFO</div>

<div class="agenda-layout">
  <div class="agenda-intro" v-motion :initial="{ opacity: 0, x: -24 }" :enter="{ opacity: 1, x: 0 }">
    <h1>AI & DevOps<br><span class="accent">A shared vision.</span></h1>
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

<div class="slide-id">02</div>

<!--
Pressentation af Agendaen. 

Først en overfladisk gennemgang af AE og DevOps.
Derefter lidt mere dybtegående sessioner med hhv. AE og DevOps.
-->

---
layout: default
class: light-grid
---

<div class="kicker">WHY THIS EVENT · 04 MIN</div>

# Just another<br><span class="accent">AI Event?</span>

<div class="split-verdicts">
  <div class="verdict no" v-click>
    <div class="verdict-head"><mdi-close-circle-outline /> WHAT WE WILL NOT TELL YOU</div>
    <div class="verdict-row"><b>Everyone else has</b><span>solved AI</span></div>
    <div class="verdict-row"><b>Copy our</b><span>productivity percentage</span></div>
    <div class="verdict-row"><b>Buy one tool and</b><span>transformation follows</span></div>
    <div class="verdict-row"><b>The newest LLM</b><span>benchmarks and hype</span></div>
  </div>
  <div class="verdict yes" v-click>
    <div class="verdict-head"><mdi-check-circle-outline /> WHAT WE WILL TELL YOU</div>
    <div class="verdict-row"><b>Industrial AI is</b><span>high priority, but still very early</span></div>
    <div class="verdict-row"><b>Our current strategy</b><span>and what we are working on</span></div>
    <div class="verdict-row"><b>Results depend on</b><span>context and process</span></div>
    <div class="verdict-row"><b>How to get started</b><span>in your own team</span></div>
  </div>
</div>

<div class="bottom-statement" v-click>
  We don't have all the answers. <strong>Please keep the discussion ongoing!</strong>
</div>

<div class="slide-id">03</div>

<!--
Vi har selv været til mange AI-foredrag og konferencer. Ofte hører man om en virksomhed, der har løst næsten alt med AI og er blevet 30, 40 eller 50 procent mere produktiv. Historien lyder bagefter: "Gør bare som os."

Problemet er, at man sjældent får hele regnestykket med. Man hører ikke altid om investeringerne, fejlene, datagrundlaget eller de særlige forudsætninger. Derfor går man let hjem med en fornemmelse af at være bagud.

DET VIL VI IKKE:

Vi vil heller ikke sælge jer noget. Alt hvad vi kommer til at vise jer i dag, kommer uden nogen regning. Jeres success er vores success!

Det bliver heller ikke noget tech / hype hvor vi vil lovprise nye modeller og deres uanede talenter. 

Sådan skal det ikke være i dag. AI i automationsbranchen er stadig nyt. I har ikke sovet i timen, men tidspunktet er godt til at begynde systematisk. 

DET VIL VI ISTEDET:

Vi vil gerne informere vores kunder og samarbejdspartnere omkring vores strategi og retning.
Hvad er der af muligheder med AI og DevOps på B&R platformen.
Have nogle gode dialoger / diskutioner med jer. Stil endelig spørgsmål eller giv feedback undervejs

Transition: Lad os se på, hvordan DevOps og Agentic Engineering supplerer hinanden.
-->

---
layout: default
class: dark-slide loop-slide
---

<div class="kicker">COMPLEMENTARY SYSTEMS · 03 MIN</div>

# DevOps + Agentic<br><span class="accent">Engineering</span>

<div class="loop-compare">
  <div class="loop-linear" v-click>
    <div class="loop-bars">
      <span>Plan</span><i></i>
      <span>Design</span><i></i>
      <span>Build</span><i></i>
      <span>Test</span><i></i>
      <span>Deploy</span><i></i>
      <span>Maintain</span>
    </div>
    <p><b>Traditional DevOps stages.</b> Every step is handled manually</p>
  </div>

  <div class="loop-cycle" v-click>
    <svg viewBox="0 0 300 300">
      <defs>
        <marker id="loopArrow" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="4" markerHeight="4" orient="auto-start-reverse">
          <path d="M0 0 L10 5 L0 10 z" fill="var(--br-orange)" />
        </marker>
      </defs>
      <g class="loop-arrows" fill="none" stroke="var(--br-orange)" stroke-width="3" stroke-linecap="round" marker-end="url(#loopArrow)">
        <path d="M189.3 41.9 A115 115 0 0 1 223.9 61.9" />
        <path d="M263.2 130 A115 115 0 0 1 263.2 170" />
        <path d="M223.9 238.1 A115 115 0 0 1 189.3 258.1" />
        <path d="M110.7 258.1 A115 115 0 0 1 76.1 238.1" />
        <path d="M36.7 170 A115 115 0 0 1 36.7 130" />
        <path d="M76.1 61.9 A115 115 0 0 1 110.7 41.9" />
      </g>
      <circle class="loop-hub" cx="150" cy="150" r="56" />
      <text class="loop-hub-label" x="150" y="145">Agent</text>
      <text class="loop-hub-sub" x="150" y="166">Workflows</text>
      <g class="loop-node">
        <circle cx="150" cy="35" r="31" /><text x="150" y="39">Plan</text>
        <circle cx="249.6" cy="92.5" r="31" /><text x="249.6" y="96.5">Design</text>
        <circle cx="249.6" cy="207.5" r="31" /><text x="249.6" y="211.5">Build</text>
        <circle cx="150" cy="265" r="31" /><text x="150" y="269">Test</text>
        <circle cx="50.4" cy="207.5" r="31" /><text x="50.4" y="211.5">Deploy</text>
        <circle cx="50.4" cy="92.5" r="31" /><text x="50.4" y="96.5">Maintain</text>
      </g>
    </svg>
    <p><b>AI-native DevOps.</b> Humans above the loop instigating, directing and governing.</p>
  </div>
</div>

<div class="signal-callout" v-click>
  <div class="signal-pulse"></div>
  <p>DevOps gives agents rails.<br><strong>Agents make the rails more useful.</strong></p>
</div>
<div class="slide-id">04</div>

<!--
DevOps er en fremgangsmåde med forskellige stadier ens software skal igennem. Hvert stadie sætter nogle krav der sikrer at næste stadie bliver en success. Mange af stadierne skal udføres manuelt eller manuelt flyttes til næste stadie. Hvis kravene ikke opfyldes grundigt nok, har workflowet ingen reel værdi. Derfor kan det for nogle godt virke rigidt og tungt - selvom det er en nødvendighed for at levere høj kvalitet.

Ved at bringe AI-Agenter ind i din DevOps process er der en masse fordele. AgentOps

0. DevOps bliver et framework til Agentic Engineering der sikrer kvalitet og forudsiglighed. (AI er ligesom mennesker ikke deterministiske)
1. Agenterne overholder ALTID deres instruktioner i modsætning til mennesker. 
2. DevOps kan automaticeres og spare tid.
3. Viden er gemt i workflows og ikke i individer
4. Vi har stadig fuld kontrol over processen ved at integrere quality gates, men også ved at justere og finetune sine Agentic Workflows




-->

---
layout: default
class: dark-slide cycletime-slide
---

<div class="kicker">CYCLE TIME · 03 MIN</div>

# Where the time<br><span class="accent">actually goes</span>

<div class="cycle-block" v-click>
  <p class="cycle-head"><b>Without DevOps</b> — no safety net, a variable cost lands after release</p>
  <div class="cycle-track track-nodevops">
    <span>Idea</span>
    <span class="hot">Build</span>
    <span>Deploy</span>
    <span class="bad">Bugfix</span>
  </div>
</div>

<div class="cycle-block" v-click>
  <p class="cycle-head"><b>DevOps before AI</b> — every stage runs at human speed</p>
  <div class="cycle-track track-before">
    <span>Plan</span>
    <span>Design</span>
    <span class="hot">Build</span>
    <span>Test</span>
    <span>Deploy</span>
    <span>Maintain</span>
    <em>reclaimed</em>
  </div>
</div>

<CycleTradeoff v-click />

<div class="slide-id">05</div>

<!--
Øverst: Uden DevOps: Man springer hurtigt over plan og design, bygger længe da specifikationerne ændrer sig konstant, og der er ingen test. Regningen kommer efter release som bugfix - den dyreste form for arbejde, fordi den rammer kunden eller slutbrugeren.

I midten: DevOps: Ordentlig planlægning og design koster tid, men er hele fundamentet for udvikling og test af god kvalitet. Bugfix minimeres, og der er allerede vundet tid, samt den endelige kost er mere forudsigelig.

Nederst: AgentOps: Investeringen af tid flytter frem i processen. Agenterne har ingen hukommelse eller indforstået viden om "best practise". Alt skal defineres meget eksplicit for at undgå misforståelser. Build bliver til en brøkdel. Måske endda 0 fordi processen ikke blokerer for at man kan lave noget andet imens. 
Review og release-beslutning ligger stadig hos os. De bliver faktisk vigtigere, fordi de nu er det, der bestemmer kvaliteten.

Den frigjorte tid er ikke nødvendigvis en gratis gevinst - den kan investeres i bedre kontekst, bedre tests og bedre beslutninger.
For første gang i lang tid, bliver det muligt at øge kvaliteten markant uden at investere i markant flere ingeniører.

Transition: For at forstå arkitekturen skal vi skelne mellem model, agent og harness.
-->

---
layout: default
class: stack-slide dark-slide
---

<div class="kicker">DEFINITION · 04 MIN</div>

# What is an<br><span class="accent">agent?</span>

<div class="agent-nest">
  <div class="agent-box">
    <span class="nest-tag">AGENT</span>
    <div class="harness-grid">
      <span v-click>instructions</span>
      <span v-click>context</span>
      <span v-click>tools</span>
      <span v-click>memory</span>
      <div class="model-core">
        <b>LLM</b>
        <small>patterns · reasoning</small>
      </div>
      <span v-click>permissions</span>
      <span v-click>logs</span>
      <span v-click>feedback</span>
      <span v-click>approvals</span>
    </div>
    <p class="harness-note" v-click>
      <span>Everything around the model is the <b>harness</b></span>
      <span class="harness-logos" role="img" aria-label="GitHub Copilot, Claude Code, Codex and Cursor">
        <span class="harness-logo copilot" title="GitHub Copilot"><simple-icons-githubcopilot aria-hidden="true" /></span>
        <span class="harness-logo claude" title="Claude Code"><simple-icons-claudecode aria-hidden="true" /></span>
        <span class="harness-logo codex" title="Codex"><simple-icons-openai aria-hidden="true" /></span>
        <span class="harness-logo cursor" title="Cursor"><simple-icons-cursor aria-hidden="true" /></span>
      </span>
    </p>
  </div>
</div>

<div class="record-rail" v-click>
  <mdi-robot-outline />
  <span>AN AGENT IS A MODEL IN A HARNESS</span>
  <small>THINKING, PLANNING & ACTING</small>
</div>


<div class="slide-id">06</div>

<!--
Hvad er en Agent?

Består overordnet af to uafhængige komponenter. 
Den består selvfølgelig af en LLM aka. Large Language Model aka. Sprogmodel eller generativ AI.
Mange ser LLM'en som den magiske komponent der gør hele forskellen. Det er den der løber med al opmærksomheden, men det miljø den arbejder i har en mindst ligeså stor betydning for resultatet.

LLM'erne ændrer sig konstant. I næste uge er det måske en helt anden model, der enten er bedst eller billigst.
Det er derfor uafhangige komponenter hvor vi (for det meste) ingen indflydelse har på selve modellen, men derimod stor indflydelse på det harness hvor den bliver anvendt.

Modellen alene har ingen adgang til Automation Studio, et project, en PLC eller en logbook. Den kan kun arbejde med den context, den får og vurdere hvordan den vil anvende de tools, som dens harness stiller til rådighed. 

Agenten opstår, når modellen kan vælge et tool, kalde det, se resultatet og beslutte næste trin. Harnesset er miljøet rundt om agenten: 

Instructions: Agent.md. Hvad skal den kunne. Hvad skal den overholde?
Context: Hvad er det vi arbejder i?
Tools: Hvad skal agenten have adgang til i verden udenfor?
Memory: Da en LLM er fuldstændig stateless skal der være noget til at holde på historikken. Måske også dele det på tværs af sessioner.
Permissions: Hvad må agenten gøre på egen hånd?
Logs: Logger hvad agenten har gjort. Hvilke tools den har kaldt. Har den spawnet subagenter?
Feedback: Agenten skal spørge dig til råds. Hvad mener du? Skal jeg vælge X eller Y?
Approvals: Du skal give agenten tilladelser eller adgang.

En agent er en LLM i et Harness!

Transition: Hvorfor er dette sket hurtigere i IT end i OT?
-->

---
layout: default
class: process-slide
---
<div class="kicker">FOUNDATION · 04 MIN</div>

# IT & OT are<br><span class="accent">converging</span>

<p class="it-ot-lead">The engineering tools are meeting. The feedback loop still has to reach the machine.</p>

<div class="it-stack-strip" role="img" aria-label="IT engineering tools and agent protocols">
  <span class="it-stack-label">SHARED<br>TOOLCHAIN</span>
  <span class="it-stack-logo vscode" title="Visual Studio Code"><simple-icons-visualstudiocode aria-hidden="true" /></span>
  <span class="it-stack-logo git" title="Git"><simple-icons-git aria-hidden="true" /></span>
  <span class="it-stack-logo github" title="GitHub"><simple-icons-github aria-hidden="true" /></span>
  <span class="it-stack-logo docker" title="Docker"><simple-icons-docker aria-hidden="true" /></span>
  <span class="it-stack-logo test" title="Unit tests"><mdi-test-tube aria-hidden="true" /></span>
  <span class="it-stack-logo cli" title="Command line interface"><mdi-console aria-hidden="true" /></span>
  <span class="it-stack-logo mcp" title="Model Context Protocol"><simple-icons-modelcontextprotocol aria-hidden="true" /></span>
  <span class="it-stack-logo copilot" title="GitHub Copilot"><simple-icons-githubcopilot aria-hidden="true" /></span>
  <span class="it-stack-logo claude" title="Claude Code"><simple-icons-claudecode aria-hidden="true" /></span>

</div>
<div class="it-ot-messages">
  <div v-click><span>01</span><b>Agentic Engineering in IT is <strong>moving fast!</strong></b></div>
  <div v-click><span>02</span><b>Competences are <strong>converging</strong> but solutions are <strong>diverging</strong></b></div>
  <div v-click><span>03</span><b>Only an <strong>open Automation Platform</strong> supports a unified future</b></div>
</div>
<div class="it-ot-figure-card">
  <img class="it-ot-figure" src="/it-ot.png" alt="IT and OT convergence">
</div>
<div class="it-ot-platform" v-click>
  <div class="it-ot-platform-copy">
  </div>
  <div class="it-ot-platform-lockup">
    <img class="as-logo" src="/as-logo.png" alt="Automation Studio">
    <div class="as-labels"><span>No binaries</span><span>Only text</span></div>
  </div>
</div>

<div class="slide-id">07</div>

<!--
I mange år har "nogen" snakket om at IT og OT ville flyde mere og mere sammen. Det har også tildels været rigtigt. Mange af de værktøjer der bruges i IT er nu også tilgængelige for OT. 

<b>Men siden AI er begyndt at blive en del af stacken, er IT begyndt at "stikke af" igen.</b>

Det er ikke fordi vi ikke besider de samme kompetencer i OT, men fordi IT og hele <B>opensource</b> tankegangen bare går rigtig stærkt.
<b>LLM'erne er allerede trænet på uendeligt mange IT projekter</b>, mens OT næsten altid er closed source.

IT har allerede værktøjer og kontekst som en naturlig del af udviklingsmiljøet: Versionsstyring, APIs, CLIs og diagnostics. Modeller og agenter kan derfor hurtigt kobles på et eksisterende feedback-loop.

I OT skal vi i højere grad selv udvikle de tilsvarende værktøjer og den kontekst, som AI kan arbejde med. OT har desuden fysiske konsekvenser, lange livscyklusser, hardware- og versionsafhængigheder, motion, safety og mindre standardiseret feedback. 

<b>Derfor er opgaven ikke kun at få AI ind i OT, men ligesåmeget at gøre OT tilgængelig for AI.</b>

Transition: Det vigtigste hul er forskellen mellem at generere kode og at verificere engineering.
-->

---
layout: default
class: foundation-slide dark-slide
---

<div class="kicker">OT ENABLEMENT · 04 MIN</div>

# what is needed to<br><span class="accent">close the gap</span>

<div class="foundation-layout">
  <div class="foundation-stack">
    <div class="foundation-row" v-click>
      <span class="foundation-index">01</span>
      <span class="foundation-icon"><mdi-database-search-outline /></span>
      <div class="foundation-copy">
        <h2>Domain knowledge</h2>
        <p>Product, platform and OEM knowledge the LLM does not carry.</p>
      </div>
      <span class="foundation-tag">B&amp;R + OEM</span>
    </div>
    <div class="foundation-row" v-click>
      <span class="foundation-index">02</span>
      <span class="foundation-icon"><mdi-file-tree-outline /></span>
      <div class="foundation-copy">
        <h2>Project context</h2>
        <p>A readable map of programs, configuration, hardware, and dependencies.</p>
      </div>
      <span class="foundation-tag">B&amp;R</span>
    </div>
    <div class="foundation-row" v-click>
      <span class="foundation-index">03</span>
      <span class="foundation-icon"><mdi-source-commit /></span>
      <div class="foundation-copy">
        <h2>Git source control</h2>
        <p>Reproducible commits make every change traceable and reversible.</p>
      </div>
      <span class="foundation-tag">B&amp;R</span>
    </div>
    <div class="foundation-row" v-click>
      <span class="foundation-index">04</span>
      <span class="foundation-icon"><mdi-tools /></span>
      <div class="foundation-copy">
        <h2>B&amp;R platform tools</h2>
        <p>Supported actions for debugging, testing, and deployment on the platform.</p>
      </div>
      <span class="foundation-tag">B&amp;R</span>
    </div>
    <div class="foundation-row" v-click>
      <span class="foundation-index">05</span>
      <span class="foundation-icon"><mdi-shield-check-outline /></span>
      <div class="foundation-copy">
        <h2>Guardrails</h2>
        <p>B&amp;R specific rules or skills. OEM architecture, coding, naming, and testing strategies. </p>
      </div>
      <span class="foundation-tag">B&amp;R + OEM</span>
    </div>
  </div>
  <div class="foundation-contract" v-click>
    <div class="foundation-contract-head">
      <span>THE ENGINEERING CONTRACT</span>
      <mdi-lock-check-outline />
    </div>
    <div class="foundation-agent">
      <span class="foundation-agent-icon"><mdi-robot-outline /></span>
      <div>
        <b>LLM / AGENT</b>
        <small>reason over feedback</small>
      </div>
    </div>
    <div class="foundation-contract-arrow"><mdi-arrow-down /></div>
    <div class="foundation-contract-flow">
      <div><span>01</span><b>READ</b><small>context that is in scope</small></div>
      <div><span>02</span><b>CHANGE</b><small>controlled platform actions</small></div>
      <div><span>03</span><b>VERIFY</b><small>tests, diagnostics, and feedback</small></div>
    </div>
    <p class="foundation-contract-foot">Same engineering pattern as IT.<br><strong>Different domain boundary.</strong></p>
  </div>
</div>

<div class="foundation-outcome"><i></i><span>CONTEXT + CONTROL + FEEDBACK</span><i></i></div>

<div class="slide-id">08</div>

<!--
<b>Hvad skal der konkret til?</b><br>
For at arbejde som IT skal OT ikke kopiere alle IT-værktøjer. Vi skal give en agent de samme grundlæggende egenskaber: viden om platformen, en forståelig projektmodel, sporbare ændringer og værktøjer der kan give agenten feedback fra projektet, plc'en eller simulatoren.

1. <b>Den manglende domæne viden som LLM'erne ikke er trænet på. B&R + OEM</b>
2. <b>Projekt context. Modellen skal kunne læse filerne og forstå deres sammenhænge. B&R</b>
3. <b>Sourcekode, HMI, configurationer, Safety osv. skal kunne versionstyres. B&R</b>
4. <b>Vi skal levere de værktøjer der er nødvendige for at kunne lukke feedback-loopet på research, debugging, test og deployment. B&R</b>
5. <b>Vi skal definere nogle regler (guardrails). F.eks: altid opdater pkg-filen, Unused vars etc. B&R + OEM   </b>


Projektcontext skal være læsbar for både mennesker og modeller. Git gør ændringer reproducerbare, mens platformværktøjer lukker feedback-loopet med debug, test og deployment. Guardrails gør hastigheden kompatibel med arkitektur, kvalitet og ansvar.

Transition: Når fundamentet er på plads, kan vi lukke det industrielle engineering-loop.
-->

---
layout: default
class: agent-loop-slide
---

<div class="kicker">JOURNEY · 04 MIN</div>

# The path<br><span class="accent">Going forward</span>

<div class="strategy-shift" aria-label="B&amp;R strategy shift from custom models to an open platform">
  <section class="strategy-shift-side custom-model" v-click>
    <div class="strategy-shift-label"><span>THEN</span><strong>BUILD THE MODEL AND THE HARNESS</strong></div>
    <h2>AS-Copilot + AS-Code <span>pretrain + fine-tune</span></h2>
    <div class="strategy-shift-costs">
      <div><span>01</span><p><b>Expensive to build</b><small>resources, compute, and time</small></p></div>
      <div><span>02</span><p><b>Outdated quickly</b><small>a new model arrives before release</small></p></div>
      <div><span>03</span><p><b>Overcomplete by design</b><small>extra data can increase hallucination</small></p></div>
      <div><span>04</span><p><b>Fine-tuning to maintain</b><small>new data, evaluations, and retraining</small></p></div>
      <div><span>05</span><p><b>Locked to one model</b><small>never the best fit for every use case</small></p></div>
      <div><span>06</span><p><b>Requires B&amp;R hosting</b><small>the customer cannot choose the IP trust boundary</small></p></div>
    </div>
  </section>

  <div class="strategy-shift-pivot" v-click>
    <span>STRATEGY SHIFT</span>
    <mdi-arrow-right />
    <strong>Own the<br>engineering layer.</strong>
  </div>

  <section class="strategy-shift-side open-platform" v-click>
    <div class="strategy-shift-label"><span>NOW</span><strong>INTEGRATION OF YOUR CHOISE</strong></div>
    <h2>Open platform <span>any LLM / harness / IDE</span></h2>
    <div class="strategy-shift-stack">
      <div><span>CONTEXT ENGINEERING</span><small>current B&amp;R and customer knowledge</small></div>
      <i>+</i>
      <div><span>HARNESS ENGINEERING</span><small>tools, workflows, tests, and approvals</small></div>
    </div>
    <div class="strategy-shift-benefits">
      <div><mdi-bridge /><p><b>Portable as models evolve</b><small>let specialist providers lead model and harness innovation</small></p></div>
      <div><mdi-account-check-outline /><p><b>Customer choice stays visible</b><small>model, provider, hosting, data policy, and IP trust boundary</small></p></div>
    </div>
  </section>
</div>

<div class="strategy-shift-footer" v-click>
  <span>OUR DIFFERENTIATOR</span>
  <strong>B&amp;R owns the bridge.</strong>
  <small>Customers choose the model, harness, and trust boundary.</small>
</div>

<div class="slide-id">09</div>

<!--
<b>Vores strategi har ændret sig</b> og det har måske ikke været så tydeligt hvor vi egentligt er på vej hen nu. Vi vil ikke længere pretraine eller fine-tune vores egen model som et lukket AS-Copilot-økosystem. <b>Det var det rigtige valg engang</b>, fordi modellerne ikke var istand til at PLC. Det har ændret sig!

Heldigvis:
For det er dyrt og langsomt at bygge, modellen risikerer at være forældet før release, og et overcomplete træningssæt kan give modellen mere viden end den enkelte kunde har brug for. Det kan gøre svarene sværere at afgrænse. Oven i det kommer løbende fine-tuning, evaluering og vedligeholdelse. Vi låser os til én model, selv om forskellige opgaver kræver forskellige modeller, og en B&R-hostet model begrænser kundens valg af AI-leverendør og måske enda konflikter med kundens IP retningslinjer.

Vores platform er allerede åben og tekstbaseret. <b>Derfor kan vi skabe mere varig værdi med context engineering og harness engineering:</b> 

B&R skal eje broen / integrationen og domænegrænsen, ikke alle lag i AI-stacken. Så kan vi tage den bedste nye teknologi i brug, uden at kunden skal købe ind i et lukket og forældet B&R-økosystem.

Transition: Det er den retning, vi nu bygger videre på.
-->

---
layout: default
class: takeaway-slide
---

<div class="kicker">WHY IT MATTERS · 02 MIN</div>

# Why care about<br><span class="accent">Agentic Engineering?</span>

<div class="why-care-layout">
  <section class="abstraction-panel" v-click aria-label="Agentic Engineering as a new software abstraction layer">
    <div class="why-care-label"><span>THE SHIFT</span><strong>ANOTHER ABSTRACTION LAYER</strong></div>
    <div class="abstraction-ladder">
      <div class="abstraction-step"><span>01</span><div><b>Machine code</b><small>hardware instructions</small></div></div>
      <div class="abstraction-step"><span>02</span><div><b>Compiler</b><small>translate intent into code</small></div></div>
      <div class="abstraction-step"><span>03</span><div><b>Frameworks</b><small>compose reusable systems</small></div></div>
      <div class="abstraction-step is-current"><span>04</span><div><b>Agentic workflow</b><small>intent + context + tools + feedback</small></div></div>
    </div>
    <div class="abstraction-caption"><span>THE COMPETITIVE EDGE</span><strong>Master the layer early.<br>Or be outpaced.</strong></div>
  </section>

  <section class="why-care-list" aria-label="Reasons to care about Agentic Engineering">
    <div class="why-care-list-head"><span>WHY CARE NOW</span><small>the advantage moves to the workflow</small></div>
    <div class="why-care-item" v-click><span>01</span><div><b>It is the next abstraction layer</b><small>Learn to master it, or be outpaced by those who do.</small></div></div>
    <div class="why-care-item" v-click><span>02</span><div><b>It is the future of software development</b><small>Whether we like it or not, agentic workflows are joining the stack.</small></div></div>
    <div class="why-care-item" v-click><span>03</span><div><b>Knowledge becomes part of the system</b><small>Store expertise in workflows, not only in people.</small></div></div>
    <div class="why-care-item" v-click><span>04</span><div><b>Productivity can finally buy quality</b><small>Reinvest implementation speed in tests, review, and evidence.</small></div></div>
    <div class="why-care-item" v-click><span>05</span><div><b>Agility and profitability</b><small>Ramp up or down as needed; profit depends less on one perfect team.</small></div></div>
  </section>
</div>

<div class="why-care-footer" v-click><span>THE PAYOFF</span><strong>More agility. More quality. More resilient profit.</strong></div>

<div class="slide-id">11</div>

<!--
Hvorfor er det interressant? Hvorfor skal I investere jeres tid i AE?

1. Man skal forstå at AI er det næste naturlige abstraktionslag. Dem der formår at bruge AI effektivt vil til enhver tid udkonkurerer dem der ikke gør! Vi bliver ikke arbejdsløse, vi flytter bare fokus op ad abstraktionsstigen. Ikke for at blive dovne, men for at kunne nå mere i en verden der forventer mere.
2. Uanset om man elsker AI eller er fuld af skepsis, så må man indse at det er blevet en del af stacken og det er kommet for at blive. Jeg synes personligt at det er blevet 100 gange sjovere at være ingeniør. Vi kan lave de vildeste ting og vi bliver forundrede hver dag. 
3. Viden bliver gemt i systemet i stedet for i individer. Systemet skal ikke på ferie, på barsel, er syg eller (gud forbyde det) siger op.
4. Vi får muligheden for at geninvestere vores tid til at opnå bedre kvalitet. Kontinuerlig optimering der leder til mere autonomi og mere troværdighed.
5. Vores afdeling bliver langt mere agil og robust. Det skallerer efter behov.

Jeg startede med at sige, at AI foredrag næsten altid lover guld og grønne skove og at det her skulle være anderledes??. Jeg beklager hvis det ikke er lykkedes indtil videre.

Vi vil ikke garantere success. Vi vil garantere at værktøjerne til success er der. Det er en stor udgift at ændre den måde man arbejder på, men udgiften ved at lade værre kan være markant størrer! 

Transition: Slut med intro.
-->

---
layout: default
class: devops-cover ai-workshop-cover dark-slide
---

<div class="devops-chapter">01</div>

<div class="kicker">WORKSHOP 01 · 60 MIN</div>
<div class="part-label">LARS JENSEN · AUTOMATION ENGINEER</div>

# It's all about<br><span class="accent">the workflow</span>

<p class="devops-cover-copy">The model proposes. The harnes provides context and feedback. The workflow governs.</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>PLAN</b><small>What and how</small></div>
  <i></i>
  <div><span>02</span><b>IMPLEMENT</b><small>According to guardrails</small></div>
  <i></i>
  <div><span>03</span><b>TEST</b><small>Validate the result</small></div>
  <i></i>
  <div><span>04</span><b>APPROVE</b><small>What is being deployed</small></div>
</div>


<div class="slide-id">12</div>

<!--
Inden vi springer til næste punkt på dagsordenen:

- Spørgsmål til mig?

1. Hvor mange af jer bruger AI-Agenter som et dagligt og uundværligt værktøj til sw-udvikling?
2. Hvor mange af jer bruger DevOps principper i jeres sw-udvikling?
 

Den vigtigste enhed er ikke modellen eller agenten. Det er workflowet.

Modellen kan udskiftes. Harnesset kan ændres. Men workflowet definerer, hvordan ide bliver til issues, hvordan løsningerne bliver implementeret, reviewed og testet og hvem der i sidste ende må godkende resultatet.

Den er et levende engineering-system. Det skal versionsstyres, måles, vedligeholdes og forbedres, præcis som andre dele af jeres platform.
-->

---
layout: default
class: maturity-compare-slide dark-slide
---

<figure class="vibe-coder-visual">
  <img src="/vibe-coder.png" alt="Vibe coder working at an unpredictable bottle line">
</figure>

<!--
Vibe coding kan være effektivt til læring og prototyper. Vi har selv vibecoded en hel del. Ikke på jeres maskiner selvfølgelig ;) Men til hurtige interne værktøjer, til POCs og til fejlfinding er der intet i vejen med bare at give den gas uden en plan.

Men til rigtige maskiner der skal leve op til en masse krav, er det sjældent en god idé.

Hvad er "Vibe Coding"? Et fenomen der opstod for ca. 1,5 år siden. Beskriv hvad du vil have og itterer indtil du er tilfreds.

Når vi sætter det op imod "Agentic Engineering", så er det for at synliggøre, at AI er ikke magi. Vi bliver nødt til at holde det i hånden hele tiden og eje processen. AI Agenter er ikke deterministiske (ligesom mennesker heller ikke er). De har brug for guardrailes der styrer og quality gates der tillader at processen må fortsætte.  

På en maskine er "det ser rigtigt ud" ikke et successkriterie.

Hvis man ikke styrer processen så mister man overblikket.
-->

---
layout: default
class: bridge-slide dark-slide
---

<div class="kicker">THE BRIDGE · 03 MIN</div>

# The Automation Studio<br><span class="accent">Agentic Bridge</span>

<figure class="agentic-bridge-visual" v-motion :initial="{ x: -170, y: 100, scale: 1.45 }" :click-1="{ x: 0, y: 0, scale: 0.76, transition: { duration: 650, ease: 'easeInOut' } }">
  <img src="/agentic-bridge.png" alt="Automation Studio Agentic Bridge">
</figure>

<div class="architecture" v-click v-motion :initial="{ opacity: 0 }" :click-1="{ opacity: 1, transition: { duration: 500 } }">
  <div class="architecture-top">
    <div class="architecture-top-copy">
      <mdi-application-braces-outline />
      <div><b>POPULAR HARNESSES + MODELS</b><small>bring your preferred runtime. API or selfhosted (On-prem or cloud)</small></div>
    </div>
    <div class="architecture-top-logos" role="img" aria-label="GitHub Copilot, Claude Code, Codex and Cursor">
      <span class="harness-logo copilot" title="GitHub Copilot"><simple-icons-githubcopilot aria-hidden="true" /></span>
      <span class="harness-logo claude" title="Claude Code"><simple-icons-claudecode aria-hidden="true" /></span>
      <span class="harness-logo codex" title="Codex"><simple-icons-openai aria-hidden="true" /></span>
      <span class="harness-logo cursor" title="Cursor"><simple-icons-cursor aria-hidden="true" /></span>
    </div>
  </div>
  <div class="architecture-connectors" v-click="2"><i></i><i></i><i></i></div>
  <div class="architecture-pillars" v-click="2">
    <div class="pillar">
      <span>01 · WORKFLOW</span>
      <img class="pillar-bridge-logo" src="/agentic-bridge-logo.png" alt="Agentic Bridge logo">
      <b>Instructions<br>hooks & skills</b>
    </div>
    <div class="pillar">
      <span>02 · KNOWLEDGE</span>
      <img class="pillar-bridge-logo" src="/agentic-bridge-logo.png" alt="Agentic Bridge logo">
      <b>B&amp;R context<br>through MCP</b>
    </div>
    <div class="pillar">
      <span>03 · EXECUTION</span>
      <img class="pillar-bridge-logo" src="/agentic-bridge-logo.png" alt="Agentic Bridge logo">
      <b>AS CLI<br>do + observe</b>
    </div>
  </div>
  <div class="architecture-connectors architecture-lower-connectors" v-click="3"><i></i><i></i><i></i></div>
  <div class="architecture-bases" v-click="3">
    <div class="architecture-base">
      <img class="architecture-base-logo automation-studio-logo" src="/automation-studio-logo.png" alt="Automation Studio logo"><span>Automation Studio</span>
    </div>
    <div class="architecture-base">
      <img class="architecture-base-logo domain-knowledge-logo" src="/domain-knowledge-logo.png" alt="Domain knowledge logo"><span>Domain Knowledge</span>
    </div>
    <div class="architecture-base">
      <img class="architecture-base-logo ar-sim-logo" src="/ar-sim-logo.png" alt="AR / ArSim controller"><span>AR / ArSim</span>
    </div>
  </div>
</div>

<div class="slide-id">13</div>

<!--
Hvis man går ind på linkedin eller åbner vores hjemmeside, så vil man se denne marketingskampagne for: Automation Studio Agentic Bridge. Der er flere der har kontaktet mig og spurgt ind til hvad det er. Det har i forhåbentlig en ide om nu, men selvom det ikke er helt endeligt defineret eller released, så lad os lige gennemgå det.

Agentic Bridge er integrationen af domæneviden og tools fra enhver Agent (altså et hvilket som helst harness med en hvilken som helst model)

<b>Den består af</b> nogle instruktioner, skills og hooks for at guide agenten med at arbejde i et AS-Projekt

<b>Den består af</b> en MCP server der kan levere domæneviden til agenten omkring: B&R produkter, Automation Studio, Structured Text, AS-Help, Anonymiserede support tickets, Sales notices, manualer, Release notes osv. Denne MCP server er tilgængelig allerede nu og er den officielle B&R MCP server. 

<b>Den består af et Command Line Interface til Automation Studio</b>: CLI'et stiller en række funktionaliteter til rådighed for agenten, så den kan bygge projektet, simulerer, læse/skrive variabler, læse logbogen osv. 

Man er selvfølgelig ikke begrænset til de tools der er en del af Agentic Bridge. Man kan selvfølgelig stadig bruge de 1000 vis af skills, MCP-servere og CLI'er der findes.

transition: Hvor mange ved hvad en MCP server er?

-->

---
layout: default
class: mcp-basics-slide dark-slide
---

<div class="kicker">MODEL CONTEXT PROTOCOL · 04 MIN</div>

# MCP - the semantic<br><span class="accent">tool API for Agents</span>

<div class="mcp-architecture" role="img" aria-label="An MCP server exposes tools and resources. The available servers are described in a manifest inside the LLM context window, where the agent can decide whether a tool is useful for the current task.">
  <section class="mcp-server-column" v-click="1">
    <div class="mcp-step-label">01 · EXPOSE</div>
    <div class="mcp-server-stack">
      <div class="mcp-server-card mcp-github-card">
        <div class="mcp-server-heading"><simple-icons-github class="mcp-github-mark" aria-hidden="true" /><b>GITHUB MCP</b><span class="mcp-transport-badge remote">REMOTE · HTTPS</span></div>
        <p class="mcp-endpoint">https://api.githubcopilot.com/mcp/</p>
        <div class="mcp-capability-group">
          <span class="mcp-capability-label"><mdi-wrench-outline /> TOOLS</span>
          <div class="mcp-chip-row"><span>search_repositories</span><span>create_issue</span></div>
        </div>
        <div class="mcp-capability-group">
          <span class="mcp-capability-label"><mdi-file-document-outline /> RESOURCES</span>
          <div class="mcp-chip-row"><span>repository_content</span></div>
        </div>
      </div>
      <div class="mcp-server-card mcp-as-help-card">
        <div class="mcp-server-heading"><mdi-book-open-page-variant-outline class="mcp-as-help-mark" aria-hidden="true" /><b>AS-HELP MCP</b><span class="mcp-transport-badge local">LOCAL · STDIO</span></div>
        <p class="mcp-endpoint">as-help-server.exe · AS6 Help</p>
        <div class="mcp-capability-group">
          <span class="mcp-capability-label"><mdi-wrench-outline /> TOOLS</span>
          <div class="mcp-chip-row"><span>search_help</span><span>get_page_by_id</span></div>
        </div>
        <div class="mcp-capability-group">
          <span class="mcp-capability-label"><mdi-message-text-outline /> PROMPTS</span>
          <div class="mcp-chip-row"><span>help_search</span><span>help_details</span></div>
        </div>
      </div>
    </div>
  </section>

  <div class="mcp-flow-arrow" aria-hidden="true" v-click="2"><span>discover</span><i></i></div>

  <section class="mcp-context-column" v-click="2">
    <div class="mcp-step-label">02 · DESCRIBE</div>
    <div class="mcp-context-card">
      <div class="mcp-context-heading"><span>MCP Manifest</span><small>connected MCPs + tools</small></div>
      <div class="mcp-manifest">
        <div class="mcp-manifest-heading"><b>TOOL CONTRACTS</b><span>INPUT → RETURNS</span></div>
        <div class="mcp-tool-server github"><simple-icons-github aria-hidden="true" /><b>GITHUB · REMOTE</b></div>
        <div class="mcp-tool-contract">
          <div class="mcp-tool-title"><strong>search_repositories</strong><span>READ</span></div>
          <div><b>in</b> query · optional org/owner qualifiers</div>
          <div><b>out</b> matching repos: name, owner, description, URL</div>
        </div>
        <div class="mcp-tool-contract">
          <div class="mcp-tool-title"><strong>create_issue</strong><span class="is-write">WRITE</span></div>
          <div><b>in</b> owner, repo, title · optional body/labels/assignees</div>
          <div><b>out</b> issue number, state, URL</div>
        </div>
        <div class="mcp-tool-server as-help"><mdi-book-open-page-variant-outline aria-hidden="true" /><b>AS-HELP · LOCAL</b></div>
        <div class="mcp-tool-contract">
          <div class="mcp-tool-title"><strong>search_help</strong><span>READ</span></div>
          <div><b>in</b> query · optional limit/category</div>
          <div><b>out</b> page IDs, titles, breadcrumbs, previews</div>
        </div>
        <div class="mcp-tool-contract">
          <div class="mcp-tool-title"><strong>get_page_by_id</strong><span>READ</span></div>
          <div><b>in</b> page_id · optional text/html/breadcrumb</div>
          <div><b>out</b> full page text, metadata, online URL</div>
        </div>
      </div>
      <div class="mcp-context-note"><mdi-information-outline /> Tool definitions are discoverable &mdash; the agent retrieves each tool's input schema before it calls it.</div>
    </div>
  </section>

  <div class="mcp-flow-arrow" aria-hidden="true" v-click="3"><span>reason</span><i></i></div>

  <section class="mcp-decision-column" v-click="3">
    <div class="mcp-step-label">03 · CHOOSE</div>
    <div class="mcp-decision-card">
      <div class="mcp-agent-mark"><mdi-brain /> <span>AGENT DECISION</span></div>
      <p>Task: decode ACOPOS error <strong>7070</strong> from the logbook</p>
      <strong>CALL search_help</strong>
      <div class="mcp-decision-options"><span class="is-call">CALL TOOL</span><i>or</i><span>ANSWER</span></div>
      <small>The model chooses a useful capability, or answers directly if the context is enough.</small>
    </div>
  </section>
</div>

<div class="mcp-takeaway" v-click="4"><span>MCP is not the model.</span><strong>It makes capabilities discoverable and callable through a shared semantic contract.</strong></div>

<div class="slide-id">16</div>

<!--
MCP står for Model Context Protocol. Tænk på det som et semantisk tool-API: en server beskriver sine tools og resources, så en model kan opdage dem og bruge på en standardiseret måde.

Et eksempel kunne være den officielle GitHub MCP server.
Den har omkring 47 tools til alt lige fra at oprette issues og PR, læse repositories, merge branches osv. 


<b>Som andet eksempel har vi vores egen AS-Help MCP</b>. Det er en lokal server, der via stdio, stiller funktioner til rådighed for at søge i B&R Automation Studio help: search_help, get_categories, browse_section og get_page_by_id. 

Manifestet er ikke selve dataene eller udførelsen. Det giver modellen et katalog over tilgængelige MCP-servere, deres tools med beskrivelser og input-formater i den kontekst, den arbejder med. På baggrund af opgaven kan modellen vælge at kalde search_help for at slå ACOPOS error 7070 op i AS-dokumentationen, create_issue for at rapportere en fejl, eller svare uden et tool.

En MCP server gør altså sine funktioner tilgængelige over et standard interface som en agent kan forstå
-->

---
layout: default
class: as-help-boot-slide dark-slide
---

<div class="kicker">AS-HELP MCP · FIRST BOOT · 03 MIN</div>

# AS-Help MCP:<br><span class="accent">index once, serve locally</span>

<div class="as-help-boot-grid">
  <figure class="as-help-boot-visual" v-click>
    <div class="as-help-image-frame"><img src="/as-help-mcp.png" alt="AS-Help MCP GitHub quick-start configuration for a local server"></div>
    <figcaption><span>LOCAL KNOWLEDGE CONNECTOR</span><b>br-automation-community/as-help-mcp</b><small>Rust server · installed Automation Studio help · LanceDB</small></figcaption>
  </figure>
  <section class="as-help-boot-process">
    <div class="as-help-process-heading"><span>FIRST BOOT</span><small>BUILD THE INDEX · THEN SERVE QUERIES</small></div>
    <div class="as-help-stage-list">
      <div class="as-help-stage" v-click>
        <span class="as-help-stage-number">01</span><mdi-file-tree-outline />
        <div><b>READ LOCAL HELP</b><small>Walk the installed AS Help HTML tree.</small></div>
        <strong>INGEST</strong>
      </div>
      <div class="as-help-stage" v-click>
        <span class="as-help-stage-number">02</span><mdi-database-search-outline />
        <div><b>BUILD FTS INDEX</b><small>Tokenize titles and content for keyword ranking.</small></div>
        <strong>RANK</strong>
      </div>
      <div class="as-help-stage" v-click>
        <span class="as-help-stage-number">03</span><mdi-map-marker-path />
        <div><b>PERSIST METADATA</b><small>Keep page_id, title, file_path, and breadcrumb_path.</small></div>
        <strong>ANCHOR</strong>
      </div>
      <div class="as-help-stage ready" v-click>
        <span class="as-help-stage-number">04</span><mdi-check-circle-outline />
        <div><b>FTS READY</b><small>Keyword search works while optional semantic loading continues.</small></div>
        <strong>SERVE</strong>
      </div>
    </div>
    <div class="as-help-index-record" v-click>
      <div class="as-help-record-heading"><span>SEARCH RECORD</span><small>metadata stays attached to the hit</small></div>
      <div class="as-help-record-grid"><code>page_id</code><b>&lt;returned page id&gt;</b><code>breadcrumb</code><span>Motion &gt; ... &gt; MC_BR_MoveAbsolute</span><code>preview</code><span>short desciption of the context</span></div>
    </div>
    <div class="as-help-query-flow" v-click>
      <div class="as-help-query-heading"><span>AGENT QUERY</span><strong>FTS · KEYWORD RANKING</strong></div>
      <div class="as-help-query-line"><code>search_help</code><span>query: "MC_BR_MoveAbsolute"</span></div>
      <div class="as-help-top-result"><b>#1</b><span>highest-ranked match</span><strong>page_id + breadcrumb + preview</strong></div>
      <div class="as-help-retrieve"><code>get_page_by_id</code><span>page_id</span><b>-&gt; full text + metadata + online URL</b></div>
    </div>
  </section>
</div>

<div class="as-help-boot-takeaway" v-click><span>THE PRO AND THE CON</span><strong>Only reflect what you have installed locally</strong> </div>

<div class="slide-id">17</div>

<!--
Første gang AS-Help MCP starter, læser den den lokale Automation Studio help folder og bygger et søgeindeks. Den gemmer ikke kun søgetekst, men også page_id, titel, filsti og breadcrumb, så et hit kan følges tilbage til den rigtige side.

FTS, full-text search, er klar først og rangerer keyword matches. Semantisk søgning kan være et senere, valgfrit lag. Det vigtige i agent-flowet er, at search_help ikke foregiver at være hele svaret: den returnerer et rangeret hit med page_id, breadcrumb og en kort preview.

Agenten bruger derefter page_id i get_page_by_id for at hente den fulde tekst, metadata og eventuelt online-help URL. Det er en enkel, sporbar to-trins kontrakt: find den bedste adresse, hent derefter evidensen.
-->

---
layout: default
class: mcp-image-pair-slide dark-slide
---

<div class="kicker">OFFICIAL B&amp;R MCP SERVER</div>

# Official B&R MCP<br><span class="accent">On B&R Community</span>

<div class="mcp-image-pair">
  <img src="/br-mcp.png" alt="B&R MCP server setup guidance on the B&R Community">
</div>

<div class="mcp-image-link">
  <mdi-link-variant /><a href="https://community.br-automation.com/t/release-2026-use-b-r-mcp-server-with-any-ai-assistant-using-jwt-from-as-code-6-7-github-copilot-continue-dev-more/11705" target="_blank">community.br-automation.com — Use B&amp;R MCP Server with any AI assistant (JWT from AS Code 6.7)</a>
</div>

<!--
Official B&R MCP

Den som er med i Agentic Bridge. Den indeholder mere B&R viden end bare hjælpen, men den har også nogle begrænsninger. 

1. Den afspejler ikke kun de produkter og libraries du bruger / har installeret, men alt der er tilgængeligt. 

2. Den er hosted på en B&R cloud service. Dine prompts bliver sendt til B&R, men bliver ikke gemt.

3. Den giver ikke refferencer på alle svar, da nogle data ikke er tilgængelige som pdf'er eller hjælp URL'er. 

4. Den er i Beta. Vi anbefaler AS-Help, BR-Community MCP indtil den bliver bedre
-->

---
layout: default
class: br-role-slide
---

<div class="kicker">COMMUNITY CONNECTORS · 03 MIN</div>

# Practical knowledge<br><span class="accent">connectors</span>

<div class="br-role-stack">
  <a class="role-layer" href="https://github.com/br-automation-community/as-help-mcp" target="_blank" rel="noopener noreferrer" aria-label="Open AS-Help MCP on GitHub" v-click>
    <div class="role-number">01</div>
    <mdi-book-open-page-variant-outline />
    <div><span>B&amp;R COMMUNITY · GITHUB</span><b>AS-HELP MCP</b><small>search installed Automation Studio help</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/br-automation-community/br-community-mcp" target="_blank" rel="noopener noreferrer" aria-label="Open B&amp;R Community MCP on GitHub" v-click>
    <div class="role-number">02</div>
    <mdi-forum-outline />
    <div><span>B&amp;R COMMUNITY · GITHUB</span><b>BR-COMMUNITY MCP</b><small>research B&amp;R community discussions</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://learn.microsoft.com/microsoft-365/copilot/extensibility/work-iq/mcp/overview" target="_blank" rel="noopener noreferrer" aria-label="Open Work IQ MCP documentation on Microsoft Learn" v-click>
    <div class="role-number">03</div>
    <mdi-account-network-outline />
    <div><span>MICROSOFT · LEARN</span><b>WORK IQ</b><small>ground Microsoft 365 work context</small></div>
    <div class="micro-status direction role-link">MS LEARN <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/atlassian/atlassian-mcp-server" target="_blank" rel="noopener noreferrer" aria-label="Open the Atlassian MCP server on GitHub" v-click>
    <div class="role-number">04</div>
    <mdi-view-grid-outline />
    <div><span>ATLASSIAN · GITHUB</span><b>ATLASSIAN MCP</b><small>connect Jira and Confluence context</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/github/github-mcp-server" target="_blank" rel="noopener noreferrer" aria-label="Open the official GitHub MCP server on GitHub" v-click>
    <div class="role-number">05</div>
    <simple-icons-github />
    <div><span>OFFICIAL · GITHUB</span><b>GITHUB MCP</b><small>read repos, issues, and pull requests</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/figma/mcp-server-guide" target="_blank" rel="noopener noreferrer" aria-label="Open the Figma MCP server guide on GitHub" v-click>
    <div class="role-number">06</div>
    <mdi-vector-square />
    <div><span>FIGMA · GITHUB</span><b>FIGMA MCP</b><small>bring design context into engineering</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/microsoft/playwright-mcp" target="_blank" rel="noopener noreferrer" aria-label="Open the Playwright MCP server on GitHub" v-click>
    <div class="role-number">07</div>
    <mdi-web-check />
    <div><span>MICROSOFT · GITHUB</span><b>PLAYWRIGHT MCP</b><small>drive and verify HMI in a real browser</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
  <a class="role-layer" href="https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem" target="_blank" rel="noopener noreferrer" aria-label="Open the Filesystem MCP server on GitHub" v-click>
    <div class="role-number">08</div>
    <mdi-folder-open-outline />
    <div><span>MCP REFERENCE · GITHUB</span><b>FILESYSTEM MCP</b><small>read and write project files under policy</small></div>
    <div class="micro-status community role-link">GH REPO <mdi-open-in-new aria-hidden="true" /></div>
  </a>
</div>



<!--
Eksempler på relevante MCP servere:
-->

---
layout: default
class: support-agent-sequence-slide
---

<div class="support-agent-sequence">
  <img class="support-agent-frame" src="/support-agent-welcome.png" alt="B&R Support Agent welcome screen">
  <img class="support-agent-frame" src="/support-agent-chat.png" alt="B&R Support Agent chat response" v-click="1">
  <img class="support-agent-frame" src="/online-help.png" alt="B&R Automation Help documentation page" v-click="2">
</div>
<!--
Et eksempel på en application som vi har lavet - B&R Support Agent

Her kan man forbinde et workspace så agenten kan kigge i et project f.eks.

Man kan uploade filer. Det kunne f.eks være en system dump eller en wireshark trace.

Man kan give den en persona (instruktioner til workflow). F.eks Du skal altid give links til relevante kilder.

Den kan nu bruge dens forbundne MCP servere til at søge den fornødne domæneviden.

- AS4 / AS6 help
- Atlassian (Jira tickets og confluence dokumentation)
- br-community mcp
- workIQ (sharepoint, teams kanaler, support mail box)
- Revision history (released firmware med release notes)

Vi kan stille den et spørgsmål og se hvordan den bruger sine tools.

Og hvordan den giver link direkte til online-hjælpen

-->

---
layout: default
class: demo-slide dark-slide as-cli-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR</div>
<div class="kicker">EXECUTION · 04 MIN</div>

# as cli:<br><span class="accent">action + observation</span>

<div class="demo-steps">
  <div v-click><span>01</span><b>BROWSE</b><small>--help → command surface</small></div>
  <div v-click><span>02</span><b>SIM ENABLE</b><small>ArSim enabled</small></div>
  <div v-click><span>03</span><b>BUILD SIM</b><small>errors,warnings → diagnostics</small></div>
  <div v-click><span>04</span><b>PLC CONNECT</b><small>--ip 127.0.0.1</small></div>
  <div v-click><span>05</span><b>READ VAR</b><small>counter → value + type</small></div>
  <div v-click><span>06</span><b>WRITE VAR</b><small>em.cmd.clear → written</small></div>
  <div v-click><span>07</span><b>READ LOGBOOK</b><small>arlogsys → info + error entries</small></div>
  <div v-click><span>08</span><b>CREATE PIP</b><small>--output ./pip</small></div>
</div>

<TerminalCli />


<div class="slide-id">20</div>

<!--
`AS CLI` er et command-line interface der kan bruges af et menneske, et script, en automatisk test, en CI-pipeline og en agent.

AS CLI er selve rygraden i Agentic Bridge og er noget vi har udviklet her i DK. Det er et mere eller mindre komplet interface til Automation Studio 6 og kan mange af de samme ting som man ellers manuelt skal udføre i automation studio. Ud over selve runtime funktionerne som vi kigger på om lidt, så kan det også tilføje libraries, hardware, tasks, hmi, konfigurationer osv. Selvom det selvfølgelig bare er text, så er det mere pålideligt at bruge den existerende scripting engine bag AS, så alt bliver indsat rigtig og konfigureret med valide parametre.

Det åbner Automation Studio i headless mode (uden GUI) og forbinder direkte til backenden i AS. Alle functioner og status bliver tilgængeligt via et json-rpc interface, der gør det nemt f.eks at bygge en VS-Code extension, et AS-SDK til tests eller noget tredje. Det er i hvert fald noget af det næste vi gerne vil lave. 

Da vi designede CLI'et var det vigtigt for os, at AI blev tænkt ind i designet. Dvs. at en Agent skal selv kunne finde ud af at bruge det, uden at man skal instruere den i hvordan.

Agenten kan lave --help overalt for at søge information om hvilke kommandoer og hvilke parametre den kan bruge og hvad de vil returnere.

Det kan simulere, men også betjene simulatoren. Den kan f.eks skrue op eller ned for tiden. På den måde kan den prøve ting af i slowmotion eller speede tiden op hvis den skal køre en test på et stort batch.

Det kan builde projektet til enten fysisk hardware, en simulator eller til en ProjectInstallationPackage PIP (Deployment artifact)

Forbinde til PLC og læse / skrive til variable eller direkte til IO.

Læse logbøger osv.
-->

---
layout: default
class: skills-slide dark-slide
---

<div class="status-badge general">OPEN ECOSYSTEM</div>
<div class="kicker">AGENT WORKFLOWS · 02 MIN</div>

# <span class="accent">Skills</span>.sh

<SkillsEmbed />

<div class="slide-id">21</div>

<!--
skills.sh viser et åbent katalog af genbrugelige skills til AI-agenter uanset harness.
Se hvad der trender.
Nemt at installere.

-->

---
layout: default
class: skill-matrix-slide dark-slide
---

<div class="kicker">SKILL DESIGN · 02 MIN</div>

# The four categories of<br><span class="accent">skills</span>

<div class="skill-axes">
  <div class="skill-axis"><mdi-lightbulb-auto-outline /><b>MODEL-INVOKED</b><small>discoverable — the agent loads it when the task needs it</small></div>
  <div class="skill-axis"><mdi-play-box-outline /><b>USER-INVOKED</b><small>invoked — you call it deliberately, like a saved prompt</small></div>
  <div class="skill-axis"><mdi-database-off-outline /><b>STATELESS</b><small>one shot, no memory between runs</small></div>
  <div class="skill-axis"><mdi-database-sync-outline /><b>STATEFUL</b><small>carries progress across turns and files</small></div>
</div>

<div class="skill-matrix">
  <article class="skill-quadrant" v-click>
    <span class="skill-tags">MODEL-INVOKED <i>·</i> STATELESS</span>
    <b>event-script skill for mappView</b>
    <small>Picked up automatically when writing HMI scripts for mappView.</small>
  </article>
  <article class="skill-quadrant" v-click>
    <span class="skill-tags">MODEL-INVOKED <i>·</i> STATEFUL</span>
    <b>domain-modeling skill</b>
    <small>Picked up automatically when discussing codebase terminology, consuming and editing a CONTEXT.md</small>
  </article>
  <article class="skill-quadrant" v-click>
    <span class="skill-tags">USER-INVOKED <i>·</i> STATELESS</span>
    <b>triage skill for GitHub issues</b>
    <small>You invoke it on a ticket. Same procedure every time, nothing carried over.</small>
  </article>
  <article class="skill-quadrant" v-click>
    <span class="skill-tags">USER-INVOKED <i>·</i> STATEFUL</span>
    <b>grill-with-docs skill</b>
    <small>You start it when describing a new feature. A CONTEXT.md and ADR.md is stored to document decisions for future runs.</small>
  </article>
</div>

<div class="skill-matrix-takeaway" v-click>
  <mdi-set-split /> <b>Model-invoked vs user-invoked</b> is about <i>how it is triggered</i><span>·</span><b>stateless vs stateful</b> is about <i>what it remembers</i>
</div>

<figure class="skill-invocation-shot" v-click>
  <img src="/skill-invocation.png" alt="SKILL.md frontmatter with disable-model-invocation set to true">
  <figcaption>One line in the frontmatter turns a <b>model-invoked</b> skill into a <b>user-invoked</b> skill</figcaption>
</figure>

<div class="slide-id">22</div>

<!--
Skills falder i to uafhængige dimensioner.

<b>Første dimension</b> er, hvordan de aktiveres. Et model-invoked skill ligger fremme og bliver loadet af agenten selv, når opgaven kalder på det. Et user-invoked skill invokerer du bevidst, som en gemt prompt.

Et model-invoked skill kan være noget information som du gerne vil have at agenten fokuserer på i bestemte sammenhænge. Når vi tester skal vi altid bruge pytest med as cli, eller når vi researcher skal vi altid lave et dokument med refferencer til kilderne.

Et user-invoked skill er mere en fast del af et workflow. F.eks: Lav en ticket og brug altid denne her template. Lav et review af det her kode ud fra de her principper. Det er brugeren og KUN brugeren der kan aktivere skillet.


<b>Anden dimension</b> er, om de husker noget. Et stateless skill kører én gang og glemmer. Et stateful skill bygger op og genbruger tidligere outputs.


De to dimensioner kombineres frit, så du får fire typer af skills. Vælg bevidst, når du designer et nyt skill.
-->

---
layout: default
class: guardrails-slide dark-slide
---

<div class="kicker">ENGINEERING CONTRACT · 05 PRINCIPLES</div>

# Guardrails for<br><span class="accent">useful speed</span>

<p class="guardrails-lead">Principles keep agent output compatible with the machine, the operator, and the release process.</p>

<div class="guardrails-grid">
  <article class="guardrail-principle" v-click>
    <div class="guardrail-head"><span>01</span><mdi-file-tree-outline /></div>
    <h2>Architecture</h2>
    <p>Bound the agent by modules, interfaces, and ownership.</p>
    <small>CLEAR DEPENDENCIES</small>
  </article>
  <article class="guardrail-principle" v-click>
    <div class="guardrail-head"><span>02</span><mdi-text-box-outline /></div>
    <h2>Naming conventions</h2>
    <p>Name for domain intent, not implementation detail.</p>
    <small>CONSISTENT + SEARCHABLE</small>
  </article>
  <article class="guardrail-principle" v-click>
    <div class="guardrail-head"><span>03</span><mdi-test-tube /></div>
    <h2>TDD</h2>
    <p>Specify behavior first; make red, green, refactor routine.</p>
    <small>PROVE THE CHANGE</small>
  </article>
  <article class="guardrail-principle" v-click>
    <div class="guardrail-head"><span>04</span><mdi-monitor-dashboard /></div>
    <h2>HMI Design</h2>
    <p>Expose state, intent, alarms, and recovery to the operator.</p>
    <small>OPERATOR CAN ACT</small>
  </article>
  <article class="guardrail-principle" v-click>
    <div class="guardrail-head"><span>05</span><mdi-shield-check-outline /></div>
    <h2>Safety rules</h2>
    <p>Separate safety from optimization. Stop on uncertainty.</p>
    <small>HUMAN APPROVAL</small>
  </article>
</div>

<div class="guardrails-footer" v-click>
  <span>GUARDRAILS TURN GOOD INTENT INTO CHECKABLE ENGINEERING</span>
  <strong>READ · CHANGE · VERIFY</strong>
</div>

<div class="slide-id">22</div>

<!--
Guardrails er de beslutninger, vi vil kunne se igen i kode, tests og review.

Guardrailes kan defineres via dine skills eller agent.md filer. (eller en kombination).

Det er instruktioner der skal guide agenterne til følge dine regler og overholde dine krav.

Det kan være krav til arkitektur eller HMI design. Det kan også være CRA krav som skal overholdes eller eksplicit testes. 

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

<div class="slide-id">28</div>

<!--
På et brownfield-projekt skal vi etablere en baseline for den eksisterende adfærd, før agenten ændrer projektet: bygge relevante konfigurationer, køre eksisterende regressioner og beskytte kritiske maskinflows.

Test er ikke kun den sidste kvalitetskontrol. For en agent er test og simulation sensorer i feedback-loopet.

Unit tests kan bevise lokal logik. Integrationstest kan bevise interfaces. ARsim og smoke tests kan bevise defineret applikationsadfærd i et kontrolleret miljø. HIL og fysisk validering tilføjes, hvor risiko og fidelity kræver det.

Agenten kan hjælpe med at skrive test, men den må ikke alene definere sin egen sandhed. Acceptance criteria eller reference behavior skal reviewes uafhængigt.
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

<div class="slide-id">26</div>

<!--
Instructions og guardrails styrer en probabilistisk model. De er vigtige, men de er adfærdsvejledning - ikke enforcement.

Deterministiske tools kører uafhængigt af agentens opmærksomhed: compiler, schemas, permissions, architecture checks og blocking tests. Det betyder ikke, at checket er komplet eller at testen nødvendigvis er rigtig. Mennesker skal stadig reviewe test-oraklet.

Pull requesten samler requirement, diff, testresultater, assumptions, unresolved risk og reproduktionskommandoer. Build, static checks og behavior tests blokerer. En kompetent person accepterer de strategiske valg og release.
-->

---
layout: default
class: feedback-slide dark-slide
---

<div class="kicker">EXECUTABLE FEEDBACK · 03 MIN</div>

# Close the industrial<br><span class="accent">engineering loop</span>

<AutomationStudioAgent />

<div class="slide-id">14</div>

<!--
Et agentforslag er først værdifuldt, når vi kan lukke loopet. Før loopet kan handle, skal det have domænekontekst: projektstruktur, produkt- og versionsviden, regler og intent. Projektet skal derefter kunne bygges reproducerbart. Vi skal kunne starte en kontrolleret simulation, stimulere en tilstand, observere variable og logbook og sammenligne resultatet med et krav.

På sliden ses guardrails via instructions og skills, derefter research via AS-HELP, BR-COMMUNITY, firmware-noter og den cloud-baserede AS-COPILOT MCP. Automation Studio læser og skriver kode gennem Main.st-editoren, mens as bygger, simulerer, læser variable og læser logbook.

DevOps udfører en kendt sekvens deterministisk. Agenten vælger næste afgrænsede handling ud fra feedback. Det er derfor vigtigt, at det samme command contract kan anvendes af en engineer, en test, en pipeline og en agent.

Transition: Det er præcis den rejse, B&R selv har været igennem.
-->

---
layout: default
class: use-case-slide dark-slide
---

<div class="status-badge direction">USE CASE · BOUNDED FEATURE</div>
<div class="kicker">FEATURE REQUEST · 03 MIN</div>

# Recover the axis fault.<br><span class="accent">Resume the batch.</span>

<div class="use-case-layout">
  <div class="use-case-brief">
    <div class="use-case-intent">
      <span>FEATURE REQUEST</span>
      <p>When the conveyor axis faults, stop cleanly, clear every uncapped bottle off the conveyor as reject, keep the produced count, and resume the same 100-bottle batch.</p>
    </div>
    <div class="use-case-contract">
      <div><span>01</span><b>OBSERVE</b><small>Abort is visible and the counter holds its value.</small></div>
      <div><span>02</span><b>CLEAR</b><small>Reject every uncapped bottle, empty or filled.</small></div>
      <div><span>03</span><b>RESUME</b><small>Start again and resume counting from the held value.</small></div>
      <div><span>04</span><b>PROVE</b><small>Complete the 100 batch with state and logbook evidence.</small></div>
    </div>
  </div>

  <div class="use-case-machine">
    <BottleConveyor interactive />
    <div class="use-case-machine-caption"><span>INTERACTIVE CONTROLLER</span><b>E-STOP → CLEAR → START</b></div>
  </div>
</div>

<div class="use-case-bridge" v-click>
  <div><span>ONE FEATURE · THREE WORKFLOWS</span><b>Spec → tickets → implementation → test → validation → PR</b></div>
  <mdi-arrow-right />
  <strong>Next: the workflow</strong>
</div>

<div class="slide-id">29</div>

<!--
Dette er den konkrete feature, som vi bruger på næste slide til at gøre workflows håndgribelige.

Feature request: Når conveyor-aksen fejler, skal maskinen stoppe kontrolleret. Clear skal rydde alle flasker, der endnu ikke er cappet - uanset om de er tomme eller fyldte - og de tæller som reject. Counteren beholder sin værdi, og batchen fortsætter fra samme tal ved start, indtil de 100 flasker er færdige. 

Nu kan vi vise, hvordan den samme feature først bliver afklaret, derefter implementeret og til sidst gjort reviewable gennem forskellige agent workflows.
-->

---
layout: default
class: vertical-modules-slide dark-slide
---

<div class="kicker">AGENTIC METHOD · VERTICAL SLICES</div>

# Build features<br><span class="accent">through the stack</span>

<p class="vertical-modules-lead">Humans optimize for focus. Agents can optimize for feedback.</p>

<div class="kanban-compare">
  <section class="kanban-panel horizontal-panel" v-click>
    <div class="kanban-panel-head">
      <div><span>HUMAN DEFAULT</span><b>Discipline lanes</b></div>
      <mdi-view-column-outline />
    </div>
    <p class="kanban-panel-note">Specialists stay focused. The feature waits at the integration boundary.</p>
    <div class="kanban-board category-board">
      <div class="kanban-columns"><span></span><b>BACKLOG</b><b>IN PROGRESS</b><b>PROVEN</b></div>
      <div class="kanban-lanes">
        <div class="kanban-lane category-lane"><span class="kanban-lane-label">HMI</span><div class="kanban-cell"><span class="kanban-card">fault + reset screen</span></div><div class="kanban-cell"><span class="kanban-card muted-card">needs state names</span></div><div class="kanban-cell"></div></div>
        <div class="kanban-lane category-lane"><span class="kanban-lane-label">SAFETY</span><div class="kanban-cell"><span class="kanban-card amber-card">safe stop on fault</span></div><div class="kanban-cell"><span class="kanban-card muted-card">needs reset rule</span></div><div class="kanban-cell"></div></div>
        <div class="kanban-lane category-lane"><span class="kanban-lane-label">CONTROL</span><div class="kanban-cell"><span class="kanban-card">abort + clear states</span></div><div class="kanban-cell"><span class="kanban-card muted-card">needs reject logic</span></div><div class="kanban-cell"></div></div>
        <div class="kanban-lane category-lane"><span class="kanban-lane-label">I/O + HW</span><div class="kanban-cell"><span class="kanban-card">axis error handling</span></div><div class="kanban-cell"><span class="kanban-card muted-card">needs sim rig</span></div><div class="kanban-cell"></div></div>
      </div>
    </div>
    <div class="kanban-result blocked">
      <mdi-clock-alert-outline />
      <div><span>INTEGRATION DAY</span><b>No complete feature to test</b></div>
    </div>
  </section>

  <div class="kanban-contrast" v-click>
    <span>SAME BOARD<br><strong>NEW UNIT</strong></span>
    <mdi-arrow-right />
  </div>

  <section class="kanban-panel vertical-panel" v-click>
    <div class="kanban-panel-head">
      <div><span>AGENT + TDD</span><b>Feature lanes</b></div>
      <mdi-view-column-outline />
    </div>
    <p class="kanban-panel-note">Keep one behavior in context. Cross every boundary, then prove it.</p>
    <div class="kanban-board feature-board">
      <div class="kanban-columns"><span></span><b>BACKLOG</b><b>IN PROGRESS</b><b>PROVEN</b></div>
      <div class="kanban-lanes">
        <div class="kanban-lane feature-lane"><span class="kanban-lane-label">OBSERVE<br>FAULT</span><div class="kanban-cell"><span class="kanban-card red-card">abort is visible</span></div><div class="kanban-cell"><span class="kanban-card">HMI + state + axis</span></div><div class="kanban-cell"><span class="kanban-card done-card">count holds</span></div></div>
        <div class="kanban-lane feature-lane"><span class="kanban-lane-label">CLEAR<br>CONVEYOR</span><div class="kanban-cell"><span class="kanban-card red-card">uncapped stay on</span></div><div class="kanban-cell"><span class="kanban-card">reject logic + safety</span></div><div class="kanban-cell"><span class="kanban-card done-card">conveyor empty</span></div></div>
        <div class="kanban-lane feature-lane"><span class="kanban-lane-label">RESUME<br>BATCH</span><div class="kanban-cell"><span class="kanban-card red-card">restart resets count</span></div><div class="kanban-cell"><span class="kanban-card">reset + sequence</span></div><div class="kanban-cell"><span class="kanban-card done-card">continues from held</span></div></div>
        <div class="kanban-lane feature-lane"><span class="kanban-lane-label">PROVE<br>100 BATCH</span><div class="kanban-cell"><span class="kanban-card red-card">no evidence</span></div><div class="kanban-cell"><span class="kanban-card">sim run + logbook</span></div><div class="kanban-cell"><span class="kanban-card done-card">100 bottles done</span></div></div>
      </div>
    </div>
    <div class="kanban-result ready">
      <mdi-test-tube />
      <div><span>EVERY MOVE HAS A SIGNAL</span><b>A working feature at every step</b></div>
    </div>
  </section>
</div>

<div class="tdd-loop" v-click>
  <div class="tdd-loop-label"><span>THE AGENT'S RHYTHM</span><b>One slice at a time</b></div>
  <div class="tdd-step red"><span>01</span><strong>RED</strong><small>write failing test</small></div>
  <mdi-arrow-right />
  <div class="tdd-step green"><span>02</span><strong>GREEN</strong><small>make the smallest change</small></div>
  <mdi-arrow-right />
  <div class="tdd-step refactor"><span>03</span><strong>REFACTOR</strong><small>review, then repeat</small></div>
</div>

<div class="vertical-modules-takeaway" v-click>
  <span>THINK IN BEHAVIORS, NOT LAYERS</span>
  <strong>One narrow outcome. One fast feedback loop.</strong>
</div>

<div class="slide-id">23</div>

<!--
Mennesker organiserer sig ofte i kanban-swimlanes efter fagdisciplin: HMI, safety, control og hardware. Det er en rationel arbejdsform, når fokus er begrænset, og når forskellige personer ejer forskellige fagligheder. Men featureadfærden bliver først synlig, når alle kategorier er integreret.

En agent kan holde en afgrænset feature på tværs af lag i sin working context. Derfor kan den arbejde vertikalt: feature-swimlanes med HMI-state, safety contract, control logic, I/O eller simulation og acceptance test i samme korte loop. Safety boundary er stadig en review- og approval-grænse; vertikal betyder ikke autonom safety release.

Matt Pococks TDD-skill beskriver horizontal slicing som anti-patternet: skriv ikke alle tests først og al implementation bagefter. Arbejd i vertical slices: én test, én minimal implementation, gentag. Hver test er en tracer bullet, der bruger feedback fra den forrige cyklus. Red før green; refactor hører til reviewfasen.

Kilde: https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/SKILL.md
-->

---
layout: default
class: planning-slide dark-slide
---

<div class="kicker">WORKFLOWS · 04 MIN</div>

# Three workflows<br><span class="accent">everyone needs</span>

<AgentWorkflow />

<div class="slide-id">30</div>

<!--
"Recover efter en aksefejl" lyder som en opgave, men det er ikke en specifikation. Agenten kan researche eksisterende states, variable og patterns. Product intent og trade-offs skal tilbage til engineer eller product owner.

Den første workflow handler om at få den rigtige opgave. Den anden kan være unattended, når den er bounded, isolated og har earned trust. Den sidste handler om accountability.

Start human-in-the-loop. Godkend mål, scope og permissions før kørsel. Stop ved tvetydighed, policy-konflikt eller irreversibel handling. Godkend evidence og engineering trade-offs til sidst.
-->

---
layout: default
class: devops-cover ai-workshop-cover dark-slide
---

<div class="devops-chapter">02</div>

<div class="kicker">WORKSHOP 02</div>
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

<div class="slide-id">36</div>

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
<div class="kicker">WORKSHOP 02 · ORIENTATION</div>

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

<div class="slide-id">37</div>
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

<div class="slide-id">38</div>

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

<div class="kicker">WORKSHOP 02 · THE OLD WAY</div>

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

<div class="slide-id">39</div>

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

<div class="kicker">WORKSHOP 02 · DEVOPS</div>

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

<div class="slide-id">40</div>

<!--
Continuous Integration means that each change meets the same build and test process. The goal is not to make every change perfect before it moves. The goal is to find problems while the change is still small enough to understand.

The engineer creates and versions the change. The pipeline produces a repeatable output, runs the expected checks, and records evidence. A green result does not replace engineering judgment, but it gives the engineer something objective to review.

Transition: Once software is verified, how do we move it toward a controlled release?
-->

---
layout: default
class: where-agentic-fits dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS</div>

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

<div class="slide-id">41</div>

<!--
Continuous Delivery begins with the verified result from Continuous Integration. The pipeline packages that result so it can be identified, reproduced, and moved without rebuilding it by hand.

The release candidate is ready, but ready does not mean automatic. A human release decision remains visible between the candidate and the deployment target. After deployment, monitoring tells us what happened in the real environment and provides feedback for the next change.

Transition: CI and CD are most useful when we see them as one connected delivery flow.
-->

---
layout: default
class: devops-pipeline dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS</div>

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

<div class="delivery-feedback" v-click="3">
  <div class="delivery-footer-label"><mdi-chart-timeline-variant-shimmer /><span>FEEDBACK LOOP</span></div>
  <strong>Monitor what happened. Feed the next change.</strong>
</div>

<div class="slide-id">42</div>

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
<div class="kicker">WORKSHOP 02 · TOOLING</div>

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

<div class="slide-id">43</div>

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
<div class="kicker">WORKSHOP 02 · AS · DEMO ROADMAP</div>

# New <span class="accent">as CLI</span>

<div class="as-cli-subtitle">One programmable interface for pipelines, agents, and engineers.</div>

<div class="as-cli-consumer-row" aria-label="Consumers of as">
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

<div class="as-cli-core-row" aria-label="as programmable tool layer">
  <section class="as-cli-core" aria-label="as command-line tool">
    <div class="as-cli-core-topline"><span>PROGRAMMABLE TOOL LAYER</span><small>B&amp;R ENGINEERING ACCESS</small></div>
    <div class="as-cli-terminal-line"><span>&gt;_</span> <strong>as</strong></div>
    <div class="as-cli-core-name">AUTOMATION STUDIO COMMAND LINE INTERFACE</div>
  </section>
</div>

<div class="as-cli-roadmap" aria-label="as demonstration roadmap">
  <div class="as-cli-capability-grid">
    <article class="as-cli-capability-card as-cli-capability-build" v-click="1">
      <div class="as-cli-capability-head"><span>01</span><mdi-hammer-wrench /></div>
      <b class="as-cli-capability-name">BUILD</b>
      <div class="as-cli-capability-purpose">Compile the project</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> build</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-test" v-click="1">
      <div class="as-cli-capability-head"><span>02</span><mdi-test-tube /></div>
      <b class="as-cli-capability-name">TEST INTERACTION</b>
      <div class="as-cli-capability-purpose">Set inputs and inspect behavior</div>
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> var write ...</span></div>
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> var read ...</span></div>
      </div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-package" v-click="1">
      <div class="as-cli-capability-head"><span>03</span><mdi-package-variant-closed /></div>
      <b class="as-cli-capability-name">PACKAGE</b>
      <div class="as-cli-capability-purpose">Create an installation package</div>
      <small class="as-cli-capability-sublabel">PROJECT INSTALLATION PACKAGE</small>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> build pip --output ...</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-transfer" v-click="1">
      <div class="as-cli-capability-head"><span>04</span><span class="as-cli-approval-icon" title="Controlled deployment"><mdi-account-check-outline /></span></div>
      <div class="as-cli-capability-icon"><mdi-upload-network-outline /></div>
      <b class="as-cli-capability-name">TRANSFER</b>
      <div class="as-cli-capability-purpose">Transfer to a target</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> transfer online --ip ...</span></div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-diagnostics" v-click="1">
      <div class="as-cli-capability-head"><span>05</span><mdi-file-search-outline /></div>
      <b class="as-cli-capability-name">DIAGNOSTICS</b>
      <div class="as-cli-capability-purpose">Read controller logbook entries</div>
      <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> logbook read</span></div>
    </article>
  </div>
</div>

<div class="slide-id">44</div>

<!--
The previous slide established that pipelines and agents need programmable access to engineering tools. This is the role of as.

as is not the DevOps pipeline. The pipeline decides which operations should run and when they should run. as provides a repeatable way to execute the requested engineering operation.

as is also not the AI agent. An agent can decide that it needs to build a project, inspect a variable, or retrieve diagnostics. It still needs a tool to perform the operation.

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

# How <span class="accent">as</span> tests itself

<div class="as-cli-devops-flow" aria-label="as development test gates">
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

<div class="slide-id">45</div>

<!--
Demo 1 shows the DevOps loop used to develop as itself.

Start with the fast gate. run-tests.ps1 locates the .NET Framework csc.exe compiler, compiles a curated
SDK-free subset of production code with the hand-rolled test harness, and runs it in seconds. This is the
default check for every change.

Then show the real-system gate. run-integration-tests.ps1 rebuilds as unless asked to reuse the binary,
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

<div class="machine-demo-subtitle">A GitHub workflow builds, tests, packages, and deploys this demonstration project.</div>

<div class="machine-demo-meta">
  <span>PROJECT IN GITHUB</span>
  <span class="machine-demo-path">.\EventAiAndDevOps\DevOps\DevOpsDemo</span>
</div>

<div class="machine-demo-machine">
  <BottleConveyor state="running" :count="42" />
</div>

<div class="slide-id">46</div>

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
class: hmi-testing-slide dark-slide
---

<div class="kicker">HMI VERIFICATION</div>

# Test the HMI <span class="accent">like a user</span>

<p class="hmi-testing-subtitle">Automated checks of real operator workflows.</p>

<div class="hmi-testing-flow" aria-label="Operator workflow from action to verified result">
  <article class="hmi-testing-card is-user">
    <div class="hmi-testing-card-head"><span>01</span><mdi-account-outline /></div>
    <div><small>USER ACTION</small><strong>Press Start</strong></div>
  </article>
  <div class="hmi-testing-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="hmi-testing-card is-hmi">
    <div class="hmi-testing-card-head"><span>02</span><mdi-monitor-dashboard /></div>
    <div><small>HMI</small><strong>Button changes state</strong></div>
  </article>
  <div class="hmi-testing-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="hmi-testing-card is-plc">
    <div class="hmi-testing-card-head"><span>03</span><mdi-cog-outline /></div>
    <div><small>PLC</small><strong>Machine reacts</strong></div>
  </article>
  <div class="hmi-testing-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="hmi-testing-card is-result">
    <div class="hmi-testing-card-head"><span>04</span><mdi-check-circle-outline /></div>
    <div><small>RESULT</small><strong>Expected behavior verified</strong></div>
  </article>
</div>

<div class="hmi-testing-takeaway">
  <mdi-shield-check-outline />
  <strong>Every software change can automatically prove that the operator workflow still works.</strong>
</div>

<div class="hmi-testing-examples">
  <span>EXAMPLES</span>
  <p>Start machine &bull; Change recipe &bull; Acknowledge alarm &bull; Verify status indication</p>
</div>

<div class="slide-id">W2 · 50</div>

<!--
This slide makes the concept deliberately simple: an automated check follows the same path as a real operator.

Walk left to right. The user presses Start, the HMI changes state, the PLC and machine react, and the expected behavior is verified.

The same pattern applies to starting a machine, changing a recipe, acknowledging an alarm, or verifying a status indication. The point is the repeatable operator workflow, not the test framework.

Transition: once an operator workflow can produce evidence, the team can make that check part of the repeatable path from commit to evidence.
-->


---
layout: default
class: start-path-slide dark-slide
---

<div class="brandbar end-brand">
  <div class="brandmark">B<span>&amp;</span>R</div>
  <div class="brandline">Industrial Automation</div>
</div>

<div class="kicker">THE FIRST LOOP · PRACTICAL START</div>

# Start <span class="accent">Monday Morning</span>

<p class="start-path-lead">One repeatable engineering path is enough</p>

<div class="start-path-roadmap" aria-label="Five-step repeatable engineering path">
  <article class="start-path-step is-version">
    <div class="start-path-step-head"><span>01</span><mdi-source-branch /></div>
    <div><small>VERSION</small><strong>Put the project in Git</strong></div>
  </article>
  <div class="start-path-connector connector-one" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="start-path-step is-build">
    <div class="start-path-step-head"><span>02</span><mdi-hammer-wrench /></div>
    <div><small>BUILD</small><strong>Create one repeatable build command</strong></div>
  </article>
  <div class="start-path-connector connector-two" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="start-path-step is-test">
    <div class="start-path-step-head"><span>03</span><mdi-test-tube /></div>
    <div><small>TEST</small><strong>Automate one meaningful check</strong></div>
  </article>
  <div class="start-path-connector connector-three" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="start-path-step is-evidence">
    <div class="start-path-step-head"><span>04</span><mdi-file-check-outline /></div>
    <div><small>EVIDENCE</small><strong>Store test results and build outputs</strong></div>
  </article>
  <div class="start-path-connector connector-four" aria-hidden="true"><mdi-arrow-right /></div>
  <article class="start-path-step is-release">
    <div class="start-path-step-head"><span>05</span><mdi-account-check-outline /></div>
    <div><small>RELEASE</small><strong>Make deployment a deliberate decision</strong></div>
  </article>
</div>

<div class="start-path-takeaway">
  <strong>Do not automate the whole factory.</strong>
  <b>Make one change repeatable from commit to evidence.</b>
</div>

<div class="start-path-footer">
  <span>Agentic Engineering creates changes faster.</span>
  <b>DevOps gives every change a repeatable path.</b>
</div>

<div class="slide-id">W2 · 51</div>

<!--
The goal is not to become a Silicon Valley software company overnight.

Start with a single engineering workflow.

One versioned project, one repeatable build, one automated test, one piece of evidence.

Success is not a perfect pipeline.

Success is eliminating one manual step and being able to reproduce the result tomorrow.
-->

---
layout: default
class: working-in-progress dark-slide
---

<!--
Make an ending slide about "what we are working on". Be honest about that we have been working on the tooling but we still need experience in using the tool and look forward to how customer use it.
Mention we currently see 2 big points we are working On:
- Automation Studio support in Docker
- Package Manager for Technology Packages, hardware files

Maybe use wording like OT does not become IT in a year.
-->

<div class="status-badge progress">IN PROGRESS</div>
<div class="kicker">WHAT WE ARE WORKING ON</div>

# Work <span class="accent">in progress.</span>

<p class="working-lead">The tooling is taking shape. The next proof comes from using it in real customer workflows.</p>

<div class="working-streams">
  <article class="working-stream" v-click>
    <div class="working-stream-head"><span>01</span><mdi-docker /><small>PLATFORM SUPPORT</small></div>
    <h2>Automation Studio<span> in Docker</span></h2>
    <p class="working-stream-copy">Containerize engineering tools to simplify setup, improve integration, and ensure consistent execution across pipelines and agent workflows.</p>
    <div class="working-stream-status"><i></i><span>IN DEVELOPMENT</span></div>
  </article>
  <article class="working-stream" v-click>
    <div class="working-stream-head"><span>02</span><mdi-package-variant-closed /><small>PROJECT DEPENDENCIES</small></div>
    <h2>Package Manager</h2>
    <p class="working-stream-copy">Make project dependencies easier to discover, manage, and install, including technology packages and hardware-specific files.</p>
    <div class="working-stream-status"><i></i><span>IN DEVELOPMENT</span></div>
  </article>
</div>

<br/>

<div class="working-principle" v-click>
  <div class="working-principle-title"><strong>Do you agree?</strong></div>
  <p>Do you have suggestions for our next priorities?</p>
</div>

<div class="slide-id">W2 · 52</div>

---
layout: default
class: questions-slide dark-slide
---

<div class="kicker">CLOSING · OPEN DISCUSSION</div>

# Questions?
<br />
<div class="questions-hero">
  <div class="questions-mark" aria-hidden="true"><span>OPEN FLOOR</span><b>?</b></div>
  <div class="questions-hero-copy">
    <span>OVER TO YOU</span>
    <strong>What should we explore next?</strong>
    <p>What do you think?</p>
  </div>
</div>

<div class="questions-footer"><span>THANK YOU</span><i></i><b>B&amp;R INDUSTRIAL AUTOMATION &middot; AGENTIC ENGINEERING + DEVOPS</b></div>

<div class="slide-id">W2 · 53</div>