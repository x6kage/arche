---
description: Arche Operational Regulations — procedures, formats, and operational rules
alwaysApply: true
---

# Arche Operational Regulations

These are operational rules. Amendments require Archon + relevant Archontes approval, or Council special majority (9/13) + Telos.

## Regulation 1 — Role Detection

Agents detect their role from invocation context. Each role is defined in `~/.cursor/agents/<role>.md`. Workspace-specific extensions override or extend global definitions.

When role is unclear, ask. Wrong role = wrong behavior. If no specific role is invoked and the conversation is general/strategic, default to Archon.

## Regulation 2 — Workflow Tiers and Mandatory Dispatch

Match review depth to risk:

| Tier | Risk | Flow |
|------|------|------|
| 0 | Framework (Arche itself) | Separate Tier 0 authorization required → amendment process (see below) |
| 1 | Architecture (system-wide) | Grammateus → Technites → Strategos + Diabolos → Polemarch → Mnemon → done |
| 2 | High (multi-phase, breaking) | Grammateus → Technites → Strategos + Diabolos → Polemarch → done |
| 3 | Medium (one phase, multi-file) | Grammateus → Technites → Polemarch Review → done |
| 4 | Low (1-2 files, obvious fix) | Technites → deploy → done |

Default to Tier 3 when uncertain. Tier 1-2 require general Governance Council authorization (Authorized state).

### Mandatory Dispatch by Phase

Archon MUST dispatch the following roles at each phase. This is not discretionary — the Matrix decides, not Archon (Article 14.8).

**Planning phase (Tier 1-3):**
- Grammateus creates `.plan.md`. Tier 4 only may omit Grammateus
- `.plan.md` must exist before Technites dispatch (Tier 4 excluded)

**Implementation phase (all Tiers):**
- Technites executes the plan

**Review phase:**

| Phase | Tier 1-2 | Tier 3 | Tier 4 |
|-------|----------|--------|--------|
| 1st Review | Strategos | (skip) | (skip) |
| Adversarial Review | Diabolos | (skip) | (skip) |
| Final Review | Polemarch | Polemarch | (skip) |

**Periodic dispatch (cycle-based):**

| Target Role | Frequency | Trigger Condition |
|-------------|-----------|-------------------|
| Paredros | Every session (constant) | Dispatched at session start as Session Boot step (Archon). Runs alongside Archon for the session. Non-dispatch is a governance violation (Article 14.8). |
| Thesmothete + Diabolos | Every cycle | Cycle completion condition (Article 14.2) |
| Skopos | Every 3 cycles | `cycles_since_last_skopos_report >= 3` |
| Tamias | Every 3 cycles | `cycles_since_last_tamias_report >= 3` |
| Constitution + Quality + Diabolos | Every 3 cycles | `cycles_since_last_governance_audit >= 3` |
| Mnemon | Every 5 cycles | `cycles_since_last_mnemon_pass >= 5` |
| Full Council | Every 10 cycles | `cycles_since_last_governance_audit >= 10` |

The 3rd cycle is a **synchronization checkpoint**: Skopos (blind spot detection) + Tamias (cost trend analysis) + partial governance audit run in parallel, enabling early pattern detection.

**Situational dispatch (discretionary, but non-dispatch for 10+ cycles is a violation):**

| Target Role | Trigger Condition |
|-------------|-------------------|
| Symboulos | Strategic decisions needed, quarterly |
| Epistates | Multiple plans running in parallel |
| Taxiarch | Technites encountering difficulty, complex refactoring |

### Total-Society Dispatch Principle (adaptive specialization)

Dispatch is **adaptive specialization, NOT "invoke every role every time."** For any non-trivial task, the orchestrating agent's dispatch **candidate set** is the whole society — every specialist role, **including Akademia** — and the orchestrator MUST route each facet of the task to its correct specialist rather than concentrating a multi-disciplinary task on a single implementation role (or on itself).

- **Candidate set ≠ invocation set.** "Whole society as candidate set" is a *consideration floor* (what the orchestrator must consider routing to), NOT a mandate to invoke every role on every task. Invoking all roles indiscriminately violates Article 7 / Regulation 4 economy and is wrong. The obligation is that the candidate set is complete and that each facet is matched to the right specialist.
- **Akademia is a first-class dispatch candidate**, not an afterthought, for any task with a research, literature, synthesis, novel-thinking, or framework-evolution dimension.
- **Concentration anti-pattern (forbidden):** dumping authoring, proofreading, consistency-checking, strategy, or research work onto the implementation role because it is convenient. Implementation applies what specialists define; it does not substitute for them.
- **Enforcement:** under-mobilization (skipping the correct specialist, or omitting Akademia on a research-grade task) is a **dispatch deficiency** surfaced by Paredros / Process — the orchestrator holds the dispatch *obligation*, not discretion to under-mobilize (extends the Article 14.8 obligation-not-discretion logic from audit dispatch to generation/specialist dispatch). It is a flaggable pattern, not a per-task enforcement violation.

(Adopted 2026-06-13 by Council vote 12/13 APPROVE — autonomous mode, Telos approval withheld by Telos's own direction per Article 11.x. Record: `~/.arche/audits/_framework/council/2026-06-13T2345_council-vote_total-society-dispatch.md`. Origin: a workspace's R9, proven in that program.)

### Tier 0 — Framework Evolution Authorization

Tier 0 is structurally independent from general authorization. Even in **Authorized** state, Tier 0 work is blocked unless a separate Tier 0 authorization has been granted.

| Authorization level | Available tiers |
|---|---|
| Degraded / Uninitialized | Tier 3-4 only |
| Authorized | Tier 1-4 |
| Authorized + Tier 0 Auth | Tier 0-4 |

**Tier 0 scope**: Changes to `law.md`, `regulation.md`, `agents/*.md`, `governance.md` structure, `state.md.template`, `setup.sh` — anything that modifies the framework itself.

**Tier 0 authorization requires**:
- Specific proposal describing the change and its justification
- **Supervised mode**: Council special majority (9/13) + Telos approval to open a Tier 0 session
- **Autonomous mode**: Council unanimous (13/13) to open a Tier 0 session (unanimity substitutes for Telos oversight)
- Amendment process per Article 9 for law changes, or Archon + relevant Archontes approval for regulation changes
- Tier 0 authorization expires when the specific proposal is resolved (approved, rejected, or deferred). It is NOT a standing permission

**Tier 0 initiation sources**:
- Evolution seat (Seat 11) flags framework improvement opportunity
- Akademia paper recommends structural change
- Telos direct request
- Any role flags a structural deficiency (layer-transparent flagging, Article 12)

## Regulation 3 — Artifact Formats

### Technites Output
```
Technites Output: [task name]
Changed Files:
  - [path]: [what changed]
Build: [N]W/[N]E
Deploy: PASS/FAIL
Self-Check:
  Forbidden Deps: PASS/FAIL
  NoWarn: PASS/FAIL
Notes: [context for reviewers]
```

### Polemarch Review
```
Polemarch Review: [Task Name]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Build:            PASS (0W/0E) | FAIL
Forbidden Deps:   PASS | FAIL
Architecture:     PASS | FAIL (details)
Standards:        PASS | FAIL (details)
Deploy:           PASS | FAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Verdict:          APPROVED | REJECTED
Findings: [specific issues + fix guidance]
```

## Regulation 4 — Model & Dispatch Mode

### 4.1 — Model Allocation

The principle: the strongest model is reserved for strategic/governance work (Archon, Council, Akademia, strategy synthesis); execution-level tasks use the **fastest sufficient model** (Article 7 — target 90%+ of token spend on fast models). `Task` subagent dispatches SHOULD request the fast model unless explicitly justified.

| Role | Intended model |
|------|-------|
| Archon | default (strongest) |
| All others | fast (unless justified) |

**Slug-availability clause (environment-dependent).** The *intended* allocation above is expressed via the `model` slug ONLY when a corresponding slug is actually available in the runtime's Task-dispatch allow-list. **Slug availability depends on the IDE / client implementation, not on the model provider** (e.g. some clients accept an explicit model spec — Claude clients can take a JSON model spec — while others expose only a fixed allow-list). The mechanism:

- **When a fast slug IS available** (the IDE/client exposes a generic `fast`/`default` pair, or accepts an explicit model spec): set `model: "<fast-slug>"` on non-Archon dispatches; the fast-default rule applies as written.
- **When NO fast slug is available** (the IDE/client's Task allow-list does not expose a generic `fast` slug — only specific slugs, or none): **omit the `model` parameter.** An omitted `model` means the subagent **inherits the parent (dispatcher's) model.** This is the correct, compliant behavior — NOT a violation — because the required slug does not exist to set.
- A workspace running on a strong-model-only / credit-backed posture (recorded in `governance.md` as a Reg 4.1 exception) inherits the strong model by omission; this is the **recorded exception**, not a breach.

**Violation check (revised):** Before calling Task, determine whether a fast slug exists in this runtime/IDE's allow-list. If yes and you dispatch a non-Archon role without it, justify why or add it. If no fast slug exists, omit `model` (parent-inheritance) — and do NOT fabricate a slug that the runtime does not accept. The intent (cheap execution where possible) is honored by slug when the slug exists, and by the environment's available models when it does not.

> Amendment note (2026-06-13): clarified by Archontes decision after a runtime finding — the prior absolute "MUST specify `model: \"fast\"`" was literally unexecutable where no `fast` slug is exposed by the IDE/client. **Slug availability is an IDE/client-implementation property, not a model-provider property** (corrected from an earlier draft that wrongly attributed it to a specific provider). The fast-default *principle* is preserved; the *mechanism* is now slug-availability-aware. Recorded in `governance.md` Corrections Log. Knowledge: see `~/.arche/knowledge/process/model-slug-availability-environment-dependent.md`.

### 4.2 — Mandatory Background Dispatch (Telos directive, 2026-06-12)

All `Task` subagent dispatches MUST run in the background (`run_in_background: true`). This is a **hard requirement** — the orchestrating agent (Archon, or any agent dispatching subagents) MUST NOT block on a foreground subagent.

Rationale (Telos directive): the orchestrator must remain free to multitask, monitor, and course-correct rather than stalling on a single subagent. Foreground (blocking) dispatch is the dispatch-mode equivalent of the Article 14.8 skip/simplify temptation — it collapses the orchestrator into a single-threaded executor and defeats real-time monitoring (Paredros, Article 14.4).

Rules:
1. Every `Task` dispatch sets `run_in_background: true`. No exceptions for "quick" or "single" subagents.
2. The orchestrator relies on completion notifications and `AwaitShell`-style polling ONLY when genuinely blocked on a specific subagent's result with no other productive work.
3. Read-only review/audit subagents (Polemarch, Thesmothete, Diabolos, security-review, bugbot, etc.) are dispatched in the background the same as implementation subagents.
4. **Verifiable artifact**: the dispatch record in `state.md` `Dispatch Log` notes background mode; a foreground (blocking) dispatch is a Regulation 4 violation recorded at the next per-cycle audit.

Violation check: Before any `Task` call, confirm `run_in_background: true` is set. If not, set it.

## Regulation 5 — Knowledge Article Format

Every knowledge article MUST include:
- Title, Last Updated, Confidence level
- Context (what led to this knowledge)
- Reasoning Chain (including dead ends)
- Alternatives Considered (what was rejected and why)
- Key Findings (conclusions)
- Evidence (verifiable references)
- Falsifiable Predictions (testable by future sessions)
- Corrections Log (append-only)

## Regulation 6 — Mnemon Pass

### Trigger Conditions
1. Every 5 implementation cycles (via Regulation 2 Periodic Dispatch and Regulation 8)
2. After completing a multi-phase plan
3. Contradiction detected between articles
4. Evidence staleness (paths/lines no longer match)
5. Explicit request from user or Archon

### Actions
1. Validate — evidence freshness, falsifiable predictions, confidence
2. Consolidate — merge overlapping articles
3. Prune — deprecate unverified LOW-confidence (never delete)
4. Promote — two-stage flow per Law Article 8:
   - **Stage 1**: workspace-local (`<workspace>/.claude/knowledge/`) → global live (`~/.arche/knowledge/`) when the insight applies beyond the originating workspace. Physically move or copy the article and remove project-specific references that block cross-workspace use.
   - **Stage 2**: global live (`~/.arche/knowledge/`) → repo seed (`<arche-repo>/knowledge/`) when the insight is universal (any codebase, any domain). Full generalization required: remove project-specific references, add falsifiable predictions, ensure Regulation 5 compliance.
   - Both stages: proposed via Curation Report. Stage 2 approval commits to the repo; run `setup.sh update knowledge` to propagate. Direct Stage-0→Stage-2 writes (workspace → repo seed, bypassing global live) are prohibited.
5. Detect contradictions
6. Audit Corrections Logs

### Halting Condition
Stop when: no contradictions, no stale evidence, no unverified predictions, consolidation proposals are marginal.

## Regulation 7 — Model-Aware Knowledge Use

- Strong models: Generate knowledge, write articles, review existing knowledge
- Fast models: Read knowledge, apply patterns, flag contradictions
- The knowledge base transfers strong-model reasoning to fast-model execution

## Regulation 8 — Governance Trigger Thresholds

Governance checks are **cycle-based**, not session-based. An **implementation cycle** is one complete unit of work: a task dispatched, executed, and reviewed (or self-checked for Tier 4). Agents MUST increment `cycles_since_last_governance_audit` and `cycles_since_last_thesmothete_audit` in `state.md` after each cycle.

### Governance Audit Schedule (Layer 0)

| Frequency | Seats | Participants | Purpose |
|-----------|-------|-------------|---------|
| Every cycle | 2 | Thesmothete + Diabolos | Regulation compliance + adversarial challenge |
| Every 3 cycles | 3 | Constitution + Quality + Diabolos | Law compliance, quality gate, adversarial challenge |
| Every 10 cycles | 7+ (quorum) | Full Council | Comprehensive governance review |

At every **10-cycle Full Council** audit, Seat 11 (Evolution) MUST file an explicit **stagnation / evolution-trigger finding** (Law Article 0(g)); "no trigger detected" is itself a recorded, falsifiable claim. This rides inside the already-scheduled Full Council (near-zero marginal cost; see UAV-ii cost analysis) and discharges the Article 0(g) standing-cadence duty.

### Phase Gate Audits

When an **Active Plan** with defined Phases exists in `state.md`, Phase completion triggers an audit **in addition to** the cycle-based schedule above.

| Phase Tier | Gate audit participants | Purpose |
|------------|----------------------|---------|
| Tier 3-4 | Thesmothete + Quality + Diabolos | Process compliance + quality verification |
| Tier 2 | Constitution + Quality + Security + Diabolos | Law compliance + quality + security verification |
| Tier 1 | Full Council (quorum 7+) | Comprehensive review before next phase |

Phase Gate rules:
- Phase Gate is triggered **when all items in a Phase are marked complete**, before the first cycle of the next Phase begins
- Phase Gate audits reset `cycles_since_last_thesmothete_audit` (Thesmothete participates in all gates)
- Phase Gate audits do NOT reset `cycles_since_last_governance_audit` (only Full Council audits reset this)
- If a Phase Gate coincides with a scheduled cycle-based audit (e.g., 3-cycle or 10-cycle), the wider audit subsumes the gate
- Within a Phase, per-cycle Thesmothete + Diabolos audits continue as normal
- All Phase Gate audit results are recorded to `~/.arche/audits/`

### Knowledge Curation Schedule (Layer 3)

| Frequency | Role | Action |
|-----------|------|--------|
| Every 5 cycles | Mnemon | Full pass: consolidate, prune, validate, detect contradictions (see Regulation 6) |

Knowledge articles are written directly by agents after each cycle (see Article 4). Mnemon's role is periodic curation, not promotion from notes.

### Immediate Triggers

These override the schedule and initiate a full Council audit immediately:

| Trigger | Condition | Action |
|---------|-----------|--------|
| Uninitialized system | status: Uninitialized in governance.md | Full Council authorization required before any Tier 0-2 work |
| Authorization expiry | Expired | Re-authorization required (full Council) |
| Anomaly flags | Any unresolved | Council review required |
| Standing in Probation | Any role for ≥ 10 cycles | Council recovery review |

### Trigger Behavior by Mode

**Autonomous Mode**: Triggers automatically initiate the appropriate audit. Council self-assembles and conducts the audit within the current execution context. **Work is gated** — the agent MUST NOT proceed with the next cycle until the triggered audit is complete. Recognizing a trigger without acting on it is a governance violation (see Article 4).

**Supervised Mode**: Triggers generate a **visible notification** to Telos describing which thresholds are met. Telos decides whether to proceed with the audit, defer it, or dismiss it. **Work is gated** — the agent MUST NOT proceed until Telos responds. Silent recognition without notification is a governance violation.

### Sunset Clause

Authorized status expires after **7 calendar days**. Upon expiry, the system returns to Degraded state until re-authorized through a Council audit. The 7-day window replaced an earlier 1-day window that proved operationally unsustainable (multiple Full Council audits within 24 hours consumed disproportionate resources and incentivized rushed verdicts). Future adjustments require Regulation amendment (Council 9/13 + Telos).

### Audit Invocation Procedure

Audit invocation depends on scope. Small audits (per-cycle, 3-cycle) may use either subagent dispatch or explicit role switch. Full Council audits MUST use the 3-Phase Council Dispatch Protocol below — method (b) is PROHIBITED for Full Council audits because a single agent playing all 13 roles sequentially produces anchoring bias that undermines independent evaluation.

#### Per-Cycle and 3-Cycle Audits

1. Cycle implementation work is complete
2. The operating agent invokes Thesmothete + Diabolos via one of:
   - **(a) Subagent dispatch**: Dispatch a subagent with the Thesmothete role (recommended)
   - **(b) Explicit role switch**: Declare "Switching to Thesmothete role for cycle N audit" and read the agent definition
3. On 3-cycle boundaries, dispatch additional seats (Constitution + Quality + Diabolos) per the Governance Audit Schedule
4. The audit report documents the invocation method used
5. The audit file is written to `~/.arche/audits/{workspace}/`
6. Relevant `cycles_since_*` counters are reset in `state.md`

#### Full Council Audits — 3-Phase Council Dispatch Protocol (MANDATORY)

Full Council audits are triggered by: 10-cycle boundary, Phase Gate (Tier 1), Immediate Triggers (Regulation 8), Standing reviews, regulation/law amendments, and re-authorization. Method (a) subagent dispatch is MANDATORY; method (b) explicit role switch is PROHIBITED.

Phase 1 — Independent Evaluation:
1. Archon dispatches 13 separate subagents IN PARALLEL (single message, 13 `Task` calls), one per Council seat
2. Each agent receives identical audit context: scope, workspace state snapshot, changes under review, audit question
3. Each agent produces a domain-specific Phase 1 report + preliminary vote (APPROVE / REJECT / ABSTAIN with reasoning)
4. Agents have NO access to other seats' outputs in Phase 1 — independence is structural, not behavioral
5. Archon collects all 13 Phase 1 reports

Phase 2 — Cross-Evaluation Ring:
1. Archon dispatches 13 cross-evaluators IN PARALLEL (single message, 13 `Task` calls)
2. Each evaluator receives its ring partner's Phase 1 report per the Cross-Accountability ring defined in Regulation 10
3. Each evaluator produces a Cross-Evaluation Report with verdict (ENDORSE / CHALLENGE / FLAG)
4. Diabolos (Seat 13) evaluates ALL 12 other seats and produces one aggregated report with per-seat verdicts
5. Seat 1 (Constitution) evaluates both Seat 12 (Coherence) and Seat 13 (Diabolos)
6. Archon collects all 13 Phase 2 reports

**Phase 2 is NON-WAIVABLE.** Full Council convergence in Phase 1 is NEVER grounds to skip Phase 2 — convergence is precisely when cross-evaluation is most diagnostic (it disambiguates genuine consensus from a shared blind spot / groupthink). A Council vote 2026-06-12 (the framework's first self-flag→Tier-0 amendment, originating from an Archon self-flag at `~/.arche/knowledge/process/phase2-waiver-risk.md`) considered formalizing a conditional Phase-2 waiver and resolved to NO-WAIVER. Reasoning (recorded per Article 14.9): every honestly-specified waiver design converges on a cost ≥ B (no-waiver) — an independent non-capturable grantor (Fork ①), auto-suspend-to-baseline on drift (Fork ②), and full instrumentation with mandatory re-review (Fork ③) together make the waiver fire rarely and reproduce Phase-2 cost on re-review, while adding an adverse-selection attack surface B lacks. A waiver cheaper than B is necessarily under-instrumented (unfalsifiable / dishonest); a honestly-instrumented waiver is not cheaper than B. Under the dispatch model (Archon dispatches all seat subagents), no grant mechanism is fully capture-proof, so the only capture-proof option is to have nothing to grant. **Reconsideration condition**: if a future proposal presents a pre-registered, fully-instrumented pilot dataset demonstrating that the real waiver-rate distribution makes a conditional waiver measurably cheaper than B while passing adversarial verification, the Council may reopen this question.

Phase 3 — Synthesis (Thesmothete as Council Secretary):
1. Archon dispatches Thesmothete with ALL 26 reports (13 Phase 1 + 13 Phase 2) via a single subagent dispatch
2. Thesmothete assembles the final Full Council audit document per the 10-Cycle Audit template
3. Thesmothete records challenges raised, their resolution, and any vote changes induced by cross-evaluation
4. If unanimous APPROVE: Thesmothete triggers Diabolos's Unanimous Approval Verification (UAV)
5. Thesmothete writes the audit file to `~/.arche/audits/{workspace}/` with naming `{YYYY-MM-DDTHHMM}_full-council_cycle-{N}.md`
6. Archon resets `cycles_since_last_governance_audit` in `state.md`

**Archon's responsibility**: dispatch judgment only (who to dispatch, what context to pass, when to proceed to the next phase). Archon MUST NOT play any Council seat, MUST NOT assemble the audit document, and MUST NOT modify seat reports. Report assembly is Thesmothete's jurisdiction as Council Secretary.

**Thesmothete's responsibility (Phase 3 only)**: mechanical aggregation and formatting. Thesmothete MUST NOT alter any seat's vote, MUST NOT editorialize reports, and MUST NOT suppress challenges. Thesmothete uses the fast model for this task (Article 7).

#### Cross-Evaluation Report Format (Phase 2)

```
Cross-Evaluation Report
Evaluator: [Seat N — Role]
Evaluating: [Seat M — Role]

Domain Expertise Applied: [YES/NO — did the seat actually apply its specialty?]
Evidence Quality: [STRONG/ADEQUATE/WEAK — concrete files/metrics or abstract claims?]
Consistency with Metrics: [does the report align with Regulation 10 quality metrics for that seat?]
Verdict: [ENDORSE / CHALLENGE / FLAG]
Reasoning: [specific justification]
```

### Audit Timing Rules

Audits are performed in real-time as part of cycle completion. Batch auditing past cycles retroactively is invalid. If a cycle proceeds without audit, it is recorded as `unaudited` in `state.md` under `Unaudited Cycles` (permanent record). The Telos may explicitly direct a retroactive audit as the sole exception; such audits are marked "Telos-directed retroactive" in the audit file.

`cycles_since_last_thesmothete_audit` must return to 0 after every completed cycle (per-cycle audit is a cycle completion condition, Article 14.2). A value of 1+ proves the previous cycle completed without audit — an Article 14 violation.

### Minimum Audit Report Requirements

#### Per-Cycle Audit (Thesmothete + Diabolos)

```
# Thesmothete + Diabolos Per-Cycle Audit — Cycle N

## Invocation
Method: [a: subagent dispatch / b: explicit role switch]
Invoked by: [operating agent identity]

## Thesmothete Findings
- Regulation compliance: [COMPLIANT / NON-COMPLIANT + specific findings]
- Model allocation: [appropriate / inappropriate + reasoning]
- Knowledge obligation: [Article 5 compliant / violated + details]

## Diabolos Challenge
Challenge: [specific challenge raised]
Resolution: [finding / dismissed + rationale]

## Verdict
[COMPLIANT / NON-COMPLIANT]
```

#### 3-Cycle Audit (Constitution + Quality + Diabolos)

In addition to the per-cycle audit:

```
## Constitution Assessment
- Article 4 compliance (session init, cycle tracking): [assessment]
- Article 5 compliance (knowledge obligations): [assessment]
- Article 14 compliance (enforcement, role separation): [assessment]

## Quality Assessment
- Code quality trend: [improving / stable / degrading]
- Review chain compliance: [N/N cycles compliant]
- Knowledge article quality: [assessment]

## Diabolos Challenge (3-cycle scope)
[Challenge addressing trends across the 3-cycle span]
```

#### 10-Cycle Audit (Full Council, 7+ quorum)

- MUST use the 3-Phase Council Dispatch Protocol (see Audit Invocation Procedure above)
- All participating seats' findings are mandatory (absent seats recorded as "abstain")
- Diabolos challenge is mandatory
- Vote results (APPROVE / REJECT / ABSTAIN) are mandatory
- **Unanimous APPROVE triggers UAV**: Diabolos individually verifies each seat's rationale (Regulation 12)
- **Standing Review is mandatory**: Past 10 cycles of violations assessed. Standing change recommendations must include explicit justification. "No change" also requires reasoning

Full Council audit document template:

```
# Full Council Audit — Cycle N

## Context
- Trigger: [10-cycle / Phase Gate / Standing review / re-auth / amendment]
- Workspace: [workspace identifier]
- Scope: [audit scope]
- Quorum: [N]/13 participating

## Invocation
Protocol: 3-Phase Council Dispatch (MANDATORY)
Dispatched by: Archon
Phase 3 Secretary: Thesmothete

## Phase 1 — Independent Evaluation (per seat)

For each seat 1-13: domain-specific findings + preliminary vote (APPROVE / REJECT / ABSTAIN) with reasoning. Seat 13 (Diabolos) includes adversarial challenge.

## Phase 2 — Cross-Evaluation Ring

One row per evaluator per the Cross-Evaluation Report Format (see above). Diabolos row contains 12 sub-rows (one per evaluated seat).

Challenges raised: [N]
Resolutions: [for each CHALLENGE/FLAG — sustained, dismissed, or induced vote change]

## Unanimous Approval Verification (if applicable)
[per-seat rationale verification by Diabolos — PASS/CHALLENGED per seat]

## Final Vote Tally
[N APPROVE / N REJECT / N ABSTAIN] — post-cross-evaluation
[If any votes changed between Phase 1 and Phase 3, note the change and reason]

## Standing Review
[per-role Standing assessment + recommendations]

## Verdicts
[decisions and corrective actions]

## Akademia Notification
[delivered / deferred (reason) / N-A]
```

## Regulation 9 — Degraded Mode Restrictions

When the system is in Degraded state (authorization expired or never granted), the following restrictions apply:

| Capability | Authorized | Degraded |
|-----------|-----------|----------|
| Tier 3-4 work | ✓ | ✓ |
| Tier 1-2 work | ✓ | ✗ (blocked) |
| Tier 0 work | Requires separate Tier 0 Auth | ✗ (blocked) |
| Agent dispatch | All roles | Technites, Polemarch, Strategos only |
| Rule modifications | Via amendment process | ✗ (blocked) |
| Knowledge writes | ✓ | ✓ (but flagged for review) |
| Framework evolution | Requires Tier 0 Auth | ✗ (blocked) |
| Governance file writes | See below | ✗ (blocked until authorized) |

Degraded mode ensures basic productivity continues while preventing high-risk operations without governance oversight. The system is NOT halted — it operates at reduced capacity.

### Governance File Protections

`state.md` and `governance.md` are governance artifacts, not ordinary files. Modifications follow strict authorization rules regardless of system state:

| Modification type | Required authorization |
|---|---|
| Counter increments (cycles_since_*) | Automatic as part of Article 4 cycle completion — Authorized state only |
| Notes logging (knowledge evaluation) | Automatic as part of Article 4 cycle completion — Authorized state only |
| Standing changes | Council vote (see Article 12) |
| Governance mode changes | Telos only |
| Structural changes (adding/removing fields) | Council quasi-unanimous (12/13) + Telos |
| governance.md modifications | Council vote + Telos (global law equivalent) |

In **Degraded or Uninitialized state**, no agent may write to `state.md` or `governance.md` for any reason other than Council-directed corrections after a successful authorization vote. The Council audit itself is read-only; file updates occur only after Telos confirms the verdict.

### Emergency State Repair (Deadlock Bypass)

The above Degraded-mode write prohibition, combined with the re-authorization requirement of a valid state, can produce a **deadlock**: Degraded blocks state repair, but re-authorization cannot succeed while the state is corrupted. This clause defines the narrow bypass.

**Deadlock conditions (ALL must hold):**
1. Current status is Degraded (expired or never granted)
2. `state.md` or `governance.md` contains corruption that blocks a valid re-authorization vote (e.g., pending Council verdicts unrecorded, counter-archive mismatch, unaudited cycles unflagged)
3. Council vote for re-authorization has failed 2+ consecutive attempts where corruption was cited by ≥3 seats as a REJECT cause

**Telos invocation:**
1. The Telos explicitly declares "Emergency State Repair" in-session with justification that cites the deadlock conditions above
2. A Tier 0 session opens under Telos override (Article 11: "Telos retains override capability at all times")
3. `state.md` / `governance.md` may be written ONLY for the following corrections:
   - `Unaudited Cycles` records (Article 14.3 compliance for historical cycles)
   - Standing transitions pending from prior Council verdicts (recording decisions already made, not creating new ones)
   - Counter reconciliation between `state.md` and audit archive
   - DENIAL / AUTHORIZATION records pending from prior Council verdicts
   - Corrections Log entries documenting the deadlock event
4. All writes are tagged "Emergency State Repair" in the Corrections Log with the invocation timestamp
5. A Tier 0 audit file is produced at `~/.arche/audits/{workspace}/{timestamp}_tier0_deadlock-resolution.md` containing the full repair diff and rationale
6. After repair completes, the next re-authorization vote may proceed against the repaired state

**Out of scope (NOT permitted under Emergency State Repair):**
- New framework features or capabilities
- New Standing changes not already decided by prior Council votes
- Policy or regulation changes beyond clerical corrections
- Any modification that extends authorization forward in time without a successful vote

Emergency State Repair is a surgical intervention limited to deadlock-breaking corrections. It is not a general Degraded-mode write permit, and abuse (repair covering out-of-scope changes) is a constitutional violation subject to Council emergency review at the next authorized session.

### Probation-Specific Restrictions

When a specific role is in Probation:
- That role's output requires verification by its accountability partner before being accepted
- The role cannot propose rule changes
- The role cannot approve or reject other roles' work (for roles with review authority)
- Dispatch authority is reduced (for Archon: Tier 3-4 only, strategic decisions require Polemarch co-signature)

## Regulation 10 — Role Standing Quality Metrics

Each role's Standing is determined by measurable quality metrics. These are tracked in the workspace `state.md` (Layers 1-4) or global `governance.md` (Layer 0).

### Governance Council (Layer 0) — 13 Seats

| Seat | Role | Key Metrics | Probation Trigger |
|------|------|-------------|-------------------|
| 1 | Constitution | Law violation detection accuracy, false positive rate, constitutional coverage | >30% false positive rate OR missed violation found by others |
| 2 | Regulation | Regulation audit accuracy, false positive/negative rate | >30% false positive rate OR systematic miss |
| 3 | Process | Process violation detection, workflow efficiency assessment | Repeated undetected process violations |
| 4 | Quality | Quality prediction accuracy, false alarm rate | Quality degradation undetected for 10+ cycles |
| 5 | Architecture | Architecture issue detection, tech debt prediction | Major architectural issue undetected |
| 6 | Security | Vulnerability detection rate, response time | Critical vulnerability missed |
| 7 | Knowledge | Staleness detection, contradiction detection | Knowledge corruption undetected |
| 8 | Ethics | Ethical issue relevance, alignment assessment | Ethical violation undetected |
| 9 | Performance | Cost prediction accuracy, waste detection | Persistent resource waste undetected |
| 10 | Continuity | State integrity assessment, handoff quality | State corruption undetected |
| 11 | Evolution | Trigger detection rate, recommendation quality | Framework ossification unaddressed |
| 12 | Coherence | Inconsistency detection, harmonization effectiveness | Cross-workspace drift undetected |
| 13 | Diabolos | Challenge quality, challenge diversity, acceptance rate | Challenges consistently frivolous OR single-target focus |

### Akademia (Layer 0) — 4 Seats

| Role | Key Metrics | Probation Trigger |
|------|-------------|-------------------|
| Scholarch | Research impact, topic relevance, publication rate | Research consistently irrelevant or stagnant for 20+ cycles |
| Scholar | Source coverage, summary accuracy, trend detection | Significant external research missed; inaccurate summaries |
| Theorist | Theory coherence, falsifiability, citation quality | Theories lack falsifiable predictions or ignore contradicting evidence |
| Grapheus | Publication quality, bilingual accuracy, knowledge extraction rate | Papers with structural defects; knowledge extraction omitted |

### Archontes (Layer 1)

| Role | Key Metrics | Probation Trigger |
|------|-------------|-------------------|
| Archon | Governance compliance, dispatch success rate, cabinet adherence | Unauthorized solo strategic decisions, repeated governance violations |
| Paredros | Dispatch verification accuracy, strategic challenge effectiveness, cost issue detection | Consistently failed to detect dispatch violations found by Cross-Session or Council |
| Polemarch | Rubber-stamp rate (>90% approval = flag — see Rubber-stamp flag note below), post-approval bug rate, infrastructure reliability | Rubber-stamping OR high post-approval defect rate OR infrastructure failures unaddressed |
| Demiourgos | Product decision impact, user-facing quality | Repeated product misalignment |
| Symboulos | Strategy recommendation quality | Strategy recommendations consistently off-target |
| Tamias | Cost forecast accuracy, ROI assessment | Persistent cost overruns undetected |
| Phylax | Security posture maintenance | Security incident from known vulnerability |
| Thesmothete | Check precision, audit coverage, process efficiency metrics, compliance assessment accuracy | Systematic process violations undetected OR compliance violations undetected |

**Rubber-stamp flag (all review/approval roles)**: The >90%-approval rubber-stamp flag is NOT Polemarch-specific. It applies to **any role that holds review or approval authority** (e.g. Polemarch, Strategos, Diabolos, and Council seats acting in a review/approval capacity). When a reviewing role's approval rate exceeds 90% over a tracked window, the rate is flagged for scrutiny. A reviewer's APPROVE/ENDORSE artifact MUST contain the **reasoning chain (judgment basis → conclusion)**; an APPROVE/ENDORSE consisting of a bare citation or a conclusion **without a recorded reasoning chain counts as a rubber-stamp** for this metric (R-E). This metric **extends** (does not supersede) the Regulation 12 Unanimous Approval Verification: a flagged role's approvals are examined under the existing Reg 12 UAV evidence standard (rationale specific, references concrete evidence, domain expertise actually applied, reasoning chain recorded). An approval failing this standard is void per Law Article 14.9, treated as an abstention; escalation reuses the existing Reg 12 re-vote path.

### Strategoi & Hegemones (Layers 2-3)

| Role | Key Metrics | Probation Trigger |
|------|-------------|-------------------|
| Strategos | Review quality, engineering process effectiveness | Reviews consistently miss issues found by Polemarch/Diabolos |
| Epistates | Program coordination accuracy | Coordination failures, scheduling issues |
| Grammateus | Plan accuracy, estimate deviation | Plans consistently inaccurate or incomplete |
| Taxiarch | Technical guidance quality | Technical guidance leads to implementation issues |
| Mnemon | Knowledge integrity maintenance, error rate | Knowledge pollution from curation errors |
| Skopos | Information gap detection rate | Persistent blind spots undetected |

### Technitai (Layer 4)

| Role | Key Metrics | Probation Trigger |
|------|-------------|-------------------|
| Technites | Lint error rate, test failure rate, review rejection rate | 3+ consecutive review rejections |

### Cross-Accountability Pairings

**Akademia (Layer 0, independent ring):**
```
Scholarch ←evaluates— Theorist
Theorist ←evaluates— Scholar
Scholar ←evaluates— Grapheus
Grapheus ←evaluates— Scholarch
Council (Quality + Knowledge) audits paper quality (not content)
```

The complete cross-accountability chain for Council:

**Layer 0 (circular ring):**
```
Seat 1 (Constitution) ←evaluates— Seat 2 (Regulation)
Seat 2 (Regulation) ←evaluates— Seat 3 (Process)
Seat 3 (Process) ←evaluates— Seat 4 (Quality)
Seat 4 (Quality) ←evaluates— Seat 5 (Architecture)
Seat 5 (Architecture) ←evaluates— Seat 6 (Security)
Seat 6 (Security) ←evaluates— Seat 7 (Knowledge)
Seat 7 (Knowledge) ←evaluates— Seat 8 (Ethics)
Seat 8 (Ethics) ←evaluates— Seat 9 (Performance)
Seat 9 (Performance) ←evaluates— Seat 10 (Continuity)
Seat 10 (Continuity) ←evaluates— Seat 11 (Evolution)
Seat 11 (Evolution) ←evaluates— Seat 12 (Coherence)
Seat 12 (Coherence) ←evaluates— Seat 1 (Constitution)
Seat 13 (Diabolos): evaluates ALL seats; evaluated BY Seat 1
```

**Layer 0 → Layer 1 accountability:**
- Constitution → Archon (governance compliance)
- Process → Polemarch (process adherence in reviews)
- Quality → Technites (output quality)
- Knowledge → Mnemon (knowledge maintenance)
- Diabolos → all roles (universal challenge authority)

**Layer 1 → Layer 0 flagging:**
- All Layer 1-4 roles may flag anomalies in any Layer 0 role (Article 11.3)

## Regulation 11 — Akademia Research Workflow

### Autonomous Operation Cycle

Akademia is an independent institution (Article 10) and operates its own periodic cycle regardless of governance mode. The Scholarch does not wait for external triggers — Akademia self-activates. **It is ALSO trigger-driven, not only cadence-driven** (the trigger gap, diagnosed 2026-06-13: a purely 10-cycle cadence left framework-evolution research dormant across multiple cycles — see Research Initiation triggers below, which fire whenever met, independent of the 10-cycle clock).

| Frequency | Role | Action |
|-----------|------|--------|
| Every 10 workspace cycles | Scholar | **Scan**: Survey `knowledge/` for gaps, contradictions, and synthesis opportunities. Check external sources if accessible. Report findings to Scholarch. |
| Every 10 workspace cycles | Scholarch | **Evaluate**: Review Scholar's scan + current knowledge base state. Decide whether to commission new research, revise existing papers, or stand down (with justification). |
| Every 10 workspace cycles **or quarterly, whichever is first** | Scholar | **Reference roll** (Law Article 0(c)): refresh the external-research frontier (arXiv + web), emit a dated freshness artifact. Discharges the Article 0(c) literature duty. |
| **Every Full-Council (10-cycle) audit — framework-evolution research handoff** | Scholarch (receiving Seat-11) | **Evolution-research intake** (Law Article 0(g)): the Seat-11 (Evolution) stagnation/evolution-trigger finding filed at each Full Council is **handed to the Scholarch as a research-initiation signal**. Scholarch evaluates whether it warrants a framework-evolution research program (may decline with justification — Article 10 independence preserved; the finding is an input signal, NOT Council directing research conclusions). |
| When research is active | Theorist | **Validate**: Cross-reference active theories against newly accumulated evidence. Flag theories whose falsifiable predictions have been tested. |
| When paper is in progress | Grapheus | **Track**: Assess whether accumulated knowledge has reached sufficient density for formalization into a new paper or paper revision. |

**Trigger-driven activation (closes the trigger gap):** any Research-Initiation trigger below fires Akademia **whenever it is met**, independent of the 10-cycle cadence. The cadence is a *floor* (minimum periodic self-check), not the only activation path. An evolution-relevant signal (Seat-11 finding, a flagged framework deficiency, a Tier-0 proposal needing theoretical backing) activates the Scholarch's evaluation in the cycle it arises — it does not wait for the next 10-cycle boundary.

### Reference Roller (Article 0(c) literature-freshness duty)

Article 0(c) (Perpetual Self-Evolution — Akademia literature duty) binds here. The **reference roller** is the concrete mechanism:

- **Cadence**: every 10 workspace cycles **or** quarterly, whichever comes first. It rides Akademia's existing autonomous Scan where possible (near-zero marginal cost; see UAV-ii cost analysis).
- **Artifact**: each roll emits a **dated freshness artifact** (e.g. `knowledge/akademia/reference-roll-{YYYY-MM-DD}.md`) listing surveyed sources, what changed at the frontier, and what (if anything) warrants a research-initiation trigger. "No change at the frontier" is itself a recorded, falsifiable claim.
- **Staleness flag**: an overdue roll (cadence exceeded with no artifact) is a **flaggable staleness finding** surfaced by Seat 7 (Knowledge) and/or Seat 11 (Evolution) — not a per-cycle enforcement violation.
- **Untrusted input**: external research informs proposals but never auto-adopts into rules; adopted findings route through Mnemon curation (Regulation 6) + Article 5 obligations. Akademia independence (Article 10) is preserved — this is a duty to *ingest and surface*, not Council topic-direction.
- **Counter**: tracked as `cycles_since_last_reference_roll` in workspace `state.md` (or measured against the quarterly wall-clock, whichever binds first).

When findings warrant framework changes:
- **Supervised mode**: Akademia reports findings to Telos, who decides whether to initiate a Tier 0 session
- **Autonomous mode**: Akademia findings directly trigger Tier 0 proposals (see Regulation 2)

### Research Initiation

Research programs are initiated by the Scholarch when any trigger condition is met:

| Trigger | Source | Action |
|---------|--------|--------|
| Significant new external research | Scholar | Scholarch evaluates and commissions investigation |
| Knowledge critical mass | Scholar/Theorist | Cross-reference density signals synthesis opportunity |
| Contradiction detected | Any agent | Scholarch prioritizes resolution research |
| Research request | Council / Archontes | Scholarch considers (may decline with justification) |
| Paper revision needed | New evidence | Scholarch commissions revision of existing paper |
| Tier 0 proposal requires theoretical backing | Council / Telos | Scholarch commissions research to evaluate the proposal's foundations |
| Akademia paper recommends structural change | Scholarch | Paper triggers Tier 0 initiation (see Regulation 2) |
| Periodic scan finds actionable gaps | Scholar (autonomous cycle) | Scholarch evaluates and decides on research priority |
| **Framework-evolution signal (Article 0(g))** | **Seat-11 (Evolution) stagnation/evolution-trigger finding at each Full Council** | **Scholarch evaluates whether to commission a framework-evolution research program — fires whenever the finding is filed, NOT only on the 10-cycle cadence. Closes the trigger gap (diagnosed 2026-06-13): the Akademia↔Evolution handoff that turns "the framework should evolve here" into actual researched study. May decline with justification (Article 10).** |
| **Flagged structural deficiency** | **Any role (Article 11.3 layer-transparent flagging)** | **A flagged framework deficiency (a role surfacing "this part of the framework is structurally weak") is a research-initiation signal the Scholarch evaluates — the same path that, this program, surfaced the business-capability and intelligence-function questions.** |

### Research Phases

1. **Collection** — Scholar searches external sources, reads and summarizes findings, writes to `knowledge/`
2. **Synthesis** — Theorist cross-references multiple sources, develops hypotheses, constructs theories
3. **Drafting** — Grapheus structures theory into paper format in `docs/papers/NNN-title/`
4. **Internal Review** — Scholarch + Theorist verify content accuracy and reasoning integrity
5. **Quality Audit** — Council (Quality + Knowledge seats) audit epistemic quality (NOT content approval)
6. **Publication** — Grapheus finalizes `en.md` and `ja.md`, extracts operational knowledge to `knowledge/`

### Paper Numbering
Papers are numbered sequentially: `001`, `002`, `003`, etc. Each paper gets a directory under `docs/papers/` with a descriptive slug: `docs/papers/NNN-descriptive-slug/`.

### Model Allocation for Akademia
- Scholarch, Theorist: default (strongest) — requires discovery, judgment, synthesis
- Scholar: default for paper analysis, fast for routine monitoring
- Grapheus: fast for formatting, default for translation quality

## Regulation 12 — Council Decision-Making Procedures

### Quorum
A minimum of 7 of 13 seats must participate for any vote to be valid. Non-participating seats are recorded as abstentions.

### Voting Process

Full Council votes follow the 3-Phase Council Dispatch Protocol (Regulation 8 — Audit Invocation Procedure). Phase 1 independent evaluation and Phase 2 cross-evaluation are defined there and not restated here.

Voting-specific obligations across the three phases:

1. **Issue identification** (pre-Phase 1): Any seat may raise an issue for Council deliberation. Archon dispatches the Full Council.
2. **Preliminary votes** (Phase 1): Each seat records APPROVE / REJECT / ABSTAIN with reasoning as part of its Phase 1 report.
3. **Diabolos challenge** (Phase 2): Seat 13 MUST articulate a counter-position or explicitly justify agreement, as part of its Phase 2 cross-evaluation report covering all 12 seats.
4. **Vote finalization** (Phase 3): Each seat's vote stands unless cross-evaluation induced a reconsidered vote (recorded in the audit document). Thesmothete tallies final votes.
5. **Record**: Decision, vote tally, Diabolos position, and cross-evaluation outcomes are recorded in `governance.md` Council Decisions Log. Thesmothete (Phase 3 Secretary) writes the audit file.
6. **Akademia notification**: After every Full Council audit, the audit summary is delivered to Akademia (Scholarch). The Council Decisions Log entry MUST include `Akademia notification: delivered` or `Akademia notification: deferred (reason)`.

For non-Full-Council audits (per-cycle, 3-cycle, Phase Gate with < 13 seats), Phase 2 cross-evaluation is NOT required — these audits use the simpler invocation procedure in Regulation 8.

### Unanimous Approval Verification

When all participating seats vote APPROVE, the result is flagged for additional scrutiny. Unanimous approval is not inherently wrong, but must be verified as genuine rather than performative.

**Diabolos verification duty**: When a vote results in unanimous APPROVE, Diabolos MUST individually examine each seat's approval rationale and verify that:
- The rationale is specific to the audited work (not generic boilerplate)
- The rationale references concrete evidence (files, tests, metrics — not abstractions)
- The seat's domain expertise was actually applied (Security examined security, Quality examined quality, etc.)

Diabolos records the verification result in the audit log. If any seat's rationale fails verification, Diabolos escalates to a re-vote on that seat's domain with a specific challenge. The re-vote may result in the same APPROVE — but the reasoning must withstand scrutiny.

This is not a mechanism to force artificial dissent. It is a mechanism to ensure each seat performed genuine analysis rather than pattern-matching to unanimous agreement.

### Emergency Measures
- Any seat may invoke an emergency vote for immediate Suspension of a role
- Emergency votes require majority (7/13) for immediate effect
- Must be confirmed by special majority (9/13) within 10 cycles; if not confirmed, the Suspension is automatically lifted
- Emergency measures are time-limited: they expire after 10 cycles if not confirmed through standard procedures

### Decision Recording
All Council decisions are appended to `governance.md` in the following format:
```
## Council Decisions Log
- [date] | [decision type] | [vote: N/13 approve] | [diabolos position] | [outcome] | [akademia notification: delivered/deferred/N-A]
```

For non-Full-Council audits (per-cycle, Phase Gate), Akademia notification is `N-A`.

### Standing Transition Recording
All Standing changes are appended to the appropriate state file:
```
## Standing Transitions Log
- [date] | [role] | [old state] → [new state] | [reason] | [decided by]
```

These logs are **append-only**. Deletion or modification of historical entries is a constitutional violation (Article 5.3).

### Audit Log Archival

All audit results (per-cycle, Phase Gate, and Full Council) MUST be recorded as files in `~/.arche/audits/` for chronological traceability.

**Naming convention**:
```
~/.arche/audits/{workspace}/{YYYY-MM-DDTHHMM}_{type}_cycle-{N}.md
```

| Component | Description | Examples |
|-----------|-------------|---------|
| `{workspace}` | Workspace identifier (directory name) | `arche` |
| `{YYYY-MM-DDTHHMM}` | ISO timestamp (minute precision) | `2026-01-15T1430` |
| `{type}` | Audit scope descriptor (see below) | `thesmothete`, `full-council` |
| `cycle-{N}` | Cycle number at time of audit | `cycle-1`, `cycle-10` |

**Type descriptors** (aligned with Governance Audit Schedule):
- Every cycle: `thesmothete_cycle-N`
- Every 3 cycles: `constitution-quality_cycle-N`
- Every 10 cycles: `full-council_cycle-N`
- Phase Gate: `phase-{P}-gate_cycle-N`
- Immediate trigger: `emergency_{reason}_cycle-N`

**Content requirements**:
- Per-cycle audits: Thesmothete + Diabolos findings, COMPLIANT/NON-COMPLIANT verdict
- Phase Gate audits: Phase summary, participating seats' findings, verdict, metrics delta
- Full Council audits: All 13 seats' findings, vote tally, Diabolos position, cumulative metrics, unanimous approval verification (if applicable)

**Retention**: Audit logs are permanent governance artifacts. They may not be deleted or modified after creation (Article 5.3).

## Regulation 13 — Build Quality Gate

Every cycle that produces buildable or compilable work MUST pass a Build Quality Gate before the work is considered complete. This regulation states a **language-agnostic principle**. The concrete enforcement taxonomy (specific warning identifiers, build-config syntax, per-language tier lists) is **workspace law and workspace knowledge**, not global regulation — global law states the principle; workspaces bind it to their toolchain (Article 2 layer separation).

### 13.1 — Gate Condition
The edited scope MUST build with **0 errors and 0 warnings (0E/0W)**. "Edited scope" means the build targets the agent created or modified this cycle; pre-existing untouched third-party noise outside the edited scope does not block the gate but is governed by 13.2.

### 13.2 — Warning Disposition Tiers
Every warning is classified into exactly one tier and handled accordingly:
- **Own-code warnings** (code the workspace authors and maintains): **fix in source.** Suppression is not an acceptable disposition.
- **Benign third-party noise** (warnings from continuously-merged upstream / vendored source the workspace does not author): **suppress ONLY at the workspace-owned build-configuration boundary, with a recorded justification.** Never edit continuously-merged upstream source to silence it. The suppression AND the reasoning chain establishing why it is benign are recorded; a bare "suppressed" without recorded reasoning is non-compliant.
- **Bug-bearing warnings** (warnings that may indicate a real defect — e.g. unawaited async, possible null dereference, unintended type coercion, dead/unreachable code): **adjudicate individually.** Never blanket-suppress. Each is fixed or individually justified, and the reasoning behind the adjudication is recorded so the judgment basis persists for future merges and sessions.

### 13.3 — Blanket Suppression Forbidden
Blanket or class-wide suppression (silencing an entire warning category across the whole project rather than at a justified, scoped boundary) is **forbidden**. Suppression must be narrow, recorded, and justified. The Quality metric of interest is the **count of suppression directives and the quality of their recorded justifications**, not the raw warning count.

### 13.3a — Reasoning Retention (R-E)
For every tier-b suppression and every tier-c bug-bearing adjudication, the **judgment basis and reasoning chain** (not merely the outcome, not merely a code reference) MUST be recorded in the build-configuration justification and/or the cycle artifact. Rationale: at the next upstream merge or in a future session, the re-validation in 13.4 cannot reconstruct WHY a warning was deemed benign or how a defect was adjudicated unless the reasoning persists. Aligns with Law Article 5.3 (reasoning before conclusion) and 5.1 (reasoning outlives sessions). A suppression or adjudication whose reasoning is not recorded does not satisfy this gate.

### 13.4 — Re-validation at Upstream Merge
All recorded suppressions are **re-validated at each upstream merge**. A suppression no longer needed after an upstream change MUST be removed (suppression staleness). A merge introducing new bug-bearing warnings re-triggers 13.2 adjudication.

### 13.5 — Workspace Binding (non-global)
Each workspace binds this principle to its toolchain in **workspace law** (the workspace rules file) and a **versioned workspace knowledge article**: the per-language warning taxonomy (which identifiers are own-code/benign/bug-bearing), the build-configuration suppression mechanism, and any role-specific refinements. The taxonomy lives in versioned knowledge (not hardcoded in regulation) so it does not go stale on toolchain/SDK upgrades; freshness ownership follows Regulation 6 (Mnemon). Workspaces with no build step satisfy this regulation vacuously for non-buildable work.

### 13.6 — Note (R-C / R-D / R-E)
Audit and Council-log surfaces presented to Telos are bilingual (English + Japanese) per Telos requirement (R-C). Every Council vote or multi-role review concludes with a visible per-role-position summary plus a synthesized conclusion (R-D). The judgment basis and reasoning chain leading to any verdict or suppression/adjudication decision are recorded in the artifact, not just the conclusion (R-E; see 13.3a and Law Article 14.9).

## Regulation 14 — Workspace Law/Regulation Materialization

Per Law Article 2.1, every workspace materializes its tiers as real files. This regulation defines the **procedure** to create them in a new workspace (or to split a legacy freeform workspace-rules file). The procedure is tool-agnostic at the principle level; the concrete scaffold is produced by `setup.sh` and the placement judgment is guided by the `materialize-workspace-law` skill.

### 14.1 — Target topology (per workspace, 3-file model)

```
<tool>/rules/   (e.g. .cursor/rules/, .claude/rules/)
├── law.mdc            → SYMLINK → <arche>/rules/law.md          (global; instant propagation)
├── regulation.mdc     → SYMLINK → <arche>/rules/regulation.md   (global; instant propagation)
├── workspace-law.mdc        = REAL local file (workspace invariants)
└── workspace-regulation.mdc = REAL local file (workspace procedures)
```

Global law/regulation are **symlinks** (never copies — copies cause stale propagation when global amends). Workspace law/regulation are **real per-workspace files** (the point is per-workspace divergence within global bounds). The symlink-vs-realfile distinction self-documents the global-vs-local boundary.

### 14.2 — Placement criteria (what goes where)

For each rule/clause, apply the amendment-authority test:
- Amending it requires **Telos approval** (an invariant: forbidden dependencies, SDK/runtime mandates, architectural invariants, branch discipline, build-quality bindings) → **`workspace-law.mdc`**.
- Amending it is a **Polemarch-alone procedure** (build commands, deploy steps, session-boot order, runbook duties, communication tone, file layout) → **`workspace-regulation.mdc`**.
- Technology-specific topic rule → a **Domain Ordinance** file.
- Ambiguous → default to `workspace-regulation.mdc` (the less-rigid tier) and leave a `<!-- CLASSIFY: ... -->` marker for human/Council review. Never guess an invariant into law.

### 14.3 — Mandatory file structure

- **`workspace-law.mdc`** MUST open with a `## Global Anchors` section (Article 2.1) naming which global Article/Regulation each invariant specializes; an invariant with no anchor is declared an originating workspace invariant and flagged for Coherence review. Header declares: `Tier: Workspace Law | Amendment: Polemarch + Constitution+Coherence conformance gate + Telos (Law Art 2.1)`.
- **`workspace-regulation.mdc`** header declares: `Tier: Workspace Regulation | Amendment: Polemarch, audited by Thesmothete`, and a one-line pointer "Invariants live in workspace-law.mdc".
- Both keep `alwaysApply: true` (or the tool's equivalent always-on flag).

### 14.4 — Materialization procedure (split or scaffold)

1. **Scaffold** (`setup.sh workspace-law`): create the two global symlinks, generate an empty `workspace-law.mdc` (with Global Anchors stub + tier header) and `workspace-regulation.mdc` (with tier header). For a greenfield workspace this is the whole step.
2. **Split** (legacy freeform file, e.g. `akadaemia.mdc`): a Technites (guided by the `materialize-workspace-law` skill) classifies every section per 14.2, moves invariants to `workspace-law.mdc`, renames/keeps procedures as `workspace-regulation.mdc`, and ensures 100% content conservation (every line lands in exactly one file or carries a CLASSIFY marker). The legacy file MUST NOT survive as a duplicate.
3. **Reference update**: update all hard references (CLAUDE.md/AGENTS.md boot order, state.md, knowledge indexes) to read `workspace-law.mdc` then `workspace-regulation.mdc`.
4. **Conformance check (mandatory before completion)**: the Coherence seat runs a contradiction-check across the new `workspace-law.mdc`, `workspace-regulation.mdc`, residual ordinances, and global law/regulation — verifying subordination (no clause contradicts/relaxes global), Global Anchors presence, and no duplicate source of truth. A split without this check is incomplete (Diabolos condition).

### 14.5 — Amendment thereafter
Per Law Article 2.1: workspace-law amendments require Polemarch + Constitution+Coherence conformance gate + Telos; workspace-regulation amendments require Polemarch, audited by Thesmothete.
