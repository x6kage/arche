# Lessons Learned

**Last Updated**: 2026-04-12
**Summary**: Post-mortem summaries from significant events, capturing what went wrong, what went right, and what changed as a result.

## Lesson 1: The Praxis Rotation Catastrophe (2026-04)

**What happened**: AI-generated Praxis rotations for all 22 FF14 jobs were fundamentally broken. SAM couldn't cast GCDs, True North fired randomly, multiple jobs had GCD starvation.

**Root causes**:
1. AI agents built rotations from reference materials without understanding the underlying framework
2. Transformed actions (Tsubamegaeshi → Kaeshi variants) were called by base ID, causing silent failures
3. Code was refactored into "clean" method groups that broke implicit priority ordering
4. True North logic depended on stale previous-frame data

**What went right**:
- The investigation methodology (symptom → hypothesis → evidence → root cause) worked well
- Reborn rotations provided a known-good baseline to compare against
- WrathCombo reference code showed correct patterns

**What changed**:
- Praxis redesign principle: "Start from Reborn, add improvements" instead of "build from references"
- Knowledge base created to capture framework understanding
- `rotation-development.mdc` rewritten with deep technical content

**Key takeaway**: Understanding the framework is more important than understanding the game mechanics. A rotation that's mechanically suboptimal but framework-correct will work. A rotation that's mechanically optimal but framework-incorrect will deadlock.

## Lesson 2: Token Cost Accumulation (2026-04)

**What happened**: ~$1000 in token costs, much avoidable.

**Root causes**:
1. Strong model used for mechanical implementation tasks
2. Same investigations repeated across sessions (no knowledge persistence)
3. Full file reads instead of targeted searches

**What changed**:
- 3-layer model allocation strategy enforced
- Global knowledge base created
- Workspace rules mandate Grep-first investigation

**Key takeaway**: The most expensive token is the one spent re-deriving what was already known.

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial creation |
