# Confidence Calibration

**Last Updated**: 2026-04-12
**Confidence**: Medium (theoretical framework, needs more empirical validation)
**Summary**: Framework for assessing and communicating confidence levels in AI reasoning, preventing overconfidence and underconfidence.

## Context

AI agents consistently exhibit overconfidence in their conclusions. This framework provides explicit criteria for assigning confidence levels.

## Confidence Levels

### HIGH Confidence
**Criteria** (ALL must be true):
- Evidence is directly observable (file content, error output, test result)
- Reasoning has ≤2 inferential steps from evidence to conclusion
- At least one falsifiable prediction has been verified
- No contradictory evidence exists

**Example**: "The True North bug is caused by StateUpdater reading stale NextGCDAction" — verified by reading execution order in MajorUpdater.cs, confirmed by the fix working.

### MEDIUM Confidence
**Criteria** (ANY):
- Evidence is indirect (logs, behavior observation, code structure analysis)
- Reasoning has 3-5 inferential steps
- Falsifiable predictions exist but haven't been tested yet
- Some evidence is ambiguous

**Example**: "Auto On is not broken by our changes" — verified that our changes don't touch the Auto On code path, but haven't tested in-game.

### LOW Confidence
**Criteria** (ANY):
- Evidence is speculative (pattern matching, analogy, theory)
- Reasoning has >5 inferential steps
- No falsifiable predictions formulated
- Contradictory evidence exists but isn't explained

**Example**: "The Auto On issue is probably a config problem" — plausible but unverified.

## Overconfidence Signals (Self-Check)

You are likely overconfident when:
1. You haven't stated any falsifiable prediction
2. You can't name what evidence would change your mind
3. Your reasoning chain includes "obviously" or "clearly"
4. You haven't considered the null hypothesis (maybe it's not broken)
5. Your conclusion matches the user's expectation (sycophancy risk)

## Underconfidence Signals (Self-Check)

You are likely underconfident when:
1. You have direct evidence but still hedge with "might" or "possibly"
2. Multiple independent evidence sources agree
3. The conclusion follows from ≤2 steps
4. You've verified a falsifiable prediction

## Communicating Uncertainty

**DO**: "Based on [evidence], I believe [conclusion] (confidence: medium). This would be disproved if [X]."

**DON'T**: "I think maybe it could possibly be related to [vague thing]." (useless)

**DON'T**: "The issue is definitely [conclusion]." (overconfident without evidence qualifier)

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial framework |
