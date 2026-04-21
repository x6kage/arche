# Agent Coordination Patterns

**Last Updated**: 2026-04-21
**Confidence**: High (validated through 40+ audit cycles across multiple multi-agent workspaces)
**Summary**: How to split work across AI subagents without conflicts, with optimal model allocation and governance-aware coordination.

## Context

Multi-agent workflows introduce concurrency risks: write conflicts, duplicated work, context starvation, and — most subtly — consensus collapse where agents converge on a wrong answer because each trusts the others. These patterns prevent the most common failure modes and are derived from real governance operation, not theoretical modeling.

## Core Rules

### 1. No Write Scope Overlap

Two write-capable subagents must NEVER modify the same file. If uncertain, assume overlap and serialize. File ownership must be explicit in every dispatch prompt.

### 2. Demand-Pull Knowledge

Don't put all context in every subagent prompt. Give enough for the specific task + tell them where to find more if needed. Full-context prompts inflate cost and often bury the signal the subagent actually needs.

### 3. Model Allocation Strategy

| Role Type | Model Tier | Why |
|---|---|---|
| Strategic planning / Orchestration | Strongest available | Needs deep reasoning, judgment |
| Investigation / Root cause analysis | Strongest available | Needs hypothesis generation, evidence evaluation |
| Implementation (clear spec) | Fast | Pattern following, no discovery needed |
| Review / Quality check | Strongest available | Needs judgment about correctness |
| Mechanical tasks (rename, format) | Fast | Pure pattern execution |
| Adversarial challenge | Strongest available | Needs to find what others missed |

### 4. Single Writer for Shared State

Designate exactly ONE subagent to write shared state files. No other subagent touches these. Prevents race conditions on governance, tracking, and state files. The single-writer rule is cheaper than any locking scheme and scales indefinitely.

## Parallelization Patterns

### Safe Parallel (No Dependencies)

- Building different modules simultaneously
- Reviewing different files simultaneously
- Creating knowledge articles for different topics
- Independent evaluation of a shared artifact by N reviewers (each writes their own report)

### Must Serialize (Dependencies)

- Plan creation → Implementation (plan must exist first)
- Implementation → Review (code must exist first)
- Any two agents writing to the same file
- Synthesis of independent reports (aggregator must run after all reports land)

### Partial Parallel (Careful Scoping)

- Multiple agents working simultaneously IF each owns exactly its own file set
- Multiple research agents reading overlapping code (read-only is always safe)

## Coordination Architecture Patterns

### Cabinet Consultation (Avoid Decision Concentration)

A single orchestrator making all decisions becomes a bottleneck and a single point of failure. Better: the orchestrator dispatches domain-specific consultations before deciding.

- Cost concerns → dispatch a cost-analyst agent
- Security concerns → dispatch a security-review agent
- Knowledge implications → dispatch a knowledge-operations agent
- Architectural implications → dispatch an architect agent

The orchestrator synthesizes cabinet input into a single decision, but the inputs are independent. This pattern trades a small dispatch overhead for dramatically better decision quality on cross-domain calls, and it distributes auditability.

**Failure mode if omitted**: the orchestrator rationalizes decisions in its own domain comfort zone and misses domain-specific risks. Observed repeatedly across governance failures; the remedy is structural (dispatch matrix), not exhortative.

### Ring Cross-Accountability (Avoid Groupthink)

When N agents evaluate the same artifact, a flat voting structure collapses into consensus bias — each agent trusts the others' surface agreement. Better: arrange evaluators in a ring, where each evaluator's report is cross-evaluated by exactly one peer.

- Phase 1: each evaluator independently produces a report
- Phase 2: each evaluator reads and critiques one specific peer's report (ring mapping)
- Phase 3: a neutral aggregator synthesizes votes, flagging any vote that changed between Phase 1 and Phase 2

**Observed effect**: in real governance operation, 3-phase dispatch produces vote changes on 15-30% of decisions vs. single-round voting. The changed votes correlate strongly with later correctness checks, suggesting the cross-evaluation surfaces genuine defects that flat voting misses.

**Why the ring works**: each agent's Phase-1 verdict is a lower-stakes commitment than a final vote, so agents can revise without losing face. The forced adversarial pairing prevents the "everyone nods at the loudest voice" failure mode.

### Peer-Level vs. Subordinate Challenge

A real-time monitor that reports to the orchestrator it is monitoring cannot function — the power asymmetry suppresses challenges. Monitors must be structural peers of the entity they observe, reporting to a higher authority (in governance systems, typically the principal/founder).

**Test**: if agent A can alter agent B's capabilities or standing, A cannot be B's effective challenger. Solution: B reports to C (higher), not A.

### Dispatch Matrix as Anti-Discretion

"The orchestrator may dispatch X when the orchestrator judges it necessary" is an anti-pattern. Under cost or time pressure, discretion always erodes toward the cheaper option, and dispatch obligations get skipped on exactly the cases that most needed them.

**Better**: a deterministic dispatch matrix that makes the required dispatches non-negotiable based on observable conditions (work tier, risk class, cycle number). Discretion is preserved only for edge cases explicitly marked "consult before override."

**Observed pattern**: discretionary dispatch rules are violated in 30-50% of cycles under sustained pressure. Matrix-based rules are violated in <5% of cycles because violation is visibly mechanical rather than judgment-shaped.

### Information Flatness vs. Authority Hierarchy

Separate two concerns that are often conflated:

- **Authority** (who decides): hierarchical, top-down, necessary for speed and accountability
- **Information** (who knows): flat, peer-to-peer, necessary for accuracy

Flat information + hierarchical authority is the only stable combination. Flat both collapses into consensus paralysis. Hierarchical both produces the "chief of staff filters reality" failure mode where decisions are made on degraded summaries.

Practical implementation: every agent has equal read access to all durable state; only designated agents can write specific files; decisions are made by role, not by information asymmetry.

### Cycle-Based Synchronization

Time-based cadences (every N hours) assume steady throughput. Multi-agent systems have bursty workloads — sometimes 5 cycles in an hour, sometimes 1 cycle in a day. Cycle-based triggers (every N cycles) adapt naturally to workload and produce predictable audit density.

**Rule**: express all audit, review, and knowledge-consolidation cadences in cycles, not wall-clock time. The only time-based rule that makes sense is an authorization sunset (safety property independent of work volume).

### Role Standing as Coordination Signal

When an agent's output quality can be flagged by peers (Probation / Suspended states), downstream agents can use that signal to decide how much to trust the output. This is a coordination mechanism, not just a punishment mechanism:

- Agent A in Probation → downstream agents require co-signature before accepting A's output
- Agent A Suspended → downstream agents ignore A's output entirely and escalate the gap

Standing is part of the coordination protocol, not separate from it.

### Typed Artifacts vs. Silent Handoff

"The next agent will know what to do because I told the orchestrator verbally" is an anti-pattern. Handoffs between agents — especially across sessions — must go through typed, durable artifacts: structured files with fixed sections, predictable paths, and explicit status fields.

**Why**: conversational handoffs lose information at every hop (speaker's context vs. listener's context). Typed artifacts are lossy only at the original author's encoding step; every subsequent reader gets the same message.

Observed rule of thumb: any decision that must survive a session boundary must be encoded in a typed artifact before the session ends. If it only exists in conversation, it is effectively lost.

## Failure Modes

| Failure | Cause | Prevention |
|---|---|---|
| Agent writes wrong file | Scope ambiguity in prompt | Explicit file list in every prompt |
| Agent duplicates work | Doesn't know other agent exists | Include "other agents are handling X" |
| Agent blocked waiting | Serial dependency not identified | Map dependencies before launching |
| Agent produces garbage | Insufficient context | Detailed prompts with inline references |
| Consensus collapse (all agree, all wrong) | Flat voting, no adversarial pairing | Ring cross-accountability + explicit Adversary role |
| Decision bottleneck at orchestrator | No cabinet consultation | Dispatch domain specialists before deciding |
| Silent rule erosion under pressure | Discretionary dispatch rules | Deterministic dispatch matrix |
| Challenge suppression | Monitor reports to monitored entity | Peer-level monitoring with independent reporting line |
| Cross-session state loss | Verbal/context-only handoff | Typed artifacts with fixed structure |
| Audit storm (too many audits) | Time-based cadence on bursty work | Cycle-based cadence |
| Trusted wrong agent | No standing signal | Universal role standing visible to all peers |

## Dispatch Sizing Heuristics

- **1 agent**: single author on a well-scoped task; always acceptable
- **2-3 agents**: author + reviewer, or two independent investigators; minimal coordination cost
- **4-7 agents**: cabinet consultation; orchestrator synthesizes; still tractable
- **8-13 agents**: full council / broad review; requires ring mapping or it collapses into consensus
- **14+ agents**: orchestration overhead exceeds benefit; aggregate in layers (subcouncils that each send one delegate)

If you find yourself wanting more than 13 parallel agents, the right move is almost always to split the work into phases rather than widen parallelism.

## Falsifiable Predictions

- Explicit file-ownership in prompts reduces write conflicts to near-zero on parallel dispatches
- Demand-pull context reduces prompt size by >40% vs. full-context prompts with <10% re-work rate
- Ring cross-accountability produces vote changes on >10% of decisions where single-round voting would have agreed; the changed votes correlate with later correctness checks
- Discretionary dispatch rules are violated at >5x the rate of matrix-based dispatch rules under sustained cost pressure
- Monitor agents that report to the entity they monitor raise <20% of the challenges raised by structurally peer monitors
- Decisions made without cabinet consultation have >2x the post-hoc revision rate of cabinet-informed decisions on cross-domain work
- Cross-session handoffs without typed artifacts lose recoverable context on >30% of handoffs; artifact-based handoffs lose <5%

## Corrections Log

| Date | Correction |
|---|---|
| 2026-04-12 | Initial creation |
| 2026-04-14 | Role names updated per polis governance model |
| 2026-04-17 | Generalized: removed project-specific references, model names, added falsifiable predictions |
| 2026-04-21 | Expanded with cabinet consultation, ring cross-accountability, peer-vs-subordinate challenge, dispatch matrix vs. discretion, information flatness, cycle-based sync, role standing as signal, typed artifacts, dispatch sizing. Grounded in 40+ audit cycles of observation. |
