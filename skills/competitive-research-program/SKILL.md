# Skill: competitive-research-program

**Purpose**: Run a competitive-intelligence / market-research program that reaches equity-analyst / strategy-consultancy grade, instead of producing a "catalog of public-info write-ups." Use whenever a workspace needs competitive analysis, market sizing, threat assessment, or research feeding an investor/sales/strategy deliverable.

## When to invoke
- A task asks for competitor analysis, market research, a competitive landscape, a market map, TAM/sizing, or "who are our competitors and where do we win."
- Output must support a decision (ranking, where-to-attack, whitespace), not just describe vendors.
- A prior research pass produced isolated per-company profiles with no cross-company synthesis.

## Governing knowledge (read first)
- `~/.arche/knowledge/business/competitive-intelligence-methodology.md` — the authoritative methodology; this skill operationalizes it.
- `~/.arche/knowledge/process/multi-source-evidence-discipline.md` — the evidence-theater failure mode + two-reviewer gate.

## Core principle
**Two layers, never collapsed:** a collection FLOOR (the evidence) + a synthesis CEILING (the intelligence). Collection alone is ~80% of elite; the deficit — and the entire difference between a catalog and intelligence — is at the synthesis layer (cross-company instruments, moat decomposition, threat-to-us).

## Procedure

### 1. Lock the universe & contract
- Fix the company set; assign each a depth tier (deep / context / mention) and a **comparability class**. Scoring only compares within / across explicitly-noted classes — never silently mix categories.
- Define a FIXED structured data contract (JSON schema) up front so every collection subagent returns machine-consolidatable output. A subagent inventing its own keys breaks the merge and is returned for rework.

### 2. Collection (floor gate)
- Per company: ≥5 distinct source *categories*; primary-over-secondary; every claim cited + dated.
- Vendor self-claims quarantined as `(claimed, unverified)` — NEVER written as fact.
- A profile failing the floor is flagged for re-collection BEFORE scoring — never silently scored on thin air.
- Coverage/floor metrics are **derived from the actual sources, never self-asserted** (an agent will set `passes_floor: true` to satisfy a checklist).

### 3. Synthesis (the 12 instruments — the reusable core)
Build, in dependency order: tiering → SWOT → Five Forces → normalized pricing → feature-scoring → **moat decomposition (the centerpiece)** → GTM/ICP → funding/traction → trust/regulatory → market map + sizing → **threat-to-us + win/loss (the decision layer)** → coverage scorecard. Each instrument: owner role, sourced/confidence-rated cells, and a reasoning chain travelling with every verdict.
- **Moat test:** does volume create a feedback loop competitors can't replicate (a flywheel), or is it just a big number (vanity metric)? Write the durability reasoning AND the strongest counter-argument.
- **Dynamic-threat reframe:** rank threats by strategic-move PROBABILITY + vector, not just current overlap; name a **watch-trigger** (the observable event that falsifies the ranking) for each.

### 4. Gap-handling (the discipline)
Three states of an unknown: **Fact** (sourced, HIGH) / **Disciplined estimate** (modelable from anchors, named method, ≤MEDIUM) / **Unknown** (recorded with the resolving query, LOW). The line never crossed: an estimate without a method, or a number as fact without a source, is **fabrication** (Law-14.9-class violation, not a quality defect). Estimation ladder (name the rung): own anchors > third-party procurement data > peer-class median > structural inference.

### 5. Review gate (two reviewers)
- **Constructive** reviewer: structure / completeness / build.
- **Adversarial** reviewer: assume the output is hollow; **trace the headline claim (the #1-ranked item, the thesis anchor) back to its raw sources FIRST.** The constructive review will pass a single-vendor-sourced headline; only the adversarial trace catches it.

### 6. Publication & extraction
- Consolidate into the dataset + a report + a **bilingual** executive summary (separate per-language files, neither "the source of truth").
- For any competitor-facing material, every weakness/advantage claim is **hypothesis-labeled with its evidence** (analysis / hypothesis / estimate) — guards against defamation.
- Extract reusable operational knowledge back to `knowledge/`.

## Model allocation
Synthesis instruments (Five Forces, moat, market map, threat-to-us) and ambiguous entity/funding disambiguation need the **strongest** model — competitive research is strategic-grade throughout, not just at decision points. Routine collection may use a faster model.

## Done criteria
A reader can answer, from the output alone: "who is the #1 threat and why, where is our whitespace, and what would change the ranking?" If they can only read per-company facts, the synthesis layer is missing — not done.
