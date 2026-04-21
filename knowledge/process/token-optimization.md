# Token Optimization Strategies

**Last Updated**: 2026-04-21
**Confidence**: High (cost verified through real multi-agent governance usage across 40+ audit cycles)
**Summary**: Practical strategies to minimize token waste while maintaining output quality in multi-agent AI workflows.

## Context

Token cost scales with model strength, call volume, and context length. In a multi-agent system, the dominant waste categories are:

1. **Model misallocation** — strong models on mechanical work
2. **Re-derivation** — re-computing knowledge that already exists in writing
3. **Context bloat** — pasting whole files when a ranged read would suffice
4. **Orchestration overhead** — subagent dispatch for work that fits in the current context
5. **Hidden compaction tax** — long sessions force summarization, which degrades recent decisions

These patterns apply to any multi-agent AI workflow, not just Arche. The numbers below are observed from real operation; absolute values will differ by provider and model version, but ratios are stable.

## High-Impact Optimizations

### 1. Model Selection (Biggest Impact)

- Fast model for implementation tasks saves 90%+ vs. default/strongest model
- Reserve strong models for: investigation, planning, review, cross-domain judgment, and adversarial challenge
- Mechanical tasks (file creation, rename, formatting, deterministic transforms) never need strong models
- The 90% fast-model target is **per Task-dispatched token**, not per wall-clock second

**Observed**: Full Council audits (13 seats × strong model) cost ~100k tokens; equivalent work on fast model costs ~15k tokens. Fast-model council verdicts match strong-model verdicts on routine audits; strong models only pay off on genuinely novel or contested judgments.

### 2. Inter-Agent Communication Language

- Agents communicate in English regardless of user-facing language
- English is ~30% fewer tokens than Japanese/Chinese/Korean for equivalent content
- User-facing output in user's language; everything else in English
- Do not translate artifacts between agents — translate only at the user boundary

### 3. Knowledge Base (Read Before Re-derive)

- Reading a 200-line knowledge article: ~300 tokens
- Re-deriving the same knowledge from scratch: ~3,000-10,000 tokens in reasoning
- **10-30x token savings per lookup**, compounded across every future session that hits the same topic
- Writing an article costs ~3-5k tokens once; lookups amortize that within 2-3 uses

The most expensive token is the one spent re-deriving what was already known.

### 4. Targeted File Reading

- Grep + Read ±20 lines: ~200 tokens
- Reading entire 1,000-line file: ~3,000 tokens
- SemanticSearch for "how does X work": ~500 tokens + relevant results
- For files >500 lines, default to grep-then-read unless you genuinely need the whole file (e.g., translation, full refactor)

### 5. Subagent Prompt Scoping

- Include exactly what's needed, nothing more
- Don't paste entire files when only 10 lines are relevant
- But DO include enough context — too little causes re-work, which is more expensive than over-inclusion
- The cheapest prompt is the one that gets a correct answer on the first try; under-scoping usually costs 2-3x re-dispatch

### 6. Dispatch vs. Direct Read

- Subagent dispatch has fixed overhead: ~1-2k tokens for prompt + init + result parsing
- For work the parent agent can do in a single Read, dispatching a subagent is pure loss
- Dispatch when: (a) parallelism gives real wall-clock win, (b) isolation protects parent context from pollution, (c) the subagent can use a weaker model than the parent
- Do not dispatch when: single file lookup, trivial edit, work already in parent's context

### 7. Early-Termination Patterns

- Embed halt conditions in subagent prompts: "stop as soon as X is confirmed; do not continue exploring"
- Without halt conditions, subagents tend to over-explore for thoroughness, costing 2-5x more than needed
- Example: "find the function named `foo`, return its file+line, stop" vs. "investigate `foo` thoroughly"

### 8. Governance Fixed Cost vs. Implementation Variable Cost

Governance has a fixed per-cycle overhead (audits, handoffs, logs) that does not scale down with trivial work. Observed:

| Work tier | Implementation cost | Governance cost | Ratio (impl : gov) |
|---|---|---|---|
| Tier 1-2 (feature work) | 50k-150k | 25k-35k | healthy ~70:30 |
| Tier 3 (multi-phase) | 10k-30k | 25k-35k | borderline 40:60 |
| Tier 4 (trivial fix) | 1k-5k | 25k-35k | inverted ~15:85 |

When implementation cost falls below governance fixed cost, the ratio inverts and token spend becomes dominated by overhead. Remedies:

- **Batch** trivial fixes into one cycle rather than paying per-cycle governance cost for each
- **Lightweight audit tier** for trivial, deterministic changes
- **Hibernation mode** for feature-complete projects (reduced audit cadence)

This is a structural property of any governed multi-agent system, not a bug in any particular implementation.

### 9. Parallel Dispatch: Wall-Clock Win, Not Token Win

Parallelizing 13 council seats does NOT reduce total tokens spent — it reduces wall-clock time. If you care about user-perceived latency, parallelize. If you care about raw token cost, parallel and serial are equivalent.

**Hidden cost of parallel**: orchestration overhead (dispatch prompt construction, result aggregation, conflict resolution) grows roughly O(N log N) in the number of parallel agents. Beyond ~15 parallel agents, orchestration cost dominates and parallelization becomes net-negative in tokens.

### 10. Context Compaction Tax

Long sessions eventually force the model to compact its context. Compaction:

- Costs tokens (the compaction pass itself)
- Loses fidelity (recent decisions may be summarized imprecisely)
- Degrades downstream accuracy (the next decision is made from a lossy summary)

Rule of thumb: if a session exceeds ~70% of the model's context window, the compaction tax becomes observable in output quality. Mitigate by:

- Writing durable state (knowledge articles, handoff artifacts) rather than relying on in-context memory
- Ending sessions cleanly at cycle boundaries rather than running until forced compaction
- Using typed artifacts (structured files) as the handoff medium between sessions

### 11. Knowledge-Base ROI

Seed articles have high upfront cost and long tail return:

- One article: ~3-5k tokens to write well (including Falsifiable Predictions and Corrections Log)
- Each lookup: ~300 tokens, saves ~3k-10k tokens of re-derivation
- Break-even: 2-3 lookups. Most articles get 10-100+ lookups over their lifetime.
- Compounding: as the base grows, lookups displace larger fractions of new-session reasoning

The ROI curve is convex — the first few articles save little, but the Nth article saves more as cross-references accumulate.

### 12. Model Cascade

For complex multi-phase work, cascade models by phase:

1. **Strong model**: architecture, decomposition, risk identification (~20% of total tokens)
2. **Fast model**: per-phase execution, mechanical transforms (~70%)
3. **Strong model**: review, cross-check, final judgment (~10%)

This preserves strong-model reasoning at the two high-leverage points (design and review) while spending the bulk of tokens at fast-model rates. Total cost is typically 25-40% of pure-strong-model execution with equivalent output quality on well-scoped work.

## Anti-Patterns

| Anti-Pattern | Token Cost | Better Approach |
|---|---|---|
| Reading entire large files | ~3,000/file | Grep then read targeted ranges |
| Using strong model for all subagents | ~10x cost | Match model to task complexity |
| Re-investigating known issues | ~5,000-10,000 | Check knowledge base first |
| Non-English inter-agent communication | +30% tokens | English for inter-agent, user's language for output |
| Deploying everything after one change | Rebuild cost | Deploy only affected components |
| Dispatching subagent for single file lookup | ~1-2k overhead | Direct Read in parent |
| Open-ended subagent prompts | 2-5x over-explore | Embed explicit halt conditions |
| Governance cadence on trivial cycles | 85%+ overhead ratio | Batch trivial work; use lightweight tier |
| Running sessions past compaction threshold | Quality degradation | Persist state in artifacts; end cleanly |
| Over-parallelizing (>15 agents) | Orchestration > saving | Cap parallelism; aggregate in layers |

## Falsifiable Predictions

- Switching to fast model for implementation reduces token cost by >80% with <5% quality loss on well-scoped tasks
- Knowledge-base-first investigation cuts average investigation tokens by >50% on any topic with an existing article
- Dispatch overhead exceeds direct-read cost when the task fits in ≤3 Read calls
- Governance-to-implementation token ratio exceeds 60:40 on Tier 4 cycles in any governed multi-agent system without a lightweight tier
- Session output quality measurably drops (rework rate rises >2x) after exceeding ~70% context window utilization
- Model cascade (strong → fast → strong) produces equivalent output to all-strong on well-scoped multi-phase work at <40% of the token cost

## Corrections Log

| Date | Correction |
|---|---|
| 2026-04-12 | Initial creation from project cost observations |
| 2026-04-17 | Generalized: removed project-specific references, added falsifiable predictions |
| 2026-04-21 | Expanded with governance fixed cost model, parallel dispatch anatomy, context compaction tax, knowledge ROI curve, model cascade, dispatch-vs-direct-read, early termination. Grounded in 40+ audit cycles of observation across multiple workspaces. |
