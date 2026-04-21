# Global AI Knowledge Base

Self-regressive knowledge accumulation system for AI agents across all Cursor workspaces.

## Purpose

LLMs exhibit post-hoc rationalization — generating plausible explanations after reaching conclusions, rather than reasoning transparently. This knowledge base counteracts that by:

1. **Capturing reasoning chains** alongside conclusions (not just "what" but "why" and "how verified")
2. **Including falsifiable predictions** that future sessions can test
3. **Recording reasoning failures** — when past logic was wrong, what went wrong and why
4. **Distilling high-quality reasoning** (Opus 4.6 Thinking) into explicit knowledge that weaker models can leverage

## Architecture

```
~/.cursor/knowledge/          ← Global (cross-workspace)
├── meta/                     ← Self-awareness about reasoning quality
├── technical/                ← Transferable technical patterns
├── process/                  ← Agent workflow optimization
└── evolution/                ← Growth tracking and post-mortems

<workspace>/.cursor/knowledge/ ← Domain-specific (per-project)
```

**Promotion pattern**: When workspace-specific knowledge generalizes, extract the transferable principle into global knowledge.

Example:
- Workspace: "RSR's StateUpdater uses previous frame's GCD data"
- Promotes to global: "State computed before the data it depends on is always stale — verify update ordering before trusting any cross-system state"

## Article Format (Mandatory)

Every article MUST have:

### Standard Sections
- **Title** (H1)
- **Last Updated** (date)
- **Confidence** (high/medium/low + what would change it)
- **Summary** (1-2 sentences)

### Reasoning Accountability Sections
- **Context** — What problem/question led to this
- **Reasoning Chain** — The actual steps taken to reach conclusions, including dead ends
- **Alternatives Considered** — What was rejected and why (negative knowledge)
- **Key Findings** — The conclusions
- **Evidence** — Verifiable file paths, line numbers, outputs
- **Falsifiable Predictions** — "If X is true, then Y should hold" — testable by future sessions
- **Known Limitations** — When this reasoning might be wrong
- **Corrections Log** — When future sessions found errors, what was corrected

## Anti-Rationalization Rules

1. Write the reasoning chain BEFORE polishing the conclusion
2. If you can't articulate WHY you believe something, mark confidence as LOW
3. Include at least one falsifiable prediction per article
4. When evidence contradicts existing knowledge: UPDATE the article, don't create a new one
5. Never delete the Corrections Log — it's the growth record

## Demand-Pull Access Pattern

Knowledge is NOT loaded into context automatically. Instead:
1. Global rule instructs agents to SEARCH knowledge before investigating
2. Agent reads only relevant articles
3. After work, agent writes back findings

This prevents context bloat while enabling knowledge-driven reasoning.
