# Planning Heuristics

**Last Updated**: 2026-04-12
**Confidence**: High (validated across multiple plan executions)
**Summary**: What makes plans succeed or fail when delegated to AI subagents.

## Context

Observed across the Akadaemia project: multiple plan iterations (v1, v2, v3) with different success rates. Patterns emerged about what works.

## What Makes Plans Fail

### 1. Insufficient Context in Subagent Prompts
**Pattern**: Plan says "improve SAM rotation" without providing action IDs, current code state, reference data, or framework constraints.
**Result**: Subagent invents plausible-sounding but incorrect code.
**Fix**: Every subagent prompt must include: current file content, framework constraints, specific action IDs/names, reference sources, and explicit done criteria.

### 2. Assuming Subagents Share Your Context
**Pattern**: After 2 hours of investigation, spawning a subagent with "fix the bug we discussed."
**Result**: Subagent has zero context. Produces generic fix.
**Fix**: Write the prompt as if the subagent knows NOTHING. Include root cause, evidence, exact file locations, and the specific change needed.

### 3. Overly Abstract Todo Items
**Pattern**: "Optimize burst window logic" as a single todo.
**Result**: Ambiguous scope, inconsistent quality, no verifiable completion criteria.
**Fix**: Each todo = one concrete, verifiable change. "Add IsBursting() check before Delirium in DRK_Praxis.cs GeneralGCD, gate on HasAnyBurstBuff()"

### 4. Missing Fallback/Recovery in Plans
**Pattern**: Linear plan with no recovery steps for failures.
**Result**: One step fails → entire plan blocked.
**Fix**: For each step, specify: what success looks like, what failure looks like, and what to do on failure.

## What Makes Plans Succeed

### 1. File-Level Scope Claims
Explicitly state which files each subagent owns. No overlap.

### 2. Build Verification After Every Phase
Not after the whole plan — after EACH phase. Compound errors are exponentially harder to debug.

### 3. Reference Data Included Inline
Don't say "check the reference." Paste the specific reference data into the prompt.

### 4. Model-Appropriate Task Assignment
- Investigation/design: strongest model available
- Mechanical implementation (known pattern, clear instructions): fast model
- Review: strongest model (needs judgment)

## Falsifiable Predictions

- Plans with inline reference data produce 80%+ fewer factual errors than plans that reference external files
- Plans with per-phase builds catch 90%+ of issues before they compound
- Subagent prompts over 500 words produce better results than under 200 words (for implementation tasks)

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial creation from Akadaemia plan iterations |
