# Incremental Build Cache Produces False-Zero-Warning (Clean Build Required to Claim 0W)

**Last Updated**: 2026-06-14
**Confidence**: HIGH (direct evidence — a false 0W claim was committed and then caught)

## Context

During a large warning-remediation cycle (a vendored C#/.NET dependency: ~364 warnings to source-fix after removing blanket `<NoWarn>` suppression), an agent ran an *incremental* build, observed `0 Warning(s)`, and committed the work with a commit message asserting "Build: 0 Warning / 0 Error". A subsequent **clean** build (obj/bin deleted, build-server shut down) revealed the true count was **364 warnings** — the incremental build's stale object cache had reported a pre-removal 0W state. The commit message was therefore **false**, and had to be amended after the warnings were genuinely fixed.

This is not a C#-specific quirk. Any toolchain with incremental compilation (dotnet/MSBuild, gradle, bazel, tsc --incremental, cargo, etc.) can report a stale warning count when inputs changed in ways the incremental engine under-tracks (e.g. a project-config change like editing `<NoWarn>`, or a transitive dependency rebuild).

## Reasoning Chain

1. I removed `<NoWarn>` entries from the project config, expecting warnings to surface.
2. I ran `dotnet build` (incremental) → saw `0 Warning(s)` → concluded the source was already clean → committed with "0W".
3. Reality check (prompted later): `rm -rf obj bin && dotnet build-server shutdown && dotnet build` → **364 warnings**.
4. Root cause: the incremental engine reused cached compilation outputs produced *before* the `<NoWarn>` removal. The config change did not invalidate the per-source-file warning cache, so the build replayed the old (suppressed → zero) diagnostic set.
5. Therefore: **an incremental build's warning count is not admissible evidence for a 0W claim.** Only a clean build (cache invalidated) produces a trustworthy count.

## Key Findings

- **A "0 Warning" assertion (in a commit message, audit, or review verdict) is only valid if produced by a clean build.** Incremental-build 0W is a potential false positive.
- **Clean build = cache invalidation**, achieved by either: deleting build output dirs (`obj/`, `bin/`, `target/`, `dist/`), and/or shutting down the persistent build server/daemon (`dotnet build-server shutdown`, `gradle --stop`, etc.), before the verifying build.
- This failure mode is most acute right after a **build-configuration change** (suppression edits, analyzer ruleset changes, target-framework bumps) — precisely when warning counts are expected to change, and precisely when incremental caches are least reliable.
- A double-check (clean build **and** a direct `grep -c "warning"` on full output) is cheap insurance against the single-number summary lying.

## Alternatives Considered (and rejected)

- *"Trust the incremental 0W if build-server was shut down."* Rejected: shutting down the server does not delete the per-project obj cache; the stale outputs persist on disk and are reused. Both server shutdown **and** obj/bin deletion are needed for a true clean.
- *"Trust the subagent's reported 0W."* Rejected: the dispatching agent must independently re-verify with a clean build before asserting/committing 0W. A subagent's report inherits the same incremental-cache risk; treating it as ground truth propagates the false positive.
- *"Always clean-build everything every time."* Rejected as the default for *iterative development* (too slow), but **required for the final 0W verification before commit/deploy/verdict.** Iterate incrementally; verify clean.

## Falsifiable Predictions

- If a future agent claims 0W from an incremental build immediately after editing a suppression directive or analyzer config, a clean rebuild will reveal nonzero warnings in a non-trivial fraction of cases.
- Deleting build-output directories before the verifying build will change the reported warning count in exactly the scenarios where the incremental cache was stale (and leave it unchanged otherwise), making the discrepancy a reliable detector of cache staleness.

## Evidence

- 2026-06-14 cycle: commit asserting "0W" on an incremental build; clean rebuild showed 364 warnings; commit amended after genuine source-fix to a verified clean 0W (dll byte-size identical → ABI unchanged, confirming the fix was annotation/guard-level, not behavioral).

## Corrections Log

- 2026-06-14: Article created from a live false-0W-commit incident (the agent's own error, recorded per Article 5.3 — errors are growth data). Companion proposal drafted to add a clean-build verification requirement to Global Regulation 13.
