# B&R Agentic Engineering event

## Customer-focused slide and speaker plan

**Format:** 30-minute introduction + 60-minute practical workshop  
**Audience:** B&R customers, machine builders, automation engineers, engineering managers, and software leads  
**Style:** English slide text with Danish speaker notes  
**Workshop example:** Triage and resolve Automation Studio build warnings and runtime logbook findings through a controlled agent workflow

**Scope:** This plan defines the 90-minute customer-facing Agentic Engineering segment. The rendered source deck wraps these 27 content sections with a cover before I1, the retained D1 break handoff after W17, and a D2 intro for the separate DevOps workshop, for 30 rendered slides total. DevOps workshop content beyond that intro and backup slides remain outside this plan and are not included in `slides.md`.

---

# The message in one sentence

> **B&R makes Automation Studio knowledge and engineering capabilities available to agents, so customers can build the workflow that fits their machines, organization, tools, data policy, and quality requirements.**

A shorter version to repeat:

> **B&R owns the bridge. You own the workflow.**

Closing message:

> **The trust is not in the model. The trust is earned by the workflow.**

---

# Review of the proposed story

## What is already strong

1. **The presentation is about customers, not AI technology for its own sake.**  
   The useful question is not "Which model is best?" but "How can a controlled workflow improve engineering throughput and quality?"

2. **DevOps and Agentic Engineering are presented as complementary.**  
   DevOps supplies reproducible execution, evidence, provenance, and gates. Agents use that feedback to choose the next bounded action.

3. **The Automation Studio Agentic Bridge has a clear strategic role.**  
   B&R provides Automation Studio-specific context and interfaces without forcing customers into one model, one harness, or one deployment model.

4. **The workflow is the unit of trust.**  
   This is stronger than claiming that a particular model is trustworthy.

5. **The warning-remediation example is practical and brownfield-relevant.**  
   It connects documentation research, build output, runtime diagnostics, issues, implementation, regression testing, review, and integration.

## Important corrections

### Agents can own execution, but not accountability

An agent can take operational responsibility for the implementation loop:

> research -> implement -> build -> test -> diagnose -> revise -> report

Authorized people still retain engineering, safety, legal, and release accountability. Say:

> **Delegate the implementation loop, not accountability.**

### Git is necessary, but not sufficient, for a repeatable build

A reproducible Automation Studio build also needs:

- pinned Automation Studio, compiler, technology package, and library versions;
- the correct target and configuration;
- controlled generated inputs and editable/generated-file boundaries;
- a known build environment, licenses, dependencies, and credentials;
- clean checkout and build instructions.

### Agile and specifications are not opposites

Avoid saying that specification-driven development no longer works. AI makes reversible code changes cheaper, but it does not make misunderstood intent, hardware changes, commissioning, safety, review, or machine failures cheap.

Use:

> **A living outcome specification defines intent, invariants, constraints, and evidence. Implementation evolves through short, verified iterations.**

Code is excellent implementation context, but it does not fully express:

- why a behavior exists;
- safety and regulatory constraints;
- assumptions and rejected alternatives;
- non-functional requirements;
- customer acceptance criteria;
- ownership and approval decisions.

### Agent-generated tests are useful, but not automatically independent

Agents are often good at producing test scaffolding and exhaustive cases. They can also encode the same misunderstanding in both code and test.

Keep the test oracle independent through:

- human-approved acceptance criteria;
- known-good traces and baselines;
- reference calculations or models;
- invariants;
- separate review ownership;
- deterministic measurements from build, ARsim, PVI, variables, logbooks, or HIL.

### Containers and worktrees reduce interference; they do not remove approvals

Isolation does not automatically:

- protect credentials;
- prevent network or machine access;
- authorize online writes;
- make tests correct;
- protect branches or Git history;
- approve a release.

Use restricted credentials, network policy, protected branches, tool allowlists, and explicit merge/release gates.

### Do not remove every warning blindly

First create a versioned baseline and classify each finding:

- new or pre-existing;
- source, generated, vendor, or configuration-owned;
- defect, expected condition, obsolete suppression, or accepted technical debt;
- severity, root cause, dependencies, and affected configurations.

Create issues by root cause or coherent remediation, not automatically one issue per warning.

## Missing details worth adding

- Clear labels for **official B&R product**, **B&R direction/roadmap**, **event demonstrator**, **community resource**, and **customer-owned component**.
- Source citations, version relevance, freshness, access entitlement, and data governance for MCP knowledge.
- Data residency, customer IP, provider retention/training policy, secrets, and least privilege.
- The difference between offline simulation, HIL, physical machine validation, functional safety verification, and conformity assessment.
- Brownfield regression baselines before feature work begins.
- Structured evidence: commands, versions, timestamps, diffs, logs, test results, assumptions, and approvals.
- A risk-based autonomy ladder: read-only research -> offline change -> sandboxed test -> reviewed merge -> separately engineered target access.
- Success metrics: accepted throughput, escaped defects, review effort, lead time, warning debt, reproducibility, and engineer attention - not generated lines of code.

---

# Product-status legend

Use a small badge on every component slide:

| Badge | Meaning |
| --- | --- |
| **OFFICIAL** | Released and supported according to current B&R product communication |
| **DIRECTION** | Announced architectural direction or roadmap; not a delivery commitment |
| **DEMONSTRATOR** | Event-tested prototype with explicitly limited evidence |
| **COMMUNITY** | Community-maintained or unsupported integration |
| **CUSTOMER** | Owned, governed, and maintained by the customer's organization |

Before the event, confirm the status of:

- Automation Studio Agentic Bridge;
- official B&R MCP availability, entitlements, sources, and supported clients;
- AS-CLI version, availability, Automation Studio compatibility, and support;
- editor or VS Code extension plans;
- template instructions, skills, and workflows;
- AS Help MCP, B&R Community MCP, and AWESOME-BRDK;
- Sandcastle or any other orchestration platform shown.

---

# Timing overview

| Section | Slides | Time |
| --- | ---: | ---: |
| Introduction | I1-I10 | 30 min |
| Workshop | W1-W17 | 60 min |
| **Total** | **27 slides** | **90 min** |

The timing table counts content sections only. The rendered deck order is `COVER`, `I1-I10`, `W1-W17`, `D1`, `D2`; the cover, D1, and D2 are framing slides and do not add content sections to this plan.

---

# Part 1 - Introduction

## I1 - Welcome and today's program

**Time:** 2 minutes  
**Purpose:** Cover practical information and set a practical tone.

### On the slide

> **The future of automation: AI, DevOps and Agentic Engineering**

- Welcome and practical information
- Agentic Engineering: B&R's direction
- Practical workflow example
- DevOps: repeatability, test, and release
- Breaks, lunch, and questions

### Visual

A simple timeline of the day. Keep all logistical information on this one slide.

### What to say

> Velkommen. I dag handler om, hvordan AI og DevOps kan bruges i den virkelige engineering-proces - ikke kun til at foreslå enkelte linjer kode.
>
> Først sætter vi retningen og forklarer, hvorfor B&R arbejder med Agentic Engineering. Derefter følger vi en konkret Automation Studio-opgave gennem context, tools, issues, implementation, test og review. Senere forbinder vi det til DevOps og en reproducerbar release-proces.
>
> Det bliver praktisk, men ikke hands-on. I skal ikke installere noget. Målet er, at I kan genkende mulighederne og begrænsningerne i jeres egen organisation.

### Transition

> Før vi taler om teknologien, skal vi sætte en realistisk ramme for dagen.

---

## I2 - Not another AI guilt trip

**Time:** 4 minutes  
**Purpose:** Build trust, acknowledge customer pressure, and frame the event as a practical starting point rather than a race to catch up.

### On the slide

> **You have not missed the moment.**

Two columns:

| What we will not tell you | What we will tell you |
| --- | --- |
| Everyone else has solved AI | Industrial AI is still emerging |
| Copy our productivity percentage | Results depend on context and process |
| Buy one tool and transformation follows | Start with one bounded workflow |

Reality band:

> **More software. More variants. More evidence. The same scarce expertise.**

Maturity line:

> Autocomplete -> chat assistant -> tool-using agent -> controlled engineering workflow

Footer:

> Industrial automation is early enough to shape the right foundations.  
> Leave with possibilities - not guilt.

### Visual

A restrained two-column contrast with the customer-pressure line as context. Avoid inflated benchmark claims or a collage of AI logos.

### What to say

> Maskiner indeholder mere software, flere varianter og flere integrationer end tidligere. Samtidig bliver kravene til cybersecurity, dokumentation, test og sporbarhed større.
>
> Den klassiske løsning er at finde den helt rigtige specialist på det helt rigtige tidspunkt. Det virker, indtil personen er optaget, skifter rolle, eller projektporteføljen ændrer sig.
>
> Jeg har selv været til mange AI-foredrag og konferencer. Ofte hører man om en virksomhed, der har løst næsten alt med AI og er blevet 30, 40 eller 50 procent mere produktiv. Historien lyder bagefter: "Gør bare som os."
>
> Problemet er, at man sjældent får hele regnestykket med. Man hører ikke altid om investeringerne, fejlene, datagrundlaget, de særlige forudsætninger eller alt det arbejde, der ligger rundt om modellen. Derfor går man let hjem med en fornemmelse af at være bagud - eller med dårlig samvittighed over alt det, man endnu ikke har gjort.
>
> Sådan skal det ikke være i dag. AI i automationsbranchen er stadig nyt. I har ikke sovet i timen. Men tidspunktet er godt til at begynde systematisk.
>
> AI er interessant, fordi vi nu kan gøre mere engineering-viden operationel. Men værdi opstår kun, hvis AI forbindes til den rigtige kontekst, de rigtige værktøjer og en proces, der kan bevise resultatet.
>
> Vi har undersøgt integrationerne og afprøvet mulighederne. Vi vil vise både det, der virker nu, og det, der stadig kræver jeres egen kontekst, jeres egne processer og jeres eget ansvar.

### Transition

> Lad os nu se på det fælles fundament, hvor DevOps og Agentic Engineering mødes.

---

## I3 - Why DevOps and Agentic Engineering complement each other

**Time:** 3 minutes  
**Purpose:** Establish the common foundation.

### On the slide

| DevOps | Agentic Engineering |
| --- | --- |
| Executes a known sequence | Chooses the next bounded action |
| Build, test, package, publish | Inspect, change, diagnose, iterate |
| Deterministic gates | Probabilistic planning |
| Provenance and repeatability | Adaptive problem solving |

Bottom line:

> **DevOps supplies the rails. The agent acts on the feedback.**

### Visual

Two loops sharing the same lower layer:

> Git -> build -> simulation/test -> diagnostics -> evidence

### What to say

> DevOps og Agentic Engineering har forskellig control flow, men de har brug for den samme platform.
>
> DevOps udfører en på forhånd defineret sekvens: checkout, build, test, package og publish. En agent er nyttig, når næste handling afhænger af feedback: Hvilken fil er relevant? Hvorfor fejlede build? Hvilken ændring bør prøves nu?
>
> Begge kræver versionsstyring, en ren build, kontrollerede targets, struktureret diagnostics, objektive assertions og sporbar evidence.
>
> Uden DevOps-fundament kan agenten producere ændringer hurtigere, men organisationen kan ikke styre eller bevise kvaliteten. Med fundamentet kan agentens iteration blive en kontrolleret del af processen.

### Transition

> For at forstå arkitekturen skal vi skelne mellem model, agent og harness.

---

## I4 - What is an agent, and what is a harness?

**Time:** 4 minutes  
**Purpose:** Give the audience a durable mental model and separate the runtime harness from the engineering system of record.

### On the slide

> **Model:** predicts and reasons from the current context  
> **Agent:** uses the model to choose and call tools in a loop  
> **Harness:** supplies context, tools, isolation, permissions, memory, logging, budgets, and approvals

Loop:

> Goal -> inspect -> act -> observe -> decide -> repeat or stop

Small artifact callout:

- **Git:** history, branches, diffs, and rollback;
- **GitHub / Azure DevOps:** collaboration, pull requests, and CI/CD;
- **Agent harness:** model interaction, context, tools, permissions, and approvals;
- **Chat transcript:** working conversation, not the system of record.

### Visual

The agent as a machine cell:

- model = controller choosing the next step;
- tools = actuators and sensors;
- sandbox = cell boundary;
- permissions = access control;
- tests and logs = feedback;
- stop conditions and approval = interlocks.

### What to say

> Modellen alene har ingen adgang til Automation Studio, et project, en PLC eller en logbook. Den kan kun arbejde med den context, den får.
>
> Agenten opstår, når modellen kan vælge et tool, kalde det, se resultatet og beslutte næste trin.
>
> Harnesset er miljøet rundt om agenten. Det finder context, eksponerer tools, styrer permissions, logger handlinger, holder styr på handoffs, begrænser tid og omkostninger og placerer approvals.
>
> Tænk på harnesset som en maskincelle. En intelligent controller er ikke nok. Vi skal også have sensorer, aktuatorer, afskærmning, interlocks og et defineret stop.
>
> Git er selve versionsstyringen. Det giver historik, branches, diffs og mulighed for at gå tilbage. GitHub eller Azure DevOps lægger samarbejde ovenpå med pull requests, rettigheder og CI/CD.
>
> GitHub Copilot, Claude Code, Codex og andre produkter er eksempler på harness-oplevelser. B&R's strategi er ikke at gøre Automation Studio-værdien afhængig af én af dem.
>
> Repository, issue, commit, pull request og testresultat er de holdbare artefakter. En lang chatsamtale er ikke vores system of record.

### Transition

> Hvorfor er dette sket så hurtigt i IT, men langsommere i OT?

---

## I5 - IT and OT are converging

**Time:** 3 minutes  
**Purpose:** Explain why IT is ahead without blaming OT.

### On the slide

> **IT moved first because its work became legible, executable, and reversible.**

| IT advantage | OT constraint |
| --- | --- |
| Text artifacts and standard APIs | Vendor- and domain-specific project structures |
| Git and cheap isolated branches | Long-lived installed base and version coupling |
| Fast CI feedback | Physical timing, I/O, motion, and safety |
| Cheap sandboxes | Limited simulation fidelity and target access |
| Large public code ecosystem | Proprietary hardware and domain knowledge |

### What to say

> IT er ikke foran, fordi softwareudviklere er klogere. IT har i mange år gjort sit arbejde lettere at automatisere.
>
> Kode og configuration er tekst. Git gør ændringer diffable og reversible. APIs og CLIs gør handlinger scriptbare. CI giver hurtig feedback. Sandboxes er billige.
>
> OT har yderligere udfordringer: fysiske konsekvenser, lange livscyklusser, hardware- og versionsafhængigheder, motion, safety og mindre standardiseret feedback.
>
> IT og OT konvergerer nu, fordi flere automation-artifacts bliver inspectable, flere operationer bliver scriptbare, og simulation og diagnostics kan indgå i et feedback-loop.
>
> B&R's opgave er at lukke de sidste Automation Studio-specifikke huller.

### Transition

> Det vigtigste hul er forskellen mellem at generere kode og at verificere engineering.

---

## I6 - Closing the industrial feedback loop

**Time:** 3 minutes  
**Purpose:** Show the minimum system required for Agentic Engineering.

### On the slide

> **Get context -> change -> build -> simulate/test -> observe -> verify -> repeat**

Two needs:

1. **Know:** project structure, B&R products, versions, rules, and intent
2. **Do and observe:** build, simulation, variables, diagnostics, tests, and artifacts

Callout:

> **Without feedback, AI is a plausible text generator.**

### What to say

> En generel model kan ofte læse Structured Text og XML. Men den ved ikke automatisk, hvilke filer der er generated, hvilken configuration der er aktiv, hvordan projektet bygges, eller hvordan cyclic behavior observeres.
>
> Den skal først have context: projektets struktur, relevante manuals, versionsinformation og jeres egne architecture- og coding-regler.
>
> Derefter skal den kunne handle og observere. Den skal kunne build, starte en kontrolleret simulation, læse states og variable, undersøge logbook og køre test.
>
> Når resultatet kommer tilbage som struktureret feedback, kan agenten forbedre sin løsning. Det er forskellen på code generation og Agentic Engineering.

### Transition

> Det er præcis den rejse, vi selv har været igennem.

---

## I7 - What B&R learned on the journey

**Time:** 4 minutes  
**Purpose:** Make B&R's strategy feel earned rather than theoretical.

### On the slide

> **Our starting question:** What is missing before a general agent can work productively with an Automation Studio project?

What we learned:

1. A capable model is not enough
2. Automation Studio projects need domain-specific navigation
3. Product knowledge must be current and retrievable
4. Build and runtime feedback must be machine-readable
5. The same interfaces benefit engineers, tests, CI/CD, and agents

### Visual

A progression:

> Chat assistant -> project context -> B&R knowledge -> AS actions -> closed workflow

### What to say

> Vi startede samme sted som mange andre: Kan en stærk model hjælpe med Structured Text og et Automation Studio-projekt?
>
> Svaret var hurtigt ja - men kun til et vist punkt. Projektstrukturen er anderledes end et typisk softwareprojekt. Hardware, packages, configurations, libraries, generated artifacts og online behavior kræver domæneviden.
>
> Vi lærte også, at dokumentation alene ikke er nok. Agenten skal have en vej til build, simulation, variable og diagnostics. Ellers stopper den ved et sandsynligt forslag.
>
> Den vigtigste læring var, at vi ikke behøver bygge en speciel AI-vej. En god command- og context-grænse kan bruges af mennesker, scripts, automatiske test, CI/CD og forskellige agent harnesses.
>
> Resultatet er strategien bag Automation Studio Agentic Bridge.

### Transition

> B&R skal ikke eje alle lag. Vi skal eje det lag, hvor vores domæneviden skaber unik værdi.

---

## I8 - B&R's strategy: a portable Automation Studio bridge

**Time:** 3 minutes  
**Purpose:** Deliver the central strategic message.

### On the slide

> **B&R owns the bridge. You own the workflow.**

Architecture:

> Customer-selected model and harness  
> **Customer workflow, context, tools, tests, and approvals**  
> **Automation Studio Agentic Bridge**  
> Automation Studio project, simulation, runtime, and B&R knowledge

Bridge components:

- instructions and skills;
- B&R knowledge through MCP;
- AS-CLI actions and structured observations.

### What to say

> Modellerne ændrer sig hurtigere end en normal industriel produktcyklus. Forskellige modeller er gode til forskellige opgaver, og kunder har forskellige krav til cloud, lokal drift, data og økonomi.
>
> B&R's differentierede værdi er ikke endnu en foundation model. Det er B&R- og Automation Studio-kontekst samt kontrollerede engineering capabilities.
>
> Derfor bygger vi en bridge, som reducerer koblingen til én model eller ét harness. Kunden kan vælge miljø og bygge workflowen rundt om egne machines, repositories, tests, interne systemer, quality gates og approval-regler.
>
> Vis statusbadges på komponenterne. En arkitektonisk retning, en demonstrator og et released product er ikke det samme.

### Transition

> Hvorfor bør en maskinbygger investere i den workflow?

---

## I9 - Why customers should care

**Time:** 2 minutes  
**Purpose:** Connect Agentic Engineering to quality, resilience, and profitability.

### On the slide

Four customer outcomes:

1. **Knowledge becomes executable**  
   Workflows, checks, and source-cited context reduce dependency on individual memory.
2. **Expert attention moves upward**  
   Less routine production; more intent, architecture, validation, and risk decisions.
3. **Speed can fund quality**  
   Faster implementation creates room for broader tests, review, and evidence.
4. **Capacity becomes more elastic**  
   Teams can absorb changing demand without every task waiting for the same specialist.

### Visual

An abstraction ladder:

> machine code -> compiler -> frameworks -> agentic workflow

### What to say

> En agent er en ny abstraktion i softwareudviklingen. Hver gang vi er flyttet op - fra assembler til compiler, libraries og frameworks - er det blevet opfattet som snyd af nogen. Men softwarefundamentet forsvandt ikke. Interfaces, architecture, test og debugging blev vigtigere.
>
> Agentic Engineering gør implementation billigere. Den besparelse kan omsættes til flere test, bedre review og mere dokumenteret kvalitet - ikke kun flere features.
>
> Stabil viden skal flyttes fra enkelte personers hukommelse til ejede workflows, instructions, tests og dokumentation. Det hjælper både AI, nye kolleger og support.
>
> Det giver også mere fleksibel kapacitet. Profitabilitet bliver mindre afhængig af, at præcis den rigtige specialist er ledig til hver rutineopgave. Eksperten er stadig nødvendig, men bruger sin tid på de beslutninger, hvor ekspertisen skaber mest værdi.

### Transition

> I workshoppen ser vi derfor ikke på en smartere chat. Vi ser på workflowen rundt om den.

---

## I10 - Workshop challenge

**Time:** 2 minutes  
**Purpose:** Set expectations and introduce the example.

### On the slide

> **Challenge: turn Automation Studio warnings into governed engineering work**

Starting point:

- build warnings;
- runtime logbook errors and warnings;
- an existing brownfield project;
- intended machine behavior must remain unchanged.

Desired output:

> classified findings -> approved issues -> isolated fixes -> regression evidence -> reviewable PR

### What to say

> Vi følger et brownfield-eksempel: Projektet har build warnings og runtime findings i logbook. Opgaven er ikke bare at få et grønt skærmbillede. Vi skal forstå hvert finding, bevare den tilsigtede machine behavior og producere en reviewbar ændring med evidens.
>
> Vi bruger eksemplet til at vise context, MCP, AS-CLI, orchestration, tests, handoffs og human approval.

---

# Part 2 - Workshop

## W1 - It is all about the workflow

**Time:** 2 minutes  
**Purpose:** Make the workflow the central product.

### On the slide

> **The model proposes. The workflow governs. The evidence earns trust.**

Workflow:

> Research -> living specification -> issues -> implementation -> test -> review -> PR -> learning

Surrounding feedback:

- Git and diffs;
- Automation Studio build;
- ARsim/PVI;
- variables and logbook;
- company rules;
- deterministic tests;
- human decisions.

### Visual

A circular workflow surrounded by customized OT tools feeding observations back into the loop.

### What to say

> Den vigtigste enhed er ikke modellen eller agenten. Det er workflowen.
>
> Modellen kan udskiftes. Harnesset kan ændres. Men workflowen definerer, hvordan intent bliver til issues, hvordan ændringer isoleres, hvilken feedback der kræves, og hvem der må godkende resultatet.
>
> Den er et levende engineering-system. Den skal versionsstyres, måles, vedligeholdes og forbedres, præcis som andre dele af jeres platform.

---

## W2 - The Automation Studio Agentic Bridge

**Time:** 3 minutes  
**Purpose:** Show which layers B&R supplies and which layers customers own.

### On the slide

Layered architecture:

1. **Model and harness** - customer choice
2. **Customer engineering system** - machine context, company rules, tools, tests, workflow, approvals
3. **Automation Studio Agentic Bridge**
   - instructions and skills;
   - B&R context through MCP;
   - AS-CLI actions and observations
4. **Automation Studio environment**
   - projects, build, ARsim, PVI, PLC, diagnostics, artifacts

Callout:

> **B&R makes Automation Studio legible and operable. Customers decide how work is governed.**

### What to say

> Industrial automation har brug for mere end en general coding agent. Agenten skal forstå Automation Studio og have kontrollerede interfaces til engineering feedback.
>
> B&R leverer det generiske Automation Studio-lag. Kunden ejer det virksomhedsspecifikke lag: machine intent, architecture, naming, HMI- og alarmregler, interne databases, tests, data policy, risk classification og approval.
>
> Det er en vigtig ansvarsdeling. B&R gør platformen tilgængelig. Kunden beholder kontrollen over sin engineering-proces.

---

## W3 - Instructions and skills: Automation Studio know-how

**Time:** 3 minutes  
**Purpose:** Explain how workflow knowledge is encoded.

### On the slide

| Artifact | Role | Example |
| --- | --- | --- |
| **Instruction** | Always-relevant rule | Do not edit generated artifacts directly |
| **Skill** | Reusable procedure | Diagnose a build warning and return evidence |
| **Project context** | Current facts | Active configuration, libraries, target, module ownership |

Two ownership layers:

- **B&R:** Automation Studio structure, supported commands, generated/editable boundaries
- **Customer:** architecture, naming, alarms, HMI, safety boundaries, definition of done

### What to say

> Instructions og skills er workflowens know-how.
>
> En instruction er en kort regel, der skal gælde inden for sit scope. En skill beskriver en genbrugelig procedure med inputs, tools, checks og output.
>
> B&R kan levere Automation Studio-specifik guidance. Kunden skal supplere med de regler, som kun kunden kender: machine architecture, naming, alarmprincipper, HMI-design, approved libraries og risk boundaries.
>
> Undgå én enorm instruction-fil. Hold de vigtigste regler korte og hent detaljer just-in-time. Dokumenterne skal have owner, version og freshness - ellers kan stale documentation gøre agenten dårligere.

---

## W4 - Official B&R MCP: approved knowledge at the point of work

**Time:** 3 minutes  
**Purpose:** Explain MCP and the value of an official, governed knowledge interface.

### On the slide

> **MCP is an open protocol through which a harness can discover and call approved context and tools.**

Desired qualities of a B&R knowledge response:

- source-cited;
- version-qualified;
- entitlement-aware;
- fresh and auditable;
- explicit about uncertainty.

Potential approved source categories:

- manuals and Automation Help;
- release information;
- product and hardware information;
- approved support knowledge.

### Visual

Question -> B&R MCP -> cited sources -> answer with product/version context.

### What to say

> MCP er en standardforbindelse mellem harnesset og eksterne data eller tools. Det er ikke en model og ikke en database. Det er protocol-laget, der gør capabilities discoverable.
>
> Værdien af et officielt B&R-interface er governance: Hvilken source kom svaret fra? Hvilken version gælder det for? Har brugeren adgang? Hvornår er informationen opdateret?
>
> Brug kun de source-kategorier, som er godkendt i den aktuelle product communication. Anonymous customer tickets må ikke nævnes uden Privacy, Legal, Support og Product approval. Anonymisering alene er ikke nødvendigvis tilstrækkelig. Sales notices kan være restricted eller superseded og må ikke automatisk præsenteres som teknisk authority.

### Presenter note

Replace **Potential approved source categories** with the confirmed, customer-facing scope before the event.

---

## W5 - Community MCPs: practical knowledge connectors

**Time:** 3 minutes  
**Purpose:** Show immediate examples without confusing source authority and product support.

### On the slide

> **AS Help MCP** - search and retrieve installed Automation Studio help  
> **B&R Community MCP** - research relevant community knowledge

Use cases:

- Q&A and onboarding;
- support preparation;
- error-code and library research;
- comparing documentation with community experience.

### Visual

A screenshot of the B&R support agent answering one concrete question:

- question visible;
- B&R/AS version visible;
- cited sources visible;
- uncertainty or assumptions visible.

### What to say

> Community MCPs viser, hvor hurtigt specialiseret knowledge kan forbindes til et agent workflow.
>
> AS Help MCP kan søge i installeret Automation Studio help, browse categories og hente konkrete sider eller Help IDs. Det kan bruge præcis keyword search og valgfri hybrid search. Det gør det nyttigt til både identifiers og naturlige spørgsmål.
>
> Community MCP kan supplere med erfaringer og diskussioner fra B&R Community.
>
> Men skeln mellem source og connector. En community-maintained MCP, der læser officiel dokumentation, bliver ikke automatisk et officielt B&R-produkt. Vis tydeligt **COMMUNITY**, og lad den officielle source have højere authority end et forumindlæg.

### Screenshot guidance

- Use a synthetic or public question - never a customer case.
- Show citations rather than only the final prose answer.
- Prefer a question tied to the later warning example.

---

## W6 - AS-CLI: Automation Studio actions and observations

**Time:** 4 minutes  
**Purpose:** Explain why a CLI closes the engineering loop.

### On the slide

> **MCP gives knowledge. AS-CLI gives controlled action and observation.**

Demonstrated or selected capabilities:

- inspect project and configuration;
- build and start ARsim;
- connect through PVI;
- read variables and logbook;
- stimulate a controlled test;
- create build or packaging artifacts.

Use cases:

> debug -> test -> evidence -> deployment preparation

### Visual

Reuse the existing inline terminal simulator treatment from the current deck: `.evidence-terminal`, `.terminal-title`, `.terminal-body`, and `.terminal-footer`. Do not add a second demo component or an extra AS-CLI slide.

The simulator should show:

```text
as-cli var read ...
{
  "target": "ARsim",
  "variable": "...",
  "value": 42,
  "timestamp": "..."
}
```

Label it with the exact AS-CLI and Automation Studio versions used.

### What to say

> AS-CLI er action- og observation-laget. Et command-line interface kan bruges af en engineer, et script, en automatisk test, en CI pipeline og en agent.
>
> Struktureret output er vigtigt. En agent skal ikke aflæse pixels fra en dialog, hvis samme resultat kan leveres som tydelig JSON med explicit errors.
>
> I demonstrationen kan AS-CLI bruges til build, ARsim, PVI, variable og logbook. Det giver et inspect-change-build-test-observe-loop.
>
> Præsentér kun operations, der er verificeret med event-versionen. Vis **DEMONSTRATOR**, medmindre release, support matrix og Automation Studio-kompatibilitet er officielt godkendt.
>
> Deployment til fysisk target, online writes, motion og safety-relaterede handlinger kræver en separat, least-privilege operating model og kompetent approval.

---

## W7 - Model choice, data boundary, and context engineering

**Time:** 3 minutes  
**Purpose:** Show why the bridge should remain model- and harness-flexible.

### On the slide

Decisions:

- cloud API, private endpoint, or local model;
- data residency and retention;
- customer IP and provider-training policy;
- latency, cost, and availability;
- model capability by task.

Default strategy:

> **Start with capable standard models + current context + tools + evaluations. Fine-tune only for a measured, persistent gap.**

### What to say

> Model choice er en policy- og routingbeslutning, ikke et religionsvalg.
>
> En hurtig og billig model kan være god til classification eller simple implementation tasks. En stærkere reasoning-model kan være relevant til architecture og review. Local models kan være relevante ved særlige data- eller latency-krav.
>
> Fine-tuning er ikke et godt sted at gemme project facts, aktuelle versionsdata eller live machine state. Det hører hjemme i runtime context fra en authoritative source.
>
> Evaluer modeller på jeres egne repræsentative opgaver: correctness, tool selection, latency, cost, data boundary og stopping behavior.

---

## W8 - Context, trajectory, orchestration, and approval

**Time:** 3 minutes  
**Purpose:** Explain the practical constraints that shape workflows.

### On the slide

Context:

> high signal ("smart zone") -> crowded -> lost in the middle -> degraded trajectory

Operating rules:

- one bounded vertical outcome per context;
- retrieve details just in time;
- preserve decisions in issues, specs, Git, and evidence;
- restart from a clean handoff when direction is wrong;
- isolate independent subagents;
- approve based on action risk, not agent name.

### What to say

> Context er agentens short-term working set. Mere context er ikke automatisk bedre. Instructions, chat, files og tool results konkurrerer om opmærksomhed, og information i midten kan blive mindre effektivt brugt.
>
> Der findes ikke en universel token-grænse for en smart zone. Mål den konkrete model, harness og opgave.
>
> En lang session opbygger også trajectory og anchoring. Hvis retningen er forkert, er en frisk session fra et kort issue og rene artifacts ofte bedre end at argumentere mod hele historikken.
>
> Subagents giver context isolation og parallelism, men skaber handoffs og coordination cost. Sandboxes begrænser konsekvensen; approvals placeres stadig ved irreversible eller high-risk actions.

---

## W9 - Steering versus deterministic enforcement

**Time:** 3 minutes  
**Purpose:** Separate behavioral guidance from enforceable quality gates.

### On the slide

| Steering | Deterministic enforcement |
| --- | --- |
| Instructions, examples, plans, retrieved context | Compiler, schemas, permissions, policy checks, tests, CI |
| Influences probabilistic behavior | Enforces an encoded criterion |
| Can lose influence in noisy context | Runs independently of conversation attention |

Callout:

> **Steering guides the trajectory. Gates decide whether output may proceed.**

### What to say

> Guardrails i naturligt sprog er vigtige, men de er behavioral guidance. De er ikke en security boundary.
>
> En compiler, en permission check eller en blocking test kører uafhængigt af, om agenten husker reglen. Derfor er deterministic feedback så vigtig.
>
> Deterministic betyder ikke, at checket er komplet eller korrekt designet. Det betyder, at det kodede kriterium håndhæves reproducerbart i det kontrollerede miljø.
>
> Git er en del af enforcement-laget, men en repeatable build kræver også pinned versions, libraries, configuration og build environment.

---

## W10 - Vibe coding versus Agentic Engineering

**Time:** 3 minutes  
**Purpose:** Show that the workflow, not the model, creates the difference.

### On the slide

| Vibe coding | Agentic Engineering |
| --- | --- |
| Intent -> plausible output | Intent -> workflow -> evidence |
| Context lives in chat | Context is versioned and retrieved |
| Manual trial and error | Executable feedback loop |
| "It looks right" | Acceptance criteria are demonstrated |
| Human chases every change | Agent self-corrects inside bounded gates |
| Good for exploration | Suitable for controlled product work |

Full loop:

> Research -> living spec -> issues -> plan -> implement -> test -> review -> PR

### What to say

> Vibe coding kan være effektivt til learning og prototypes. Problemet opstår, når conversational confidence bliver forvekslet med production control.
>
> Agentic Engineering kan bruge præcis den samme model. Forskellen er workflowen: durable context, controlled tools, objective checks, traceable changes og accountable approval.
>
> På en maskine er "det ser rigtigt ud" ikke et acceptance criterion.

---

## W11 - Speed changes the engineering bottleneck

**Time:** 3 minutes  
**Purpose:** Explain review bottlenecks, abstraction, and the new division of work.

### On the slide

> **Agents are impressive because they are fast. They are frustrating because humans become the bottleneck.**

New division of work:

| Agent implementation loop | Human engineering judgment |
| --- | --- |
| Research, edit, build, test, diagnose, revise | Intent, architecture, oracle, risk, approval |

Callout:

> **Delegate implementation responsibility. Retain human accountability.**

### What to say

> Hvis agenten kan producere changes hurtigere, end vi kan læse dem, virker mere traditionelt line-by-line review ikke som den eneste quality model.
>
> Lad agenten eje implementation-loopet operationelt: Den skal ikke bare skrive kode, men også build, teste, analysere fejl, rette og forklare.
>
> Mennesket fokuserer på specification, strategic architecture, test-oraklet, risk og den endelige evaluering.
>
> Vi bruger altså AI's produktivitet til at finansiere mere kvalitet. Det er ikke et valg mellem speed og quality; målet er højere **verified throughput**.
>
> Som ved compiler og frameworks flytter vi op i abstraction. Softwarefundamentals bliver ikke mindre relevante - de bliver mere værdifulde som constraints under det hurtigere lag.

---

## W12 - Living specifications, TDD, and brownfield baselines

**Time:** 4 minutes  
**Purpose:** Provide a safer alternative to both frozen specifications and undocumented iteration.

### On the slide

Three rules:

1. **Living specification**  
   Intent, invariants, constraints, acceptance criteria, and evidence
2. **Independent test oracle**  
   Tests may be generated; truth must not depend only on the implementation
3. **Brownfield baseline first**  
   Compare project-wide risk-based checks before and after the change

### Visual

> Baseline -> small change -> same regression suite -> new targeted tests -> evidence

### What to say

> SDD og agile er ikke modsætninger. En tung implementation-spec, der forsøger at forudsige alt, kan skabe ventetid og hurtigt blive stale. Men uden en explicit intent kan agenten kun gætte ud fra koden.
>
> Brug en living specification. Fasthold det observerbare outcome, invariants, constraints og definition of done. Lad implementationen udvikle sig gennem små iterationer, og opdater specifikationen, når test og prototypes giver ny viden.
>
> TDD passer godt til agents, fordi test giver hurtig feedback. Men agenten kan skrive den samme misforståelse i både code og test. Acceptance criteria, known traces eller reference behavior skal reviewes uafhængigt.
>
> På brownfield-projekter skal baseline komme først. Build alle relevante configurations, registrer eksisterende warnings og kør risk-based regression af kritiske flows. En ny featuretest kan være grøn, selv om noget eksisterende er blevet ødelagt.

---

## W13 - Three workflows every team needs

**Time:** 4 minutes  
**Purpose:** Define the human and autonomous control boundaries.

### On the slide

### 1. Discovery and specification - **HITL**

> idea/bug -> research -> decisions -> living specification -> prioritized issues

Human decisions:

- product intent;
- trade-offs;
- scope and acceptance criteria;
- risk and permissions.

### 2. Sandboxed execution - **AFK where earned**

> plan -> implement -> review -> test -> integrate candidate

Boundaries:

- isolated checkout/worktree;
- capped loop and budget;
- restricted tools, network, and credentials;
- blocking build and tests;
- no protected-branch or target authority.

### 3. Evaluation and release - **HITL**

> evidence -> engineering review -> PR grouping -> approval -> merge/release

### What to say

> Den første workflow handler om at få den rigtige opgave. Agenten kan research, men mennesker beslutter intent og trade-offs.
>
> Den anden workflow kan være unattended, når den er bounded, isolated og har earned trust. AFK er ikke det samme som unlimited autonomy.
>
> Den sidste workflow handler om accountability. En kompetent person vurderer evidence, test-orakel, architecture, residual risk og release.
>
> Human-in-the-loop er mest værdifuldt ved designede beslutningspunkter - ikke som et sent "kig lige på denne enorme diff."

---

## W14 - Example: specification workflow for warnings

**Time:** 4 minutes  
**Purpose:** Show how MCP and AS-CLI turn findings into governed work.

### On the slide

Input:

- clean checkout and pinned project environment;
- build output for all relevant configurations;
- runtime logbook baseline;
- known accepted warnings and intended behavior.

Agent workflow:

1. Collect build and runtime findings
2. Research codes through official/AS Help/community sources
3. Locate ownership and affected configuration
4. Classify by severity and root cause
5. Propose behavior-preserving remediation
6. Create prioritized issues with dependencies and evidence

### Issue handoff template

- finding and exact source;
- AS/project/configuration version;
- affected file/module and ownership;
- root-cause hypothesis with citations;
- intended behavior and invariants;
- proposed change boundary;
- acceptance criteria and required regression;
- dependencies, risk, and priority;
- unresolved questions.

### What to say

> Først registrerer vi baseline. Hvad er nyt, og hvad var allerede accepteret? Hvilke configurations er påvirket? Er finding i customer source, generated code, vendor library eller configuration?
>
> Agenten bruger build og logbook som facts og MCP-kilder til at forstå error codes og relevant product behavior.
>
> Målet er ikke automatisk zero warnings. Målet er, at alle findings er understood, owned og governed. Nogle skal fixes; nogle skal opdateres eller suppresses med dokumenteret rationale; nogle kræver vendor- eller architecture-beslutning.
>
> Issues oprettes efter root cause og coherent remediation. De beskriver intent og evidence, så næste agent ikke skal genopfinde analysen.

---

## W15 - Example: sandboxed implementation and evaluation

**Time:** 7 minutes  
**Purpose:** Walk through the automatic workflow and correct handoffs.

**Demo scope:** Keep warning remediation as the single live example. Do not add a separate machine-behavior demo.

### On the slide

Animated sequence:

> Planner -> Implementer -> Reviewer -> Test runner -> Integration candidate -> Human evaluation

### 1. Planner agent

Inputs:

- approved issues;
- dependencies and priorities;
- repository and ownership rules;
- available sandboxes and model policy.

Actions:

- select the next ready issue;
- determine whether work is sequential or independent;
- create an isolated branch/worktree;
- produce a bounded implementation handoff.

> Parallel work is used only where state, files, and tests can be isolated.

### 2. Implementer agent

Actions:

- inspect the issue, affected code, and local patterns;
- implement only the approved scope;
- add or update targeted tests;
- build and run relevant local checks;
- commit the bounded change with assumptions and evidence.

Model choice:

> Use an economical model only when task-level evaluations show it is sufficient.

### 3. Independent reviewer agent

Checks:

- implementation against issue intent and invariants;
- customer instructions and architecture boundaries;
- unexpected files or generated artifacts;
- test quality and missing negative cases;
- security, maintainability, and unsupported assumptions.

Routing:

> **Fail -> implementer with cited findings**  
> **Pass -> clean test execution**

The reviewer cannot prove that "nothing was lost in the middle." It provides a fresh hypothesis and cited findings; deterministic regression supplies stronger evidence.

### 4. Test runner

Runs in a clean, controlled environment:

- all required configurations build;
- pre-existing regression suite;
- new targeted tests;
- ARsim/PVI behavior where applicable;
- warning and logbook comparison against baseline;
- artifact and provenance collection.

Routing:

> **Fail -> implementer with exact reproducible evidence**  
> **Pass -> integration candidate**

### 5. Integration candidate

The integration step uses more than the diff:

- issue/specification;
- dependency and ownership state;
- clean-build and regression evidence;
- warnings before/after;
- assumptions and residual risk;
- protected-branch policy.

It prepares a PR or merge candidate. It does not silently push to a protected development branch.

### 6. Human evaluation

The engineer decides:

- Are the deterministic checks relevant and sufficient?
- Does the change satisfy intent?
- Are architecture and risk acceptable?
- Is this the correct PR scope?
- Are follow-up issues needed?
- Is merge or release authorized?

### Evidence boundary on the slide

> **Proves in this workflow:** findings are classified, owned, and linked to a bounded remediation whose declared build, regression, and evidence checks pass in the controlled environment.

> **Does not prove by default:** physical timing, I/O or motion behavior; functional-safety verification; conformity assessment; every Automation Studio version or hardware target; or production deployment and site acceptance.

### What to say

> Hvert agent step har et lille responsibility og et explicit output. Det reducerer context og gør failures routable.
>
> Review-agenten arbejder fra frisk context, men den er ikke en deterministic oracle. Test runneren reproducerer checks i en ren environment. Integrationen bruger hele evidence-pakken - ikke kun diffen.
>
> Mennesket skal ikke nødvendigvis læse hver genereret linje med samme vægt. Mennesket skal forstå strategic code, test-oraklet, unexpected scope og den evidens, workflowen baserer sin anbefaling på.
>
> Vær tydelig om evidensgrænsen. Demoen viser en governed warning-remediation workflow i et kontrolleret miljø. Den er ikke bevis på fysisk timing, functional safety, conformity eller alle targets.

---

## W16 - Three ways to build workflows

**Time:** 4 minutes  
**Purpose:** Give customers a practical maturity path.

### On the slide

| Approach | Strength | Limitation |
| --- | --- | --- |
| **Skills + human orchestration** | Easy, portable, fast to start | Engineer coordinates every handoff |
| **Agents + explicit handoffs** | Repeatable roles and gates | Desktop approvals and orchestration remain |
| **Isolated agent platform** | AFK execution, parallelism, centralized policy | Highest platform, security, and evaluation effort |

### Level 1 - Skills

Start with reusable skills:

- research warning;
- create issue handoff;
- implement bounded fix;
- review evidence.

The engineer remains orchestrator.

### Level 2 - Agent roles and handoffs

Encode planner, implementer, reviewer, and test roles in the chosen harness. Add explicit approval gates and persistent artifacts.

### Level 3 - Dedicated isolated platform

Use or build a platform such as Sandcastle or an equivalent:

- ephemeral container or runner;
- isolated checkout/worktree;
- restricted credentials and network;
- central queue, traces, budgets, and stop conditions;
- protected branches and controlled merge.

### What to say

> Start med det simpleste. Skills giver hurtigt værdi og lærer jer, hvilke handoffs og checks workflowen faktisk behøver.
>
> Næste niveau er explicit agents og orchestration i jeres eksisterende harness. Det giver mere repeatability, men kræver ofte, at en bruger er tilgængelig til approvals.
>
> Et dedicated system kan køre workers i isolerede environments uden løbende desktop-dialoger. Det fjerner ikke governance. Systemet skal selv implementere credentials, network policy, branch protection, audit og merge gates.
>
> En agent kan hjælpe med at analysere et referenceprojekt og bygge en variant, men harnesset er platformkode. Review license, security og architecture, og versionér og evaluer resultatet som ethvert andet engineering-produkt.

---

## W17 - What comes next

**Time:** 4 minutes  
**Purpose:** Close with B&R/customer responsibilities and concrete next steps.

### On the slide

### What customers need from B&R

- supported editor and Automation Studio integration;
- productized, version-compatible AS-CLI;
- official, cited, version-aware B&R context;
- template instructions and skills;
- reference workflows and evidence patterns;
- transparent support and security boundaries.

### What customers can start now

1. Put the project and build inputs under version control
2. Establish a clean build and brownfield regression baseline
3. Choose one bounded workflow
4. Define one objective oracle and one approval boundary
5. Add context and tools incrementally
6. Measure accepted outcomes and review effort

### Inspiration

> **AWESOME-BRDK:** a curated B&R Denmark resource hub for agents, instructions, prompts, skills, MCP servers, tools, and documentation.

Label it according to its approved public/community/support status.

### Closing words

> Vi skal ikke starte med maksimal autonomi. Vi skal starte med én workflow, hvor consequence er bounded, actions er reversible og evidence er stærk.
>
> Når workflowen gentagne gange producerer et godt resultat, kan vi øge scope eller autonomy. Trust er earned per workflow - ikke inherited from a model name.
>
> B&R's opgave er at gøre Automation Studio tilgængelig gennem en robust bridge. Jeres mulighed er at kombinere den med den engineering-proces, der gør jeres maskiner unikke.

Final line:

> **B&R owns the bridge. You own the workflow. The evidence earns the trust.**

Use the final two minutes for questions.

---

# Visual plan

Use five recurring illustrations instead of a new framework on every slide.

## 1. DevOps and agent loops

Two loops sharing:

> Git -> build -> test/simulation -> diagnostics -> evidence

## 2. Agent machine cell

Model in the middle; tools, context, sandbox, permissions, tests, logs, budget, stop conditions, and approval around it.

## 3. Bridge layers

> Customer model/harness  
> Customer workflow and governance  
> B&R Agentic Bridge  
> Automation Studio environment

## 4. Full engineering workflow

> Research -> living spec -> issues -> plan -> implement -> test -> review -> PR

Overlay human intervention points and AFK-safe regions.

## 5. Warning-remediation orchestration

> Planner -> Implementer -> Reviewer -> Test runner -> Integration candidate -> Human approval

Use arrows back to the implementer for review or test failures.

---

# Demo and screenshot checklist

## Support-agent screenshot

- public or synthetic question;
- exact Automation Studio/B&R product version;
- source citations visible;
- assumptions and uncertainty visible;
- no customer, ticket, credential, or internal-only data.

## AS-CLI screenshot

- exact AS-CLI and Automation Studio versions;
- controlled target clearly labelled ARsim where applicable;
- command and structured output visible;
- no credentials, internal paths, or physical-target access;
- one useful observation, such as variable or logbook data.

## Finished-workflow demonstration

Show the completed result in the IDE:

- original issue;
- agent handoffs;
- branch/worktree;
- focused diff;
- warning baseline before and after;
- build and test evidence;
- reviewer findings and any rework;
- final PR candidate;
- named human approval point.

---

# Claims to confirm before presenting

1. Is the name **Automation Studio Agentic Bridge** approved for this event?
2. Which bridge components are released, demonstrators, community projects, or roadmap?
3. What exact source categories and entitlements does the official B&R MCP expose?
4. May customer/support tickets be used at all, and under which legal and privacy basis?
5. Is AS-CLI customer-available, and which AS versions and operations are supported?
6. Is installer integration approved public roadmap information?
7. Which editor or VS Code integration may be shown or promised?
8. What is the approved status and URL of AWESOME-BRDK?
9. Is Sandcastle public, internal, third-party, or only illustrative?
10. Which screenshots and customer-facing examples have Product, Legal, Security, and Marketing approval?

---

# Source notes

- B&R's public Automation Studio Agentic Bridge messaging describes AI progressing beyond suggestions into connected build, test, validation, and deployment preparation, with knowledge embedded in workflows.
- Public B&R Community material describes the strategic shift from one B&R-trained model toward B&R-specific context being accessible from different LLMs and environments through MCP.
- AS Help MCP currently documents search and retrieval from installed Automation Studio help, including keyword search, optional hybrid retrieval, categories, page/HelpID lookup, and AS4/AS6 links.
- AWESOME-BRDK describes itself as a curated B&R Denmark hub for shareable agents, instructions, prompts, skills, MCP servers, tools, and documentation.
- Event claims about AS-CLI should remain bounded by the exact demonstrated version, environment, commands, and evidence.
