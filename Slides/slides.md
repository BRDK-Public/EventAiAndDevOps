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

Vi har valgt at lave et event med både AI og DevOps fordi vi <b>ser mange synergier.</b> 
AI tilbyder et helt nyt niveau af produktivitet mens DevOps sikrer kvaliteten. De to ting går hånd i hånd.

Vi fornemmer også at både AI og DevOps er emner der deler vandende. <b>AI er overalt</b>. Det er facinerende hvad det kan bruges til. Der er meget hype og det er helt naturligt at have <b>en sund skepsis</b>. For det er jo trods alt ikke magi!

DevOps introducerer <b>en masse regler og struktur</b>. Nogen ser det som religion, andre som rigide processer der <b>dræber enhver form  for kreativitet og produktivit.</b>

Med konceptet Agentic Engineering vil vi forhåbentligt <b>vise det bedste af begge verdener!</b> 
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
Det er ikke alle her der kender koncepterne.

Derefter en mere dybtegående session med Agentic Engineering:
Hvordan kan vi helt nøjagtigt arbejde med AI i den mere industrielle verden hvor systemerne historisk set har været mere lukkede og propreitære?
Det mener vi at vi netop nu har løst på B&R's platform.


Så har Mads en session om DevOps:
Han vil forklare om hvad der er muligt med B&R platformen.
Give nogle fede demoer af automatisk test og deployment.

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
<b>Jeg har selv været til mange AI-foredrag og konferencer.</b> 
Man kommer tit hjem med en følelse af at være totalt bagud og at alle andre har knækket koden til success med AI.<br><br> 
<b>Sådan skal det selvfølgeligt ikke være i dag!</b>

DET VIL VI IKKE:

<b>Vi har ingen standardløsning</b> AI og DevOps er komplekst og skal skrædersyes til enhver usecase! 

<b>Vi vil heller ikke sælge jer noget.</b> Alt hvad vi kommer til at vise jer i dag, kommer uden nogen regning. Det er en workshop, ikke nogen salgspitch!

<b>Vi vil ikke snakke om fremtiden og alt hvad man måske kan lige om lidt</b>  

DET VIL VI ISTEDET:

AI i automationsbranchen er <b>relativt nyt</b>, men allerede nu er der store fordele at hente! 

Vi vil gerne informere vores kunder og samarbejdspartnere omkring <b>vores strategi og retning.</b><br>

Hvis der ikke er en standardløsning hvad er der så af muligheder på B&R platformen og hvordan kommer vi igang.


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
<b>DevOps er en fremgangsmåde med forskellige stadier</b> ens software skal igennem. Hvert stadie sætter nogle krav der sikrer at næste stadie bliver en success. De skal enten <b> manuelt udføres eller manuelt bringes videre</b>. Hvis kravene ikke opfyldes grundigt nok, har workflowet ingen reel værdi. Derfor kan det for nogle godt virke rigidt og tungt - selvom det er en nødvendighed for at levere høj kvalitet.

<b>Ved at bringe AI-Agenter ind i din DevOps process er der en masse fordele. AgentOps</b>

0. DevOps bliver et framework til Agentic Engineering der sikrer kvalitet og forudsiglighed. (AI er ligesom mennesker ikke deterministiske)
1. Agenterne overholder ALTID deres instruktioner i modsætning til mennesker. 
2. Dele af DevOps kan automaticeres og spare tid.
3. Viden er gemt i workflows og ikke i individer
4. Vi har stadig fuld kontrol over processen ved at integrere quality gates, men også ved at justere og finetune sine guardrails og workflows

<b>DevOps bliver altså selve frameworket for AI <br> 
og AI gør frameworket super effektivt!</b>


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
Lad os prøve at kigge på hvordan investeringen af tid kunne se ud:

[CLICK]
<b>Øverst: Uden DevOps:</b> Man springer hurtigt over plan og design, bygger længe da specifikationerne ændrer sig konstant, og der er ingen test. Regningen kommer efter release som bugfix. Man ved aldrig hvornår man rammer et acceptabelt stadie og prisen er derfor uforudsiglig!

[CLICK]
<b>I midten: Med DevOps:</b> Det er udfra ovenstående at DevOps opstår. Ordentlig planlægning og design koster tid, men er hele fundamentet for udvikling og test af god kvalitet. Bugfix minimeres, og der er allerede vundet tid, samt den endelige kost er mere forudsigelig.

[CLICK]
<b>Nederst: AgentOps:</b> Investeringen af tid flytter frem i processen. Agenterne har ingen hukommelse eller indforstået viden om "best practise". Alt skal defineres meget eksplicit for at undgå misforståelser. Build bliver til en brøkdel. Måske endda 0 fordi processen ikke blokerer for at man kan lave noget andet imens. 
Review og release-beslutning ligger stadig hos os. De bliver faktisk vigtigere, fordi de nu er det, der bestemmer kvaliteten.

<b>Den frigjorte tid er ikke nødvendigvis en gratis gevinst</b> - den kan investeres i bedre kontekst, bedre tests og bedre beslutninger.
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

[CLICK]
Instructions: Agent.md. Hvad skal den kunne. Hvad skal den overholde?</b><br>
[CLICK]
Context: Hvad er det vi arbejder i?</b><br>
[CLICK]
Tools: Hvad skal agenten have adgang til i verden udenfor?</b><br>
[CLICK]
Memory: Da en LLM er fuldstændig stateless skal der være noget til at holde på historikken. Måske også dele det på tværs af sessioner.</b><br>
[CLICK]
Permissions: Hvad må agenten gøre på egen hånd?</b><br>
[CLICK]
Logs: Logger hvad agenten har gjort. Hvilke tools den har kaldt. Har den spawnet subagenter?</b><br>
[CLICK]
Feedback: Agenten skal spørge dig til råds. Hvad mener du? Skal jeg vælge X eller Y?</b><br>
[CLICK]
Approvals: Du skal give agenten tilladelser eller adgang.</b><br>

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
  <div><span>01</span><b>Agentic Engineering in IT is <strong>moving fast!</strong></b></div>
  <div><span>02</span><b>Competences are <strong>converging</strong> but solutions are <strong>diverging</strong></b></div>
  <div><span>03</span><b>Only an <strong>open Automation Platform</strong> supports a unified future</b></div>
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
I mange år har "nogen" snakket om at IT og OT ville flyde sammen. Det har også tildels været rigtigt. Mange af de værktøjer der bruges i IT er nu også tilgængelige for OT. 

<b>Men siden AI er begyndt at blive en del af stacken, er IT begyndt at "stikke af" igen.</b>

Det er ikke fordi vi ikke besider de samme kompetencer i OT, men fordi IT og hele <B>opensource</b> tankegangen bare går rigtig stærkt.
<b>LLM'erne er allerede trænet på uendeligt mange IT projekter</b>, mens OT næsten altid er closed source. Både hvad angåer selve automationsplatformen, men også det domæne I arbejder med.

IT har allerede værktøjer og kontekst som en naturlig del af udviklingsmiljøet: Versionsstyring, APIs, CLIs og diagnostics. Modeller og agenter kan derfor hurtigt kobles på et eksisterende feedback-loop.

<b>Selvom vi besider de samme kompetencer</b> kan vi ikke harmle op med de inovationer der sker i IT lige nu

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
Vi kan ikke konkure med IT. Vi må indordne os. Vi kan ikke træne vores egne modeller eller lave vores eget harness. 


[CLICK]1. <b>Den manglende domæne viden som LLM'erne ikke er trænet på. B&R + OEM</b> 

[CLICK]2. <b>Projekt context. Modellen skal kunne læse filerne i projektet og forstå deres sammenhænge. B&R</b>

[CLICK]3. <b>Sourcekode, HMI, configurationer, Safety osv. skal kunne versionstyres. B&R</b>

[CLICK]4. <b>Vi skal levere de værktøjer der er nødvendige for at kunne lukke feedback-loopet på research, debugging, test og deployment. B&R</b>

[CLICK]5. <b>Vi skal definere nogle regler (guardrails). F.eks: altid opdater pkg-filen, Unused vars etc. B&R + OEM   </b>




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
    <div class="strategy-shift-label"><span>NOW</span><strong>INTEGRATION OF YOUR CHOICE</strong></div>
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
<b>Vores strategi har ændret sig</b> og det har måske ikke været så tydeligt hvor vi egentligt er på vej hen nu. Vi vil ikke længere pretraine eller fine-tune vores egen model som et lukket AS-Copilot-økosystem. <b>Det var det rigtige valg engang</b>, fordi modellerne ikke var istand til at kode PLC. Det har ændret sig!

[CLICK]
Heldigvis:
<b>For det er dyrt og langsomt at bygge </b>

<b>Modellen risikerer at være forældet før release, </b>

og et <b>overcomplete træningssæt</b> kan give modellen mere viden end den enkelte kunde har brug for og ende med hallucinationer. 

Oven i det kommer <b>løbende fine-tuning, evaluering og vedligeholdelse.</b> 

<b>Vi låser os til én model,</b> selv om forskellige opgaver kræver forskellige modeller, og en 

<b>B&R-hostet model</b> begrænser kundens valg af AI-leverendør og måske enda konflikter med kundens IP retningslinjer.

[CLICK]
Hvad gør vi så?

[CLICK]
Vores platform er allerede åben og tekstbaseret. <b>Derfor kan vi skabe mere varig værdi med context engineering og harness engineering med de modeller og harnesses der allerede findes og kommer i fremtiden:</b> 

B&R skal eje broen / integrationen og domænegrænsen, ikke alle lag i AI-stacken. Så kan vi tage den bedste nye teknologi i brug, uden at kunden skal købe ind i et lukket og forældet B&R-økosystem.

Transition: Det er den retning, vi nu bygger videre på, og som har åbnet muligheden for, at vi her i danmark f.eks kan bidrage med de integrationer der skal til.
-->

---
layout: default
class: takeaway-slide
---

<div class="kicker">WHY IT MATTERS · 02 MIN</div>

# Why care about<br><span class="accent">Agentic Engineering?</span>

<div class="why-care-layout">
  <section class="abstraction-panel" aria-label="Agentic Engineering as a new software abstraction layer">
    <div class="why-care-label"><span>THE SHIFT</span><strong>ANOTHER ABSTRACTION LAYER</strong></div>
    <div class="abstraction-ladder">
      <div class="abstraction-step"><span>01</span><div><b>Machine code</b><small>hardware instructions</small></div></div>
      <div class="abstraction-step"><span>02</span><div><b>Compiler</b><small>translate intent into code</small></div></div>
      <div class="abstraction-step"><span>03</span><div><b>Frameworks</b><small>compose reusable systems</small></div></div>
      <div class="abstraction-step is-current"><span>04</span><div><b>Agentic workflow</b><small>intent + context + tools + feedback</small></div></div>
    </div>
    <div class="abstraction-caption"><span>THE COMPETITIVE EDGE</span><strong>Master it early.<br>Or be outpaced.</strong></div>
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

<div class="slide-id">10</div>

<!--
Lad os slutte introen af med at opsummere:
Hvorfor er det interressant? Hvorfor skal I investere jeres tid i AE?

[CLICK]
1. Man skal forstå at AI er det næste naturlige abstraktionslag. Dem der formår at bruge AI effektivt vil til enhver tid udkonkurerer dem der ikke gør! Vi bliver ikke arbejdsløse, vi flytter bare fokus op ad abstraktionsstigen. Ikke for at blive dovne, men for at kunne nå mere i en verden der forventer mere.

[CLICK]
2. Uanset om man elsker AI eller er fuld af skepsis, så må man indse at det er blevet en del af stacken og det er kommet for at blive. Jeg synes personligt at det er blevet 100 gange sjovere at være ingeniør. Vi kan lave de vildeste ting og vi bliver forundrede hver dag. 

[CLICK]
3. Viden bliver gemt i systemet i stedet for i individer. Systemet skal ikke på ferie, på barsel, er syg eller (gud forbyde det) siger op.

[CLICK]
4. Vi får muligheden for at geninvestere vores tid til at opnå bedre kvalitet, og ved kontinuerlig optimering der leder til mere autonomi og mere troværdighed.

[CLICK]
5. Vores afdeling bliver langt mere agil og robust. Det skallerer efter behov. Ikke kun efter mennesker.

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

<p class="devops-cover-copy">The model proposes. The harness provides context and feedback. The workflow governs.</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>PLAN</b><small>What and how</small></div>
  <i></i>
  <div><span>02</span><b>IMPLEMENT</b><small>According to guardrails</small></div>
  <i></i>
  <div><span>03</span><b>TEST</b><small>Validate the result</small></div>
  <i></i>
  <div><span>04</span><b>APPROVE</b><small>What is being deployed</small></div>
</div>


<div class="slide-id">11</div>

<!--
Inden vi springer til næste punkt på dagsordenen:

- Spørgsmål til mig?

1. Hvor mange af jer bruger AI-Agenter som et dagligt og uundværligt værktøj til sw-udvikling?
2. Hvor mange af jer bruger DevOps principper i jeres sw-udvikling?
 

Det vigtigste er ikke AI-modellen eller agenten. Det er workflowet.

Modellen kan udskiftes. Harnesset kan ændres. Men workflowet definerer, hvordan ide bliver til tickets, hvordan løsningerne bliver implementeret, reviewed og testet og hvem der i sidste ende må godkende resultatet.

Det er et levende engineering-system. Det skal versionsstyres, måles, vedligeholdes og forbedres, præcis som andre dele af jeres platform.
-->

---
layout: default
class: maturity-compare-slide dark-slide
---

<figure class="vibe-coder-visual">
  <img src="/vibe-coder.png" alt="Vibe coder working at an unpredictable bottle line">
</figure>

<!--
Hvor gammelt er Vibe-coding begrebet? (februar 25)

Et fenomen der opstod for ca. 1,5 år siden. Beskriv hvad du vil have og itterer indtil du er tilfreds.

Vibe coding kan være effektivt til læring og prototyper. Vi har selv vibecoded en hel del. Ikke på jeres maskiner selvfølgelig ;) Men til hurtige interne værktøjer, til POCs og til fejlfinding er der intet i vejen med bare at give den gas uden en plan.

Men til rigtige maskiner der skal leve op til en masse krav, er det sjældent en god process.

Når vi sætter det op imod "Agentic Engineering", så er det for at synliggøre, at AI er ikke magi. Vi bliver nødt til at holde det i hånden hele tiden og eje processen. AI Agenter er ikke deterministiske (ligesom mennesker heller ikke er). De har brug for vejledning (i form af guardrailes)  og quality gates der tillader at processen må fortsætte.  

Hvis man ikke styrer processen så mister man overblikket.

På en maskine er "det ser rigtigt ud" ikke et successkriterie.
I IT gør det måske ikke så meget om en hjemmeside er nede i 5 min., men i OT er det ikke ligemeget om der kommer metalspåner i appelsinjuicen.

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
  <div><span>THE WORKSHOP QUESTION</span><b>How can an agent implement this without becoming the spec, tester, and approver?</b></div>
  <mdi-arrow-right />
  <strong>Build the workflow</strong>
</div>

<div class="slide-id">12</div>

<!--
Lad os prøve at kigge på et konkret eksempel, som resten af workshoppen skal besvare.

Feature request: Når conveyor-aksen fejler, skal maskinen stoppe kontrolleret. Clear skal rydde alle flasker, der endnu ikke er cappet - uanset om de er tomme eller fyldte - og de tæller som reject. Counteren beholder sin værdi, og batchen fortsætter fra samme tal ved start, indtil de 100 flasker er færdige.

Vis fejlen og det ønskede resultat, men forklar ikke løsningen endnu. Stil i stedet workshop-spørgsmålet: Hvordan kan vi delegere implementeringen til en agent, uden at agenten samtidig bliver specifikation, tester og godkender?

Resten af workshoppen bygger svaret: MCP leverer viden, AS CLI udfører og observerer, skills og guardrails styrer arbejdet, tests leverer evidens, og mennesker samt gates afgør, om ændringen må fortsætte.

Transition: For at det skal kunne lade sig gøre, skal agenten have en forbindelse til Automation Studio, Automation runtime, og domæneviden, der kan lukke feedback-loopet.
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
Så hvad kan vi tilbyde for at løse det problem?

Hvis man går ind på linkedin eller åbner vores hjemmeside, så vil man se denne marketingskampagne for: Automation Studio Agentic Bridge. Der er flere der har kontaktet mig og spurgt ind til hvad det er. Det har i forhåbentlig en ide om nu, men selvom det ikke er helt endeligt defineret eller released (AS6.9), så lad os lige gennemgå det.

[CLICK]
Agentic Bridge er integrationen af domæneviden og tools fra enhver Agent (altså et hvilket som helst harness med en hvilken som helst model)

[CLICK]
<b>Den består af</b> nogle instruktioner, skills og hooks for at guide agenten med at arbejde i et AS-Projekt


<b>Den består af</b> en MCP server der kan levere domæneviden til agenten omkring: B&R produkter, Automation Studio, Structured Text, AS-Help, Anonymiserede support tickets, Sales notices, manualer, Release notes osv. Denne MCP server er tilgængelig allerede nu og er den officielle B&R MCP server. 

<b>Den består af et Command Line Interface til Automation Studio</b>: CLI'et har vi bygget her I DK. Først som et uofficielt produkt, men nu som en integreret del af Automation Studio. CLI'et stiller en række funktionaliteter til rådighed for agenten, så den kan bygge projektet, simulerer, læse/skrive variabler, læse logbogen osv. 

[CLICK]
Man er selvfølgelig ikke begrænset til de skills, MCPs og tools der er en del af Agentic Bridge. Man kan selvfølgelig stadig bruge de 1000 vis af skills, MCP-servere og CLI'er der findes, og selvfølgelig lave sine egne, der interfacer den domæneviden, eller de systemer man vil tilgå.

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

<div class="slide-id">14</div>

<!--
MCP står for Model Context Protocol. Tænk på det som et semantisk tool-API: en server beskriver sine tools og resources, så en model kan opdage dem og bruge på en standardiseret måde.

[CLICK]
<b>Et eksempel kunne være den officielle GitHub MCP server.</b>
Den har omkring 47 tools til alt lige fra at oprette issues og PR, læse repositories, merge branches osv. 


<b>Som andet eksempel har vi vores egen AS-Help MCP</b>. Det er en lokal server, der via stdio, stiller funktioner til rådighed for at søge i B&R Automation Studio help: search_help, get_categories, browse_section og get_page_by_id. 

[CLICK]
Manifestet er ikke selve dataene eller udførelsen. Det giver modellen et katalog over tilgængelige MCP-servere, deres tools med beskrivelser og input-formater i den kontekst, den arbejder med. På baggrund af opgaven kan modellen vælge at kalde search_help for at slå ACOPOS error 7070 op i AS-dokumentationen, create_issue for at rapportere en fejl, eller svare uden et tool.

[CLICK]
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
    <div class="as-help-query-flow">
      <div class="as-help-query-heading"><span>AGENT QUERY</span><strong>FTS · KEYWORD RANKING</strong></div>
      <div class="as-help-query-line"><code>search_help</code><span>query: "MC_BR_MoveAbsolute"</span></div>
      <div class="as-help-top-result"><b>#1</b><span>highest-ranked match</span><strong>page_id + breadcrumb + preview</strong></div>
      <div class="as-help-retrieve"><code>get_page_by_id</code><span>page_id</span><b>-&gt; full text + metadata + online URL</b></div>
    </div>
  </section>
</div>

<div class="as-help-boot-takeaway" v-click><span>THE PRO AND THE CON</span><strong>Only reflect what you have installed locally</strong> </div>

<div class="slide-id">15</div>

<!--
Vi vil gerne reklamere lidt for vores egen AS-Help MCP der ligger tilgængelig på GitHub. Vi synes selv den er MEGA god!
Første gang AS-Help MCP starter, læser den den lokale Automation Studio help folder og bygger et søgeindeks. Den gemmer ikke kun søgetekst, men også page_id, titel, filsti og breadcrumb, så et hit kan følges tilbage til den rigtige side.

[CLICK]
[CLICK]
[CLICK]
[CLICK]
[CLICK]

FTS, full-text search, er klar. <b>Semantisk søgning kan være et senere, valgfrit lag.</b> 

Vi synes at FTS virker så godt, at vi ikke rigtigt har brugt embedding modeller og vector-databasen, men man kan nemt smide sin egen embedding model på, og så få semantisk søgning sammen med FTS. Det kan spare på tokens og give mere akkurate søgninger, da hele konteksten indgår i søgningen, og ikke kun keywords.

Det vigtige i agent-flowet er, at search_help ikke foregiver at være hele svaret: den returnerer et rangeret hit med page_id, breadcrumb og en kort preview.

[CLICK]


Agenten bruger derefter page_id i get_page_by_id for at hente den fulde tekst, metadata og eventuelt online-help URL. Det er en enkel, sporbar to-trins kontrakt: find den bedste adresse, hent derefter evidensen.

[CLICK]

Da <b>projektet er opensource</b>, kan det nemt kopieres til andre hjælpesystemer fra f.eks en tredjepart. Det skal i være velkomne til!

Til mange ting synes vi at det er en fordel, at MCP-serveren KUN har adgang til din lokale hjælp, og derfor ikke til teknologier du ikke har installeret eller nyere versioner du ikke bruger. Den kan selvfølgelig ikke bruge hele B&Rs katalog som data, men hvis den kun skal forholde sig til din maskine, så er det jo også tit det bedste. 

transition: Hvis man har brug for overkomplete viden kan man bruge den officielle B&R MCP-server
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

2. Den er hosted på en B&R cloud service. Dine prompts bliver sendt ud af din computer, men bliver ikke logget eller analyseret.

3. Den giver ikke refferencer på alle svar, da nogle data ikke er tilgængelige som pdf'er eller hjælp URL'er. 

4. Den er i Beta. Vi anbefaler AS-Help, BR-Community MCP indtil den bliver bedre.


transition: Hvad er der ellers af brugbare MCP-Servere?
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

transition: Alle de her MCP servere kan man selvfølgelig bruge i sine Agentic Engineering workflows, men man kan også bruge dem til andre formål!
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
<b>Et eksempel på en application som vi har lavet - B&R Support Agent</b>

Her kan man forbinde et workspace så agenten kan kigge i et project.

Man kan uploade filer. Det kunne f.eks være en system dump eller en wireshark trace.

<b>Man kan give den instruktioner:</b> F.eks Ved spørgsmål der indeholder kundenavn, tjek altid for tidligere sager på Jira, eller kig altid på denne sharepoint side når det handler om Codian robotter.

Den kan nu bruge dens forbundne MCP servere til at søge den fornødne domæneviden.

- AS4 / AS6 help
- Atlassian (Jira tickets og confluence dokumentation)
- br-community mcp
- workIQ (sharepoint, teams kanaler, support mail box)
- Revision history (released firmware med release notes)

[CLICK]

Vi kan stille den et spørgsmål og se hvordan den bruger sine tools.

Og hvordan den i det her tilfælde giver link direkte til online-hjælpen.

[CLICK]

<b>USECASES:</b>

Der er mange usecases hvor vi har sparet enormt meget tid med sådan et værktøj.

1. Gennerel søgning i vores interne systemer
2. Validere at et problem ikke tidligere har været løst inden det sendes videre til HQ.
3. Finde komplekse sammenhænge mellem logs, kode og tidligere historik.
<b>Vi har fundet bugs vi ALDRIG havde fundet uden!</b>

<b>Det er ikke længere nødvendigt at det er firmaets bedste mand der hjælper til med support!</b>


transition: Det er hvad man kan med den rette domæneviden. Men hvad hvis vi rent faktisk skal løse noget på en maskine?


-->

---
layout: default
class: demo-slide dark-slide as-cli-slide
---

<div class="status-badge demonstrator">DEMONSTRATOR</div>
<div class="kicker">EXECUTION · 04 MIN</div>

# as cli:<br><span class="accent">action + observation</span>

<div class="demo-steps">
  <div v-click><span>01</span><b>BROWSE</b><small>as --help → command surface</small></div>
  <div v-click><span>02</span><b>PROJECT STATUS</b><small>name · config · cpu</small></div>
  <div v-click><span>03</span><b>SIM ENABLE</b><small>simulation on CPU</small></div>
  <div v-click><span>04</span><b>BUILD SIM</b><small>build + install to ARsim</small></div>
  <div v-click><span>05</span><b>PLC CONNECT</b><small>--ip 127.0.0.1</small></div>
  <div v-click><span>06</span><b>VAR READ</b><small>gProductionCount → value + type</small></div>
  <div v-click><span>07</span><b>VAR WRITE</b><small>gCmdClear → written</small></div>
  <div v-click><span>08</span><b>LOGBOOK READ</b><small>$arlogsys → error entries</small></div>
  <div v-click><span>09</span><b>BUILD PIP</b><small>offline install package</small></div>
</div>

<TerminalCli />


<div class="slide-id">16</div>

<!--
<b>Hvis pause så NU!</b>

`AS CLI` er et command-line interface der kan bruges af et menneske, et script, en automatisk test, en CI-pipeline og en agent.

AS CLI er selve rygraden i Agentic Bridge og er noget <b>vi har udviklet her i DK</b>. Det er et mere eller mindre komplet interface til Automation Studio 6 og kan mange af de samme ting som man ellers manuelt skal udføre i automation studio. <b>Ud over selve runtime funktionerne som vi kigger på om lidt, så kan det også tilføje libraries, hardware, tasks, hmi, konfigurationer osv.</b> Selvom det selvfølgelig bare er text, så er det mere pålideligt at bruge den existerende scripting engine bag AS, så alt bliver indsat rigtigt og konfigureret med valide parametre.

Det åbner Automation Studio i headless mode (uden GUI) og forbinder direkte til backenden i AS. Alle functioner og status bliver tilgængeligt via et json-rpc interface, der gør det nemt at bygge andre systemer ovenpå. Det bliver formentlig også det som vores officielle VS-Code extension kommer til at bruge.

[CLICK]

Da vi designede CLI'et var det vigtigt for os, at AI blev tænkt ind i designet. Dvs. at en Agent skal selv kunne finde ud af at bruge det, uden at man skal instruere den i hvordan.

Agenten kan lave --help overalt for at søge information om hvilke kommandoer og hvilke parametre den kan bruge og hvad de vil returnere.
[CLICK]

Den kan give status på det projekt den er forbundet til

[CLICK]

Det kan simulere, men også betjene simulatoren. Den kan f.eks skrue op eller ned for tiden. På den måde kan den prøve ting af i slowmotion eller speede tiden op hvis den skal køre en test på et stort batch.

[CLICK]

Det kan builde projektet til enten fysisk hardware eller en simulator  

[CLICK]

Forbinde til PLC'en eller simulatoren

[CLICK]

Læse variable

[CLICK]

Skrive variable

[CLICK]

Læse logbøger 

[CLICK]

Lave en PIP pakke. ProjectInstallationPackage PIP (Deployment artifact)

transsition: Nu har vi alt toolingen på plads, så mangler vi bare instruktioner og skills
-->

---
layout: default
class: skills-slide dark-slide
---

<div class="status-badge general">OPEN ECOSYSTEM</div>
<div class="kicker">AGENT WORKFLOWS · 02 MIN</div>

# <span class="accent">Skills</span>.sh

<SkillsEmbed />

<div class="slide-id">17</div>

<!--
Hvis man kender skills.sh lavet af vercel, så ved man at der findes rigtig mange skills og at de er tilgængelige for langt de fleste agenter. 

Mange af dem er <b>ligeså relevante</b> for et automationsprojekt som for altmuligt andet. Og bruger man <b>DevOps principper</b>, så behøver man ikke at opfinde den dybe tallerken igen. Der er rigtig gode skills til alle de forskellige faser.

Det er supernemt at installere med npx kommandoen direkte fra dit harness.

De mest populære skils er:
vis <b>grill-with-docs</b>

transition: Men man slipper ikke for at lave sine egne skills. Man har sine egne krav, sine egne principper og sine egne standarder.
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

<div class="slide-id">18</div>

<!--
Skills falder i to uafhængige dimensioner.

<b>Første dimension</b> er, hvordan de aktiveres. 

<b>Et model-invoked skill</b> ligger fremme og bliver loadet af agenten selv, når agenten mener at indholdet er relevant for den arbejde. 

<b>Et user-invoked skill</b> kalder du bevidst, som en gemt prompt for at udføre en bestemt handling eller rutine.


<b>Anden dimension</b> er, om de husker noget fra gang til gang. Et stateless skill kører én gang og glemmer. Et stateful skill bygger op og genbruger tidligere outputs i fremtidige sessioner.


De to dimensioner kombineres frit, så du får fire typer af skills. Vælg bevidst, når du designer et nyt skill. Her er et par eksempler:

[CLICK]
Event script skill til MappView. Det er <b>model-invoked</b>, fordi agenten selv skal kunne fremkalde information om eventscripts hvis den skal rette eller lave nye scripts. Det er <b>stateless</b> fordi det ikke producerer noget information til fremtidige kald.

[CLICK]
Domain-modelling skillet er også <b>model-invoked</b>. Agenten kalder det når der diskuteres domæne-specifikke termer. Agenten skal forstå jargonen og dokumentere den <b>(statefull)</b>, så den i fremtiden ikke bliver forviret. Hvis et issue f.eks indeholder ordet "filler" fra eksemplet, så vil skillet undersøge om det er en del af context.md filen og hvad det i så fald er. Hvis det ikke er det, så vil den undersøge / spørge for derefter at putte det i ccontext.md filen. 

[CLICK]
Triage skill. Dette er <b>user-invoked</b> fordi det udelukkende er os der bestemmer om et GitHub issue skal igennem en omskrivning. Det kan være at vi har fået indrapporteret en bug. Brugeren har oprettet et GH-issue, men han har glemt vigtige detaljer som en agent skal bruge, for at kunne arbejde videre med det. Det kunne være at brugeren havde skrevet, "Jeg får ingen alarmer når servoaksen fejler". Men hvad for en alarm vil vi gerne have? hvad skal den sige?. Vi laver derfor triage på den for at få den op på et niveau hvor vi kan uddellegere den til en agent.

[CLICK]
grill-with-docs. Et af de mest populære skills. Bliver ved med at diskutere med brugeren indtil der er en fælles forståelse. Indeholder det termonologi eller særlige designkrav bliver det noteret ned for fremtidige sessioner.

[CLICK]
Hvordan bliver skillet loaded ind og gemmer det information til sig selv i fremtiden.

[CLICK]

transition: Hvorfor skal vi selv lave skills?
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
    <p>How to name: vars, globals, types, io, safety, alarms, recipe</p>
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

<div class="slide-id">19</div>

<!--
Når man er blevet dygtig til at skrive skills og instruktioner (Der findes selvfølgelig skills der er gode til at skrive skills eller agent.md filer) så kan man begynde at designe sine guardrails.

Guardrails er de beslutninger, vi vil kunne se igen i kode, tests og review.

[CLICK]
Det kan være krav til arkitektur 

[CLICK]
Naming konventions

[CLICK]
Testing strategi

[CLICK]
HMI og GUI design

[CLICK]
Safety principper

[CLICK]
transition: Guradrailes er med til at guide agenten når den specificerer, implementere og reviewer. Men hvad med tests?
-->

---
layout: default
class: testing-slide dark-slide
---

<div class="kicker">TDD + EVALUATION · 03 MIN</div>

# Tests are the<br><span class="accent">sensor system</span>

<div class="baseline-banner" >
  <mdi-radar /> <span>TEST-DRIVEN RULE</span>
  <b>Clear acceptance criteria give agents a fast signal. Establish the regression baseline <strong>before</strong> delegating feature work.</b>
</div>

<div class="test-pyramid">
  <div class="test-level hil" ><span>04</span><b>HIL / PHYSICAL</b><small>where risk + fidelity require it</small></div>
  <div class="test-level arsim" ><span>03</span><b>ARSIM / SMOKE</b><small>controlled application behavior</small></div>
  <div class="test-level integration" ><span>02</span><b>INTEGRATION</b><small>interfaces + module behavior</small></div>
  <div class="test-level unit" ><span>01</span><b>UNIT</b><small>local logic</small></div>
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



<div class="slide-id">20</div>

<!--
Jeg vil ikke sige så meget om tests. Det kommer Mads meget mere ind på om lidt. 

Det er dog vigtigt at sige, at test er uundværlige når man koder med Agenter. AI er ikke deterministikse, så vi har brug for pålidelige gates der kan validere vores software. Tests virker både som feedback til agenten, men ligeså meget som dokumentation til os der skal godkende en ændring.

Det er blevet uendeligt meget nemmere at skrive test i dag, end det var før AI. Men AI agenten kan ikke bare teste sig selv.

[CLICK]

Product tests:
En test af softwaren / maskinen:
Virker tingene rent faktisk som vi gerne vil have det? 

[CLICK]

Agent Evaluering: 
En test af workflowet / systemet:
Gjorde agenten som aftalt?

Vi har brug for begge dele. En agent kan følge processen korrekt, men stadig lave fejl. Omvendt kan ændringerne tilfældigvis virke, selvom agenten brød reglerne undervejs.

transition:

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

<div class="slide-id">21</div>

<!--
Jeg tror alle har forstået at guardrails styrer og guider workflowet, mens tests er deterministiske fixpunkter (gates) der holder agenten igang indtil de er opfyldt.

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

<div class="slide-id">22</div>

<!--
Et agentforslag er først værdifuldt, når vi kan lukke loopet helt. Før loopet kan handle, skal det have domænekontekst: projektstruktur, produkt- og versionsviden, regler og intent. Projektet skal derefter kunne bygges reproducerbart. Vi skal kunne starte en kontrolleret simulation, stimulere en tilstand, observere variable og logbook og sammenligne resultatet med et krav.

På sliden ses guardrails via instructions og skills, derefter research via AS-HELP, BR-COMMUNITY, GitHub og den cloud-baserede AS-COPILOT MCP. Automation Studio læser og skriver kode gennem Main.st-editoren, mens as bygger, simulerer, læser variable og læser logbook.

DevOps udfører en kendt sekvens deterministisk. Agenten vælger næste afgrænsede handling ud fra feedback. Det er derfor vigtigt, at det samme command contract kan anvendes af en engineer, en test, en pipeline og en agent.

Transition: Det er præcis den rejse, B&R selv har været igennem.
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
[CLICK]
Mennesker organiserer sig ofte i kanban-swimlanes efter fagdisciplin: HMI, safety, control og hardware. <b>horizontal slices</b> Det er en rationel arbejdsform, når fokus er begrænset, og når forskellige personer ejer forskellige fagligheder. Det er en begrænsning vi har som mennesker. En lille kortidshukommelse og vi er dårlige til at multitaske / context switche.
Som mennesker laver vi derfor typisk en disciplin ad gangen. Det er der vi er mest produktive, men det skaber udfordringer ved test. Hvordan tester man HMI uden logik? Der er ingen feedback!

[CLICK]


[CLICK]
En agent har ikke de begrænsninger og den kan bare starte subagenter op til at tage sig af andre ekspertiser, eller for at isolerer og delegerer konteksten fra. Derfor kan den arbejde vertikalt (<b>vertical slices</b>): feature-swimlanes med HMI-state, safety contract, control logic, I/O eller simulation og acceptance test i samme korte loop. Det er en kæmpe fordel ift. test. Hver feature kan testes uafhængigt fordi de indeholder alle ellementerne.

[CLICK]
Matt Pococks TDD-skill beskriver horizontal slicing som anti-patternet: skriv ikke alle tests først og al implementation bagefter. Arbejd i vertical slices: én test, én minimal implementation, gentag. Hver test er en tracer bullet, der bruger feedback fra den forrige cyklus. Red før green; refactor hører til reviewfasen.

Kilde: https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/SKILL.md
-->

---
layout: default
class: feature-recap-slide dark-slide
---

<div class="kicker">BACK TO THE MACHINE · 01 MIN</div>

# One feature to build.<br><span class="accent">Now we have all the pieces.</span>

<div class="feature-recap-layout">
  <div class="feature-recap-machine">
    <BottleConveyor state="fault" :count="42" compact />
  </div>

  <div class="feature-recap-story">
    <div class="feature-recap-sequence" aria-label="Feature outcome sequence">
      <div><span>01</span><b>FAULT</b></div><i></i>
      <div><span>02</span><b>STOP</b></div><i></i>
      <div><span>03</span><b>REJECT</b></div><i></i>
      <div><span>04</span><b>RETAIN</b></div><i></i>
      <div><span>05</span><b>RESUME</b></div><i></i>
      <div><span>06</span><b>PROVE</b></div>
    </div>
    <div class="feature-recap-capabilities" v-click>
      <span>KNOWLEDGE</span><i>+</i><span>TOOLS</span><i>+</i><span>GUARDRAILS</span><i>+</i><span>TESTS</span><i>+</i><span>GATES</span>
    </div>
    <div class="feature-recap-question" v-click>
      <span>NOW ASSEMBLE THE SYSTEM</span>
      <strong>Which workflows turn these pieces into an accountable engineering change?</strong>
    </div>
  </div>
</div>

<!--
Det er den samme maskinopgave, vi startede workshoppen med: fejl, kontrolleret stop, reject af ikke-cappede flasker, fastholdt tæller, genstart af batchen og evidens for det færdige resultat.

Nu har vi byggestenene: domæneviden, tools til at handle og observere, guardrails, tests og deterministiske gates.


Transition: Lad os samle byggestenene i de tre workflows, der gør ændringen afgrænset og verificerbar.
-->

---
layout: default
class: planning-slide dark-slide
---

<div class="kicker">WORKFLOWS · 04 MIN</div>

# Three workflows<br><span class="accent">everyone needs</span>

<AgentWorkflow />

<div class="slide-id">24</div>

<!--
"Recover efter en aksefejl" lyder som en opgave, men det er ikke en specifikation. Agenten kan researche eksisterende kode og søge viden. Men intention og trade-offs skal tilbage til os så vi kan tage stilling.

Her er et eksempel på hvordan et fuldt workflow kunne se ud der leder direkte til det Mads vil fortælle om efter pausen:

Den første workflow handler om at få den rigtige opgave beskrevet. 

Den anden kan være fuldt ud aftomatisk, når den er afgrænset, isoleret og har vundet vores tillid. 

Den sidste handler om validering og optimering af systemet.

transition: SPØRGSMÅL
-->

---
layout: default
class: devops-cover ai-workshop-cover dark-slide
---

<div class="devops-chapter">02</div>

<div class="kicker">WORKSHOP 02</div>
<div class="part-label">MADS ANDERSEN · AUTOMATION ENGINEER</div>

# DevOps in<br><span class="accent">industry</span>

<p class="devops-cover-copy">Building confidence in a world of AI-generated change</p>

<div class="devops-spine" v-motion :initial="{ opacity: 0, y: 18 }" :enter="{ opacity: 1, y: 0, transition: { delay: 300 } }">
  <div><span>01</span><b>VERSION</b><small>known inputs</small></div>
  <i></i>
  <div><span>02</span><b>BUILD</b><small>repeatable output</small></div>
  <i></i>
  <div><span>03</span><b>TEST</b><small>behavioral evidence</small></div>
  <i></i>
  <div><span>04</span><b>RELEASE</b><small>reviewable change</small></div>
</div>

<div class="slide-id">25</div>

<!--
"Jeg hedder Mads Andersen og har arbejdet næsten 8 år hos B&R.

Jeg har primært arbejdet i OT-verdenen, men har altid haft en stor interesse for software engineering og de værktøjer og workflows man bruger i IT.

Igennem mange år har vi talt om at OT og IT langsomt bevæger sig tættere på hinanden.

Men de sidste par år er det accelereret voldsomt.

Vi har lige hørt om Agentic Engineering og hvordan AI kan hjælpe os med at skabe software hurtigere end tidligere.

Men det rejser et nyt spørgsmål:

Hvordan sikrer vi kvaliteten når mængden af software og ændringer stiger?

Det er i virkeligheden det DevOps handler om.

Hvordan vi kan bygge, teste og levere software på en reproducerbar måde.

Og det er det vi skal kigge nærmere på nu."

-->

---
layout: default
class: agenda-slide dark-slide devops-agenda-slide
---

<div class="kicker">WORKSHOP 02 · AGENDA</div>

<div class="agenda-layout">
  <div class="agenda-intro" v-motion :initial="{ opacity: 0, x: -24 }" :enter="{ opacity: 1, x: 0 }">
    <h1>DevOps in<br><span class="accent">industry.</span></h1>
    <p class="agenda-lead">The engineering path from a project in Git to a tested, reviewable release.</p>
    <div class="agenda-event-mark">
      <span>02</span>
      <div><b>DEVOPS IN INDUSTRY</b><small>VERSION · BUILD · TEST · RELEASE</small></div>
    </div>
  </div>

  <div class="agenda-timeline" v-motion :initial="{ opacity: 0, x: 28 }" :enter="{ opacity: 1, x: 0, transition: { delay: 220 } }" aria-label="DevOps in industry agenda shown as a Git commit history">
    <div class="agenda-row is-session">
      <time datetime="commit-01">01</time><i aria-hidden="true"></i><div><b>What is DevOps?</b><small>Development · operations · feedback</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="commit-02">02</time><i aria-hidden="true"></i><div><b>Why DevOps?</b><small>Make change visible and repeatable</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="commit-03">03</time><i aria-hidden="true"></i><div><b>CI / CD</b><small>Build, test, verify, deploy</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="commit-04">04</time><i aria-hidden="true"></i><div><b>Tooling + as CLI</b><small>Make engineering actions programmable</small></div>
    </div>
    <div class="agenda-row is-session">
      <time datetime="commit-05">05</time><i aria-hidden="true"></i><div><b>Demos: as cli, Orange Juice Machine and HMI testing</b><small>Prove expected machine behavior</small></div>
    </div>
    <div class="agenda-row">
      <time datetime="commit-06">06</time><i aria-hidden="true"></i><div><b>Start Monday</b><small>One bounded, repeatable workflow</small></div>
    </div>
  </div>
</div>

<div class="slide-id">26</div>

<!--
Lad os lige hurtigt kigge på dagens rejse.

Først skal vi blive enige om hvad vi egentlig mener med DevOps.

Derefter skal vi snakke om hvorfor det bliver mere relevant end nogensinde i en verden med AI og Agentic Engineering.

Så kigger vi på CI/CD og de grundlæggende principper bag automatiseret levering af software.

Derefter skal vi se hvorfor tooling er så vigtigt, og hvordan as-cli passer ind i det billede.

Men størstedelen af tiden kommer faktisk til at være demoer, hvor vi ser det hele i praksis.

Til sidst samler vi det hele i spørgsmålet:

Hvad kan man realistisk begynde på allerede på mandag?
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
  <div class="devops-beyond-label"><span>ALSO DEVOPS</span><b>NOT COVERED TODAY</b></div>
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

<div class="slide-id">27</div>
<!--
Title: What is DevOps
Før vi går videre, lad os lige blive enige om hvad vi mener med DevOps i dag.

Development handler om at planlægge, implementere og verificere ændringer i software.

Operations handler om at få den software sikkert ud på den rigtige maskine, overvåge hvordan den opfører sig i drift, og samle feedback til næste ændring.

Det er også derfor man ofte illustrerer DevOps med uendelighedstegnet. Når software kommer ud i drift får vi ny viden. Måske finder vi fejl. Måske opdager vi noget der kan forbedres. Og så starter næste ændring.

Men det er en meget simplificeret definition. DevOps er i virkeligheden et kæmpe område.

Der er mange andre discipliner som ofte hører under DevOps. Infrastruktur, sikkerhed, samarbejde, dokumentation og så videre.

De er alle sammen vigtige.

Men hvis vi prøver at dække dem alle sammen i dag, så er vi her stadig i morgen.

Så når jeg siger DevOps i resten af præsentationen, så mener jeg primært denne del af DevOps:

Hvordan vi går fra kode til en verificeret release gennem Build, Test og Deploy.

Og det er især interessant i en verden hvor AI hjælper os med at skabe flere ændringer end nogensinde før.

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

<div class="slide-id">28</div>

<!--
Lars har været inde på dette i starten, men for at gentage kort:

Agentic Engineering gør at vi kan generere kode hurtigt, skrive automatiske tests hurtigt, lave en idé til en prototype på rekordtid.
... Men agenten har brug for "Guardrails" og det er her DevOps kommre ind i billedet med build,test, kontroleret deployment, kvalitetstjek.

AI hjælper os med at lave software hurtigere. DevOps hjælper os med at levere det sikkert.


Lars har allerede været inde på Agentic Engineering, men lad os lige koble det til DevOps.

Agentic Engineering hjælper os med at skabe software hurtigere.

Men hurtigere udvikling er ikke det samme som pålidelig levering.

Derfor har vi brug for build, test, kvalitetstjek og kontrolleret deployment omkring ændringerne.

AI hjælper os med at skabe software hurtigere.

DevOps hjælper os med at levere det på en kontrolleret måde.
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
  <div class="old-way-pain-label"><span>PAIN POINTS</span><b>COMMON CHALLENGES</b></div>
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
<br />

<div class="why-devops-matters-takeaway" v-click>
  <blockquote><strong>If AI helps us create 10&times; more changes, we need a way to verify 10&times; more changes.</strong></blockquote>
</div>

<div class="slide-id">29</div>

<!--
Lad os prøve at kigge på hvordan softwarelevering ofte har fungeret historisk.

En ingeniør laver en ændring.
Projektet bygges lokalt.
Der kopieres måske nogle filer rundt.
Der køres måske nogle tests - måske ikke.
Og til sidst deployeres ændringen manualt.

Der er ikke nødvendigvis noget forkert i den proces.
Sådan er mange projekter blevet udviklet i årevis.
Men den giver nogle udfordringer:

Hvilken PC blev projektet bygget på?
Hvilke indstillinger havde den?
Hvilke tests blev kørt?
Kan vi genskabe præcis det samme resultat igen?
Og hvis noget går galt, hvor nemt er det så at rulle tilbage?

Så længe antallet af ændringer er lavt, kan vi ofte håndtere det.
Men når tempoet stiger, bliver det sværere.
Og det gælder især nu.
For hele pointen med Agentic Engineering er jo, at vi kan producere ændringer hurtigere.

[CLICK]

Hvis AI hjælper os med at lave 10 gange flere ændringer,
så har vi brug for en måde at verificere 10 gange flere ændringer.

Vi får ikke 10 gange flere timer til test.
Vi får ikke 10 gange flere commissioning engineers.
Derfor bliver vi nødt til at automatisere dele af build-, test- og release-processen.
Ikke fordi mennesker gør noget forkert.
Men fordi mennesker ikke skalerer lige så godt som software.

Og det er præcis det problem Continuous Integration forsøger at løse.

-->

---
layout: default
class: why-devops-matters-slide dark-slide
---

<div class="status-badge general">GENERAL PRINCIPLE</div>
<div class="kicker">WORKSHOP 02 · THE CASE FOR DEVOPS</div>

# Why Testing<br><span class="accent">Becomes Affordable</span>

<div class="why-devops-matters-grid" aria-label="Why DevOps matters more as software creation accelerates">
  <section class="why-devops-matters-panel historical" aria-label="Historically">
    <div class="why-devops-matters-head">
      <div><span>01</span><b>HISTORICALLY</b></div>
      <mdi-account-hard-hat-outline />
    </div>
    <div class="why-devops-matters-items">
      <div class="why-devops-matters-item"><mdi-file-edit-outline /><b>Engineer writes code</b></div>
      <div class="why-devops-matters-item"><mdi-test-tube /><b>Engineer writes tests</b></div>
      <div class="why-devops-matters-item"><mdi-clock-alert-outline /><b>Testing feels expensive</b></div>
    </div>
  </section>

  <section class="why-devops-matters-panel agentic" aria-label="Agentic Engineering">
    <div class="why-devops-matters-head">
      <div><span>02</span><b>AGENTIC ENGINEERING</b></div>
      <mdi-robot-outline />
    </div>
    <div class="why-devops-matters-items">
      <div class="why-devops-matters-item"><mdi-robot-outline /><b>Agent helps create code</b></div>
      <div class="why-devops-matters-item"><mdi-robot-outline /><b>Agent helps create tests</b></div>
      <div class="why-devops-matters-item"><mdi-shield-check-outline /><b>Testing becomes easier to justify</b></div>
    </div>
  </section>
</div>

<div class="slide-id">30</div>

<!--
Økonomien ved at skrive tests har også ændret sig med Agentic Engineering. 

Historisk set har automatiseret test været svært at retfærdiggøre i mange automationsprojekter.

Det er ikke fordi ingen kan lide tests. Problemet er, at tests også skal udvikles, vedligeholdes og opdateres. For mindre projekter har indsatsen ofte virket større end gevinsten.

Men Agentic Engineering ændrer lidt på den ligning.

Hvis tiden til at producere software falder markant, så falder omkostningen til at producere tests også. AI kan hjælpe os med både at implementere funktionalitet og oprette de test cases, der skal verificere funktionaliteten.

Samtidig ser vi ofte, at moderne agent workflows selv genererer og kører tests som en del af deres arbejdsproces. Verifikation bliver derfor en langt mere naturlig del af udviklingsflowet.

Af den grund er det blevet mere rentabelt at skrive tests og nemmere at retfærdiggøre i et OT projekt.
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
  <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-ci" aria-label="Build">
    <span class="delivery-flow-number">02</span>
    <mdi-hammer-wrench />
    <b>BUILD</b>
    <small>repeatable output</small>
  </section>
  <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-ci" aria-label="Test">
    <span class="delivery-flow-number">03</span>
    <mdi-test-tube />
    <b>TEST</b>
    <small>expected behavior</small>
  </section>
  <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-verify" aria-label="Verify">
    <span class="delivery-flow-number">04</span>
    <mdi-shield-check-outline />
    <b>VERIFY</b>
    <small>evidence recorded</small>
  </section>
</div>

<div class="delivery-footer">
  <div class="delivery-footer-label"><mdi-check-circle-outline /><span>CI QUESTION</span></div>
  <strong>Does this change still behave as expected?</strong>
  <small>Fast feedback keeps the change easy to understand and easy to fix.</small>
</div>

<div class="slide-id">31</div>

<!--
På den forrige slide talte vi om at økonomien ved test og verifikation har ændret sig.

Hvis vi kan producere flere softwareændringer, så bliver vi også nødt til at verificere flere softwareændringer.
Det er præcis det problem Continuous Integration forsøger at løse.

Når en ændring bliver lavet, stopper arbejdet ikke ved at koden er skrevet.
Ændringen skal kunne bygges.
Den skal kunne testes.
Og den skal kunne verificeres.

Det vigtige er ikke at alle ændringer er perfekte.
Det vigtige er at vi får feedback mens ændringen stadig er lille.
Hvis noget går galt efter 5 minutters arbejde, er det nemt at forstå og rette.
Hvis noget går galt efter 3 ugers udvikling, er det ofte langt dyrere at finde årsagen.

Continuous Integration handler derfor om at flytte feedback så tæt på ændringen som muligt.

Hvis en agent producerer 20 ændringer på en dag, vil I så manuelt gennemgå dem alle sammen?
Sandsynligvis ikke.
Derfor bliver automatiseret verifikation så vigtig.

CI skalerer feedback på samme måde som Agentic Engineering skalerer softwareudvikling.
-->

<!-- Comment out CD - slide . It felt a bit too repetitive
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

<div class="delivery-handoff">
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
  <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-cd">
    <span class="delivery-flow-number">06</span>
    <mdi-clipboard-check-outline />
    <b>RELEASE CANDIDATE</b>
    <small>ready for decision</small>
  </section>
  <div class="delivery-gate-slot">
    <div class="delivery-gate-arrow" aria-hidden="true"><mdi-arrow-right /></div>
    <div class="delivery-gate">
      <mdi-account-check-outline />
      <span>HUMAN GATE</span>
      <b>release decision</b>
    </div>
  </div>
  <section class="delivery-flow-stage is-deploy">
    <span class="delivery-flow-number">07</span>
    <mdi-upload-network-outline />
    <b>DEPLOY</b>
    <small>controlled target</small>
  </section>
  <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
  <section class="delivery-flow-stage is-monitor">
    <span class="delivery-flow-number">08</span>
    <mdi-chart-timeline-variant-shimmer />
    <b>MONITOR</b>
    <small>feeds the next change</small>
  </section>
</div>

<div class="delivery-footer">
  <div class="delivery-footer-label"><mdi-shield-check-outline /><span>CD QUESTION</span></div>
  <strong>Can we move this verified artifact safely to its target?</strong>
  <small>Automation prepares the release; people own the decision.</small>
</div>

<div class="slide-id">32</div>
-->
<!--

-->

---
layout: default
class: devops-pipeline dark-slide
---

<div class="kicker">WORKSHOP 02 · DEVOPS</div>

<div class="delivery-heading combined-heading">
  <div>
    <h1>CI/CD<br><span class="accent">putting it together</span></h1>
    <p>From code change to controlled release.</p>
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

  <div class="delivery-combined-handoff" aria-hidden="true">
    <span>VERIFIED SOFTWARE<br>BECOMES A<br>RELEASE CANDIDATE</span>
    <mdi-arrow-right />
  </div>

  <section class="delivery-region cd-region" aria-label="Continuous Delivery">
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
      <div class="delivery-approval-slot">
        <mdi-arrow-right class="delivery-approval-arrow" aria-hidden="true" />
        <div class="delivery-inline-gate">
          <mdi-account-check-outline />
          <span>RELEASE DECISION</span>
        </div>
      </div>
      <section class="delivery-flow-stage is-deploy">
        <span class="delivery-flow-number">07</span>
        <mdi-upload-network-outline />
        <b>DEPLOY</b>
        <small>controlled target</small>
      </section>
      <div class="delivery-flow-arrow" aria-hidden="true"><mdi-arrow-right /></div>
      <section class="delivery-flow-stage is-monitor">
        <span class="delivery-flow-number">08</span>
        <mdi-chart-timeline-variant-shimmer />
        <b>MONITOR</b>
        <small>feeds the next change</small>
      </section>
    </div>
  </section>
</div>

<div class="delivery-feedback">
  <div class="delivery-footer-label"><mdi-chart-timeline-variant-shimmer /><span>FEEDBACK LOOP</span></div>
  <strong>Monitor what happened. Feed the next change.</strong>
</div>

<div class="slide-id">33</div>

<!--
Når vi så sætter det sammen med CD kalder vi det CI/CD.

CI verificerer vores ændringer. 

Continours Delivery (CD) pakker og releaser (f.eks. github),
Deployer til PLC, men næsten altid med et mennesker som godkender hvornår. I IT verdenen er det meget normalt at opdateringen kommer automatisk uden et mennesker godkender (eks. dette slide show til github pages. Opdateres auto ved et push til github). Dette passer ikke got i OT hvor det skal passe ind i produktionsplanlægning.
Til sidst har vi monitor delen som feeder de næste ændringer tilbage til vores CI og så får vi igen den her "timeglas effekt" som vi snakkede om i starten. 

Alt dette kalder vi CI/CD og senere har vi også en demo af det, men inden da skal vi snakker lidt om tooling.

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

<div class="slide-id">34</div>

<!--
Vi har nu snakket om CI og CD.
Men der mangler stadig et vigtigt spørgsmål.
Hvordan får vi egentlig alt det her til at ske?
For en pipeline kan ikke trykke på musen.

Hvis vi tager en klassisk engineering-applikation.
Det kunne være Automation Studio.
Det kunne være TIA Portal.
Det kunne være Studio 5000.

Som menneske kan vi gøre en masse ting.
Vi kan åbne et projekt.
Vi kan vælge en konfiguration.
Vi kan starte et build.
Vi kan læse resultatet.
Vi kan overføre software til et target.
Og det fungerer faktisk rigtig godt.

GUI'er er lavet til mennesker.
De er optimeret til at vi kan udforske, forstå og arbejde med systemet.
Problemet opstår først når vi ønsker automation.
For en pipeline ved ikke hvad den skal klikke på.
Den kan ikke se knapper.
Den kan ikke læse dialogbokse.
Den kan ikke fortolke et build-vindue på samme måde som et menneske.

[CLICK]

Så hvis vi vil automatisere build, test, packaging og deployment...
så har vi brug for en anden type interface.
Ikke et interface til mennesker.
Men et interface til software.
Derfor ser vi ofte CLI'er og API'er.
De giver adgang til præcis de samme muligheder som GUI.
Bare på en måde som en pipeline kan forstå.

[CLICK]

Og det leder os til den vigtigste pointe på hele sliden.
"Hvis et menneske skal klikke på det, kan en pipeline ikke automatisere det."
Det er selvfølgelig en lille simplificering.

Men grundideen er vigtig:
Hvis vi vil have DevOps.
Hvis vi vil have automatiske tests.
Hvis vi vil have Agentic Engineering.
Så skal de engineering-funktioner vi allerede har adgang til som mennesker...
også være tilgængelige programmatisk.
Og det er præcis her B&R kommer ind i billedet.

For lad os kigge på hvordan vi forsøger at gøre det i Automation Studio.
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
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> build</span></div>
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> build sim</span></div>
      </div>
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
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> build pip --output ...</span></div>
      </div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-transfer" v-click="1">
      <div class="as-cli-capability-head"><span>04</span><span class="as-cli-capability-icon"><mdi-upload-network-outline /></span></div>
      <b class="as-cli-capability-name">TRANSFER</b>
      <div class="as-cli-capability-purpose">Transfer to a target</div>
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> transfer online --ip ...</span></div>
      </div>
    </article>
    <article class="as-cli-capability-card as-cli-capability-diagnostics" v-click="1">
      <div class="as-cli-capability-head"><span>05</span><mdi-file-search-outline /></div>
      <b class="as-cli-capability-name">DIAGNOSTICS</b>
      <div class="as-cli-capability-purpose">Read controller logbook entries</div>
      <div class="as-cli-command-stack">
        <div class="as-cli-command"><span>&gt;</span><span><strong>as</strong> logbook read</span></div>
      </div>
    </article>
  </div>
</div>

<div class="slide-id">35</div>

<!--
Indtil nu har vi talt om principper og teori.
CI.
CD.
Automatiseret test.
Pipelines.

Men al den teori hjælper os faktisk ikke ret meget hvis værktøjerne ikke kan automatiseres.

Derfor har vi i Danmark arbejdet på as-cli.
(peger på midten)

Det er egentlig ikke en DevOps-platform.
Det er ikke en AI-agent.
Og det er heller ikke en erstatning for Automation Studio.
Det er et programmerbart interface til Automation Studio.

Det betyder at den samme engineering-funktionalitet nu kan bruges af:
- en ingeniør
- en DevOps pipeline
- eller en AI agent

Vi talte om at et menneske bruger en GUI, mens automation kræver en CLI eller API.
Det er præcis den rolle as-cli udfylder.

(peger på capabilities)

For dagens demo er der især 5 capabilities som er interessante.
Build af projekter.
Interaktion med runtime variabler.
Paketering af software.
Transfer til et target.
Og diagnostics.

Det er faktisk nok til at bygge en overraskende stor del af en DevOps pipeline.
Og det er også disse 5 ting vi kommer til at bruge i de næste demoer.

-->

---
layout: default
class: as-cli-demo-slide dark-slide
---

<div class="status-badge demonstradtor">DEMO 1 / 3</div>
<div class="kicker">AS-CLI DEVELOPMENT · DEVOPS IN PRACTICE</div>

# How <span class="accent">as CLI</span> tests itself

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
  <strong>Protects quality. Builds confidence. Catches issues early.</strong>
</div>

<div class="slide-id">36</div>

<!--
Første demo er fra udviklingsprojektet af as CLI.

Projektet har nogle simple unit tests so tester meget isoleret logik eks. at et input til en funktion giver et forventet output. 
Disse tests er meget hurtige og kan køres ofte, men siger ikke meget om hele systemet virker. 
Til det har vi integration tests hvor vi tester alle as cli commands op imod et Automation Studio test projekt. Lad os åbne projektet og kigge på det.

Start  med at gør as --help i en terminal og vis alle de forskellige commands.

Herfeter hop ind i projektet og kør unit tests (tager ca. 2s).

Herefter kør integration test (tager 1.5min).
Lav en fejl "med vilje" og vis herefter at integration test fanger fejlen.
Forklar at vi har et github workflow som kører disse tests automatisk inden release. Dette vil jeg dog vente med at vise til næste demo hvor vi skal demo en helt CI/CD pipeline. 
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

<div class="slide-id">37</div>

<!--
Indtil nu har vi kigget på as CLI som et softwareprojekt.
Men lad os flytte fokus over på noget der minder mere om det mange af os arbejder med til daglig.

Det her er vores orange juice machine.
Det er selvfølgelig et demo-projekt.
Men idéen er præcis den samme som på en rigtig maskine.
Vi har et Automation Studio projekt.
Vi har software.
Vi har en HMI.
Og vi har et ønske om at kunne levere ændringer på en reproducerbar måde.
I stedet for at snakke om det, lad os prøve at gøre det.

[skift til GitHub]

Jeg vil nu lave et release.
Det eneste jeg gør er at oprette et tag og pushe det til GitHub.
Og læg mærke til hvad der sker bagefter.
For her overtager pipelinen arbejdet.
Ikke mig.

[opret tag og push]

Nu starter GitHub workflowet.
Hvis vi åbner Actions-fanen kan vi følge det live.
Det her er vores digitaliserede proces.
Alle de manuelle trin vi tidligere snakkede om...
de er nu beskrevet som et workflow.

[vis workflow]

I praksis sker der nu flere ting.
Projektet bliver bygget.
Der bliver kørt automatiske tests.
Der oprettes et release.
Der genereres artifacts.
Og til sidst publiceres resultatet.
Alt sammen uden at jeg skal logge ind på en build-maskine eller huske hvilke trin der skal køres.

[vis .github/workflows]

Det interessante er faktisk ikke GitHub.
GitHub kunne lige så godt være Gitlab, Azure DevOps, Jenkins eller noget helt tredje.
Det interessante er at processen nu er beskrevet som kode.
Hvis en kollega kloner projektet.
Så får de præcis den samme proces.
Hvis vi kører den i morgen.
Så får vi præcis den samme proces.
Hvis vi kører den om seks måneder.
Så får vi stadig præcis den samme proces.
Det er det der gør den reproducerbar.

[vis de enkelte steps mens workflowet kører]

Læg mærke til at vi producerer mere end bare software.
Vi producerer også evidence.
Vi kan se hvad der blev bygget.
Hvilke tests der blev kørt.
Og om de bestod.
Det er præcis det CI/CD giver os.
Ikke bare automation.
Men sporbarhed.
Når workflowet er færdigt, ligger resultatet klar på release-serveren.
Herfra kan et target hente præcis den version vi lige har bygget.
Det bliver især interessant når man har mange identiske installationer.
Eller når man skal vide præcis hvilken version der blev installeret hvor.
For så er der ikke længere tvivl om hvad der kører.

Der findes ét build.
Ét artifact.
Én version.
Og alle ved hvor det kommer fra.

Transition:
Nu har vi automatiseret build, test og release.
Men hvad med selve brugeroplevelsen?
Hvordan tester vi egentlig at HMI'en stadig virker som operatøren forventer?

-->

---
layout: default
class: hmi-testing-slide dark-slide
---

<div class="status-badge demonstrator">DEMO 3 / 3</div>
<div class="kicker">HMI VERIFICATION</div>

# Test the HMI <span class="accent">like an operator</span>

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

<div class="slide-id">38</div>

<!--
Den sidste demo handler om noget som traditionelt har været svært at automatisere.
Nemlig HMI-verifikation.

(peger på flowet)

Tidligere talte vi om unit tests, integration tests og PLC tests.
Men i sidste ende er det jo ikke en PLC der bruger maskinen.
Det er en operatør.
Og derfor er det også interessant at kunne teste de workflows som operatøren faktisk bruger.

For eksempel:
- kan maskinen startes?
- kan en alarm kvitteres?
- kan en recept ændres?
- vises den rigtige status på skærmen?

Normalt ville en person skulle klikke sig igennem disse scenarier manuelt.

Men præcis som vi kan automatisere build og test af software, kan vi også automatisere brugerinteraktionen med HMI'et.

Det betyder at hver softwareændring automatisk kan kontrollere at de vigtigste operator-workflows stadig fungerer.

Det er præcis det jeg vil vise nu.

Til dette bruger vi et cli fra microsoft som hedder playwright.
For demoens skyld åbner jeg browseren og har lagt nogle animationer ind over. I en rigtig pipeline bille den normalt køre headless i en terminal.

npm run test:demo
Hvis det skulle køre headless kan man bare skrive:
npm run test:hmi
-->


---
layout: default
class: devops-mountain-slide dark-slide
---

<div class="kicker">THE FIRST LOOP · PRACTICAL START</div>

# How to <span class="accent">get started</span>

<p class="mountain-subtitle">One step at a time</p>

<section class="mountain-stage" aria-label="DevOps journey from today's workflow to full CI/CD">
  <div class="mountain-visual">
    <div class="mountain-distant" aria-hidden="true"></div>
    <div class="mountain-main" aria-hidden="true"></div>
    <div class="mountain-facet" aria-hidden="true"></div>
    <div class="mountain-grid" aria-hidden="true"></div>
    <div class="mountain-trail" aria-hidden="true"></div>
    <div class="mountain-origin">
      <mdi-account-hard-hat-outline />
      <strong>TODAY</strong>
      <small>Current workflow</small>
    </div>
    <article class="mountain-checkpoint checkpoint-git">
      <span class="mountain-checkpoint-marker">01</span>
      <div class="mountain-checkpoint-label"><strong>GIT</strong><small>versioned project</small></div>
    </article>
    <article class="mountain-checkpoint checkpoint-build">
      <span class="mountain-checkpoint-marker">02</span>
      <div class="mountain-checkpoint-label"><strong>AS CLI</strong><small>Automate engineering tasks</small></div>
    </article>
    <article class="mountain-checkpoint checkpoint-test">
      <span class="mountain-checkpoint-marker">03</span>
      <div class="mountain-checkpoint-label"><strong>TEST</strong><small>Start with 1 test</small></div>
    </article>
    <article class="mountain-checkpoint checkpoint-evidence">
      <span class="mountain-checkpoint-marker">04</span>
      <div class="mountain-checkpoint-label"><strong>RELEASE</strong><small>Deployment package (PIP)</small></div>
    </article>
    <article class="mountain-checkpoint checkpoint-release">
      <span class="mountain-checkpoint-marker">05</span>
      <div class="mountain-checkpoint-label"><strong>Automate</strong><small>Pipeline execution</small></div>
    </article>
    <div class="mountain-summit">
      <span class="mountain-flag-pole" aria-hidden="true"></span>
      <span class="mountain-flag-pennant" aria-hidden="true"></span>
      <div class="mountain-summit-copy">
        <strong>FULL CI/CD</strong>
        <em>Repeatable and automated delivery</em>
      </div>
    </div>
  </div>
  <aside class="mountain-statement">
    <span class="mountain-statement-label">THE POINT IS PROGRESS</span>
    <strong>Don't start at<br> the summit.</strong>
    <b>Take the next step.</b>
  </aside>
</section>

<div class="mountain-footer">
  <span>Every organization starts from a different place.</span>
  <b>Success comes from taking the next step, not from reaching the summit immediately.</b>
</div>

<div class="slide-id">39</div>

<!--
The goal of DevOps is not to build a perfect CI/CD system overnight.

The goal is to make one engineering workflow more repeatable than it was yesterday.

Start with Git.
Then automate a build.
Then add one meaningful test.
Then capture evidence.
Then automate release activities.

Every step creates value.
-->

---
layout: default
class: working-in-progress dark-slide
---

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
  <div class="working-principle-title"><strong>Where should we focus next?</strong></div>
  <p>Do you have suggestions for our next priorities?</p>
</div>

<div class="slide-id">40</div>

<!--

Lad mig slutte af med at være lidt ærlig.
Vi står ikke her fordi vi synes vi har løst DevOps i industriel automation.
Vi står her fordi vi synes vi er kommet langt nok til at begynde at bruge det i praksis.
Vi har tooling.
Vi har workflows.
Vi har demoer.
Vi har kunder som er interesserede.
Men vi har også lært at nogle ting stadig gør det unødigt svært.

[CLICK]

Den første ting vi arbejder på er Automation Studio i Docker.
Hvis vi ser på hvordan moderne softwareudvikling foregår i IT-verdenen, så forventer man næsten at kunne starte et nyt miljø med én kommando.

Samme version.
Samme dependencies.
Samme setup.
Hver gang.

Det er ekstremt attraktivt når man arbejder med CI/CD, build-servere og AI-agenter.
For jo mindre miljøet betyder, desto lettere bliver automation.
Men det er også et svært problem.
Automation Studio er ikke designet til at være en cloud-native applikation fra starten.
Så det her er noget vi aktivt undersøger og arbejder med.

[CLICK]

Den anden ting er package management.
Hvis vi ser på moderne softwareprojekter, så er dependencies noget man næsten tager for givet.
Man skriver hvad projektet afhænger af.
Og systemet finder, henter og installerer det.
I automation er virkeligheden ofte mere kompliceret.
Technology packages.
Hardware beskrivelser.
Firmware versioner.
Specialkomponenter.
Mange af os har prøvet at få et projekt og bruge en halv dag på at finde alt det der mangler før det kan bygge.
Det er præcis den oplevelse vi gerne vil forbedre.

[CLICK]

Og det er nok faktisk den vigtigste del af sliden.
Vi tror vi er på den rigtige vej.
Men vi er mindst lige så interesserede i at høre hvad I synes.
For kunden bruger systemet på en måde som vi aldrig selv kan simulere.
Så hvis I skulle vælge:
Hvad ville skabe mest værdi for jer?
Hvad er den største barriere for at komme i gang?
Hvad mangler vi?
For den næste fase handler ikke kun om at bygge tooling.
Den handler om at lære hvordan værktøjerne bliver brugt i virkeligheden.

Transition:
Og med det vil vi meget gerne høre hvad I tænker.

-->


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

<div class="slide-id">41</div>