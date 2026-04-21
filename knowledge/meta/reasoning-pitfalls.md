# Reasoning Pitfalls and Corrections

**Last Updated**: 2026-04-12
**Confidence**: High (derived from observed failures across multiple sessions)
**Summary**: Documented patterns where AI reasoning systematically fails, with concrete corrections.

## Context

Accumulated from debugging sessions where initial AI reasoning was wrong and had to be corrected. Each entry represents a real failure mode observed in practice.

## Pitfall 1: Equating Logical Availability with Executability

**Pattern**: Assuming that if a check passes (CanUse, IsReady, IsAvailable), the operation will succeed.

**Why it happens**: LLMs pattern-match "check returns true → proceed" without considering that checks and execution may operate on different state or through different systems.

**Real example**: `TsubamegaeshiPvE.CanUse()` returned true (logical check based on cooldown/combo state), but `Use()` failed (game expected the transformed variant KaeshiSetsugekkaPvE). The check and execution operated on different action IDs.

**Correction**: Always ask: "Does the check and the execution operate on the SAME entity?" If there's any transformation, mapping, or indirection between check and execution, they can disagree.

**Falsifiable prediction**: Any system with a "check then execute" pattern where the checked entity transforms before execution will exhibit this bug. Look for: database reads before writes with concurrent modification, UI state checks before render with async updates, permission checks before operations with role changes.

## Pitfall 2: Trusting Execution Order from Code Structure

**Pattern**: Assuming operations happen in the order they appear in source code, without verifying the actual call chain.

**Why it happens**: LLMs read code linearly. If function A appears before function B in a file, we assume A runs before B. But call sites, event ordering, and framework lifecycle may differ.

**Real example**: `StateUpdater.UpdateState()` (line 157) appears before `ActionUpdater.UpdateNextAction()` (line 159) in MajorUpdater.cs. True North logic in StateUpdater read `NextGCDAction` assuming it was current — but it was stale from the previous frame because ActionUpdater hadn't run yet.

**Correction**: When code in system A reads data produced by system B, always verify: "When does B last write this data relative to when A reads it?" Trace the actual execution order through the call chain, not the source file layout.

**Falsifiable prediction**: Any system where Component A reads state set by Component B, and both run in a loop, will have a one-cycle latency if A executes before B in the loop. This applies to game loops, React render cycles, database replication, and event-driven architectures.

## Pitfall 3: Over-Abstracting Working Code

**Pattern**: Refactoring functional but "messy" code into cleaner abstractions, introducing bugs in the process.

**Why it happens**: LLMs are trained on clean code examples and have strong pressure toward "good" code structure. A flat priority list feels wrong compared to well-named methods, but the flat list is what actually works.

**Real example**: Praxis rotations grouped SAM actions into `HandleKaeshiActions()`, `HandleSenBuilding()`, etc. This obscured the actual priority order and introduced the transformed action deadlock. The Reborn rotation's flat `if/else` chain was uglier but correct.

**Correction**: Before refactoring, ask: "What correctness properties does the current structure preserve?" Priority order, fallback guarantees, and implicit state flow are often maintained by code structure, not by explicit checks. Refactoring can silently break these.

**Falsifiable prediction**: When AI agents refactor working code into method groups, at least one implicit ordering dependency will break. Test: compare the execution trace of the original vs. refactored code for 100 input states.

## Pitfall 4: Confusing Data Freshness Across Phases

**Pattern**: Using cached/previous-frame data as if it's current.

**Why it happens**: Variables with present-tense names (NextGCDAction, CurrentTarget, IsMoving) feel current. LLMs don't naturally question "when was this last written?"

**Correction**: For any variable read across phase boundaries (e.g., state evaluation vs. action selection), explicitly trace the write-read timeline. Add comments like "// WARNING: set in previous frame by X" to prevent future confusion.

## Pitfall 5: Post-Hoc Rationalization of Failed Approaches

**Pattern**: When an approach fails, generating a plausible-sounding explanation and moving on without truly understanding why.

**Why it happens**: LLMs are optimized to produce coherent text. "The issue was X" is a satisfying output even if X is only partially correct.

**Correction**: Before declaring a root cause, state a testable prediction: "If X is truly the cause, then fixing X alone should resolve the symptom." If you can't make this prediction, you haven't found the root cause. Additionally, distinguish between "this change made the symptom go away" (correlation) and "this was the cause" (causation).

## Pitfall 6: Assuming Library/Framework APIs Are Pure

**Pattern**: Treating framework methods as pure functions (same input → same output) when they actually depend on hidden state.

**Why it happens**: LLMs reason about code by function signatures. `GetRow(id)` looks like a pure lookup. But Lumina's `GetRow()` can throw for missing IDs, ImGui methods depend on frame state, and game API calls depend on server connection state.

**Correction**: For any framework API call, ask three questions: (1) Can it throw? (2) Does it depend on hidden state? (3) Is the result valid across frames/ticks?

## Corrections Log

| Date | Pitfall | Correction |
|------|---------|-----------|
| 2026-04-12 | Initial creation | Seeded from RSR Praxis redesign experience |
