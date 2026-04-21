# Framework Evolution Protocol (FEP)

**Last Updated**: 2026-04-12
**Confidence**: MEDIUM (prototype — needs validation through operational use)
**Summary**: The Arche framework must continuously evaluate and evolve its own structure. This protocol defines when, how, and by whom the framework itself is reviewed and modified.

## Context

Every organizational structure — from Greek city-states to modern corporations — that failed to evolve its governance eventually collapsed. AI agent systems face the same risk: a static framework will become obsolete as models improve, research advances, and operational patterns shift.

The framework must practice what it preaches: just as knowledge articles are curated and evolved, the framework structure (roles, hierarchy, rules, protocols) must be subject to the same discipline.

## Reasoning Chain

1. The Arche framework was designed based on 2024-2026 research (ACE, MindWatcher, Hyperagents, etc.)
2. AI research moves at a pace where 6-month-old assumptions may be invalid
3. The framework was designed for Opus 4.6 — future models may have different strengths/weaknesses
4. 33 roles (13 Council + 20 workspace) with 5 layers (0-4) is an assumption, not a proven optimum
5. Therefore: the framework needs a built-in mechanism to question and update itself

## Key Findings

### Evolution Triggers

The framework SHOULD be reviewed when:

| Trigger | Description | Urgency |
|---------|------------|---------|
| **New model generation** | A significantly more capable LLM becomes available | HIGH — assumptions about model allocation may be invalid |
| **New research** | A paper challenges or extends the framework's theoretical foundations | MEDIUM — evaluate applicability |
| **Operational evidence** | Council/Thesmothete report systemic issues | HIGH — evidence-driven structural fix |
| **Role dormancy** | A role has not been activated in 10+ sessions | MEDIUM — candidate for removal or merger |
| **Role overload** | A single role is consistently handling 50%+ of all work | HIGH — candidate for splitting |
| **Periodic** | Every 20 significant sessions or quarterly, whichever comes first | LOW — scheduled maintenance |
| **Human request** | Founder explicitly requests framework review | IMMEDIATE |

### Evolution Process

```
Phase 1: Assessment (Council leads)
├── Collect Thesmothete Reports, Mnemon Reports, Governance Audits
├── Survey role activation patterns (which roles are used, which dormant)
├── Search for new relevant research (arXiv, industry)
├── Identify structural pain points from operational evidence
└── Output: Assessment Summary

Phase 2: Proposal (Archon drafts with Archontes input)
├── Based on Assessment Summary, propose changes:
│   ├── Role additions / removals / mergers
│   ├── Hierarchy adjustments
│   ├── Rule updates
│   ├── Reference updates
│   └── Protocol changes
└── Output: Evolution Proposal (versioned)

Phase 3: Adversarial Review (Diabolos challenges)
├── Stress-test each proposed change
├── Ask: What could go wrong?
├── Ask: Does this solve the root cause or just the symptom?
├── Ask: Is this change reversible if it fails?
└── Output: Diabolos Assessment

Phase 4: Human Decision (Founder approves/modifies/rejects)
├── Review Assessment + Proposal + Diabolos Assessment
├── Approve, modify, or reject each change
├── Decision is final — no AI role can override
└── Note: In Autonomous Mode, Council may proceed without Founder
    for routine changes (Regulation amendments). Constitutional
    changes always require Founder.

Phase 5: Implementation
├── Update agent definitions, rules, hierarchy
├── Version bump the framework
├── Update README changelog
├── Commit to repository
└── Framework Evolution Log entry
```

### Version Scheme

`v{major}.{minor}.{patch}`
- **Major**: Hierarchy restructure, role additions/removals, fundamental protocol change
- **Minor**: Role definition updates, new knowledge categories, reference additions
- **Patch**: Typo fixes, clarifications, minor rule adjustments

Current: **v0.0.3**

### Literature Freshness Protocol

As part of every Periodic or New Research trigger:

1. Search arXiv for papers published since last review:
   - Keywords: "LLM agent", "multi-agent", "self-improving AI", "AI governance", "reasoning monitoring", "agent evaluation"
   - Filter: cited 10+ times OR from known research groups (Meta FAIR, DeepMind, Anthropic, OpenAI)
2. For each relevant paper:
   - Summarize key insight
   - Evaluate: Does this challenge, extend, or confirm existing framework assumptions?
   - If applicable: propose integration into framework + update reference list
3. Update `README.md` Theoretical Foundations table

### Anti-Ossification Rules

1. **No sacred cows** — every role, rule, and protocol is subject to review
2. **Evidence over tradition** — "we've always done it this way" is not a valid defense
3. **Reversibility** — prefer changes that can be rolled back if they fail
4. **Incremental over revolutionary** — small, validated changes over large untested rewrites
5. **Human veto** — the Founder can reject any change for any reason

## Evidence

- Historical: Greek democracy → Roman Republic → Empire → fall (governance failure pattern)
- Research: Hyperagents (arXiv:2603.19461) — metacognitive self-modification with halting conditions
- Research: ACE (arXiv:2510.04618) — evolving playbooks through reflection
- Operational: Praxis rotation catastrophe — framework assumptions (Reborn base) were invalidated by practice, requiring structural redesign

## Falsifiable Predictions

- If the FEP is followed, the framework should adapt to a new LLM generation within 2 sessions of the model becoming available
- If the FEP is not followed, the framework will become model-dependent and fail when the current model is deprecated
- Role dormancy tracking will identify at least 1 unnecessary role within the first 20 sessions
- Literature freshness reviews will identify at least 1 applicable new paper per quarter

## Known Limitations

- The FEP itself needs a mechanism for self-review (meta-meta-evolution) — currently handled by the Council, but this is a bootstrapping problem
- No automated trigger mechanism — resolved with Regulation 8 governance triggers and Sunset Clause (30 days / 10 sessions)
- Literature search quality depends on search terms being well-chosen
- The human bottleneck: all changes require Founder approval, which can slow evolution

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial prototype creation |
| 2026-04-14 | v0.0.3: Polis model adopted (Paper 003). Role names updated to Greek. FEP process reflects Council-based evolution. |
