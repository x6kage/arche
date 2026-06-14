# Arche session-start hooks (repo seed)

A single Archon-decoupled, **physical-signal** cadence-freeze detector. It fires at session
start regardless of governance mode, so a stalled per-cycle audit cadence is surfaced even
when the orchestrator (Archon) never dispatches. It detects on **observable physical signals**
(git work-trace mtime vs. per-cycle audit mtime), never on a self-reported counter that the
orchestrator must roll — so a frozen counter cannot blind the detector.

The detector raises a flag only; it never convenes or decides (firing-autonomy without
decision-autonomy). Convening is surfaced via `cadence-convene.sh`.

## Files

| File | Responsibility |
|---|---|
| `_cadence-flag-lib.sh` | Shared tamper-evident flag library (append-only flag + checksum ledger, vacuous-deletion guard, physical work-trace/audit mtime helpers). Sourced by the cadence scripts. |
| `cadence-check.sh` | Governance-cadence freeze DETECTION via physical signal (git work-trace mtime vs. newest per-cycle audit mtime). Read-only over state + audit archive; raises `.cadence-freeze`. Never convenes/decides. |
| `cadence-convene.sh` | On a raised freeze flag, surfaces the convene/notify action (convene Thesmothete+Diabolos in autonomous mode / notify Telos in supervised). Clears the flag only after a real per-cycle audit file post-dates the freeze. |
| `hooks.json.template` | Tool-neutral session-start registration template. `__TOOL_DIR__` is substituted with the tool's dir name (`.cursor`, `.claude`, …) at scaffold time. |

## Observability — proving the hook fired

The detection path is silent by design when nothing is wrong (no freeze → no flag).
To make "did the hook actually run, and what did it conclude?" answerable at a glance,
the hook appends a single timestamped status line to a **unified health log**:

```
<workspace>/.arche-flags/.cadence-health.log
```

Example:

```
2026-…T04:30:58	cadence-check   	ok: no freeze
2026-…T07:01:12	cadence-check   	FREEZE detected (physical): work advanced ~115h beyond newest per-cycle audit
```

A `FREEZE` line (instead of `ok`) means a flag was raised. The per-hook verbose log
(`.cadence-check.log`) remains for debug detail. Note: `sessionStart` hooks fire on
**top-level** sessions only — a **subagent (Task) dispatch does NOT fire them**, so a
subagent session legitimately shows no fresh health line; that is expected, not failure.

## Generic-path discipline

This hook contains **no tool-specific literal** and **no workspace-specific value**. Each
script derives the workspace root from its **own physical location**
(`<workspace>/<tool>/hooks/<script>` → `<workspace>`), so the same byte-for-byte file works
under any tool (`.cursor`, `.claude`, `.roo`, `.kilo`). It is read-only over state and
performs no eval of state content (injection-safe).

## Distribution (setup.sh)

`scaffold_hooks <tool-dir>` copies (not symlinks) these files into `<tool-dir>/hooks/` and
scaffolds `<tool-dir>/hooks.json` from the template. **Copy, not symlink**, because
`hooks.json` carries a per-workspace hook registration order (workspace-specific hooks such
as a reference-updater are preserved). The helper uses the "**preserve if present, scaffold
if absent**" idiom: the cadence scripts + the library are kept current, but an existing
`hooks.json` is never clobbered — so a workspace that has added its own hooks keeps them.
