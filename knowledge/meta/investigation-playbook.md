# Investigation Playbook

**Last Updated**: 2026-04-12
**Confidence**: High (validated across multiple bug investigations)
**Summary**: Systematic methodology for diagnosing code bugs, tracing execution flow, and identifying root causes.

## Context

Derived from successful bug investigations (SAM deadlock, True North inversion, i18n errors) and refined to eliminate wasted investigation time.

## Phase 1: Symptom Characterization (Before ANY Code Reading)

1. **What exactly is the symptom?** (not the assumed cause)
   - "Rotation stuck on auto-attack" NOT "state management broken"
   - "True North fires when in correct position" NOT "positional logic is wrong"
2. **When did it start?** (narrows the change window)
3. **What still works?** (eliminates entire subsystems from investigation)
4. **Is it consistent or intermittent?** (intermittent = timing/state issue)

## Phase 2: Hypothesis Generation (Max 3)

Generate exactly 3 hypotheses, ranked by probability:
1. **Most likely** (based on the symptom + recent changes)
2. **Second most likely** (based on the symptom + known fragile areas)
3. **Wildcard** (something non-obvious that would explain ALL symptoms)

**Anti-rationalization check**: For each hypothesis, state what evidence would DISPROVE it.

## Phase 3: Evidence Collection (NOT Fixing)

For each hypothesis, collect evidence in parallel:
- Use Grep for exact symbols
- Use Read for surrounding context (execution flow)
- Use SemanticSearch for "how does X work" questions
- Trace the FULL call chain, not just the immediate function

**STOP if**: evidence contradicts ALL 3 hypotheses. Go back to Phase 2 with new information.

## Phase 4: Root Cause Verification

State the root cause as a testable prediction:
- "If [root cause] is correct, then [fixing X] should resolve [symptom]"
- "If [root cause] is correct, then [Y] should also be true"

Verify the second prediction BEFORE implementing the fix. This prevents "fix that works for wrong reasons" — a common AI agent failure.

## Phase 5: Fix + Regression Check

1. Implement the minimal fix
2. Verify the primary symptom is resolved
3. Check for regressions in related functionality
4. Update knowledge base with findings

## Common Investigation Mistakes

| Mistake | Why it wastes time | Correct approach |
|---------|-------------------|-----------------|
| Reading entire large files | Most code is irrelevant | Grep for symbols, then read ±20 lines |
| Fixing before understanding | Creates new bugs | Complete Phase 4 before writing code |
| Following one hypothesis too far | Tunnel vision | Set a time limit per hypothesis |
| Assuming recent changes caused it | Correlation ≠ causation | Verify via git diff that the change actually touches the failing path |

## Falsifiable Predictions

- Following this playbook should identify root causes in ≤3 investigation cycles
- Skipping Phase 4 (verification) will result in at least 1 in 4 "fixes" being wrong
- Generating 3 hypotheses instead of 1 reduces tunnel vision failures by >50%

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial creation from RSR debugging experience |
