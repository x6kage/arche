#!/bin/bash
# cadence-check.sh — Archon-decoupled governance-cadence freeze DETECTION hook.
# Responsibility: governance cadence ONLY (per-cycle / 3-cycle / 10-cycle freeze).
#
# What it does (DETECTION only — NOT convening, NOT deciding):
#   reads PHYSICAL work-trace signals (newest git commit across workspace repos +
#   progress-artifact mtime) and cross-references the per-cycle audit archive's newest
#   per-cycle (Thesmothete) audit. On a detected freeze (work advanced but per-cycle
#   audit is older than the work by > FREEZE_GAP_SECS, OR work exists with zero per-cycle
#   audits) it raises a tamper-evident `.cadence-freeze` flag. The flag forces the
#   next-launched agent (Paredros/Archon) to convene (autonomous) or surface to Telos
#   (supervised) the triggered audit before proceeding. The hook NEVER convenes,
#   NEVER dispatches, NEVER writes a verdict (firing-autonomy without decision-autonomy).
#   It is read-only over state + archive and contains NO eval of state content (injection-safe).
#
#   COUNTER-INDEPENDENT BY DESIGN: detection does NOT key on state.md's cycle_number — a
#   counter the orchestrator (Archon) must roll. If Archon freezes it at 1, a counter-based
#   detector goes blind on the exact failure it must catch ("the fire alarm dies on the
#   fire's own power supply"). Detection keys on physical work-trace (git commits / progress
#   mtime — advances regardless of Archon's self-report) vs. per-cycle audit freshness.
#   A counter check is RETAINED as a secondary OR'd signal (no capability lost), but is
#   never the sole gate.
#
# generic-path: derives workspace root from its own location (no hardcoded tool literal).
# Launched by the IDE/OS at session start, independent of any agent dispatch and of mode.

set -u
HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=/dev/null
source "$HOOK_DIR/_cadence-flag-lib.sh"

cat > /dev/null  # consume sessionStart JSON on stdin, unused

LOG="$FLAG_DIR/.cadence-check.log"
STATE="$WORKSPACE_ROOT/state.md"

{
    echo "=== cadence-check: $(date -Iseconds) ==="
    if [[ ! -f "$STATE" ]]; then
        echo "[skip] no state.md at workspace root"
        health_summary "cadence-check" "skip: no state.md at $WORKSPACE_ROOT"
    else
        # Read the work-cycle counter (read-only; no eval of file content).
        # Field name is workspace-template-defined: accept cycle_number or cycle_count.
        cycle_count="$(grep -m1 -oP '^\s*(cycle_number|cycle_count)\s*:\s*\K[0-9]+' "$STATE" 2>/dev/null || echo "")"
        # Count existing per-cycle audit files for this workspace.
        # Audit dir basename may differ in case from the workspace dir; resolve
        # case-insensitively against the audit root (tool/host-neutral).
        ws_name="$(basename "$WORKSPACE_ROOT")"
        audit_root="$HOME/.arche/audits"
        audit_dir="$audit_root/$ws_name"
        if [[ ! -d "$audit_dir" && -d "$audit_root" ]]; then
            resolved="$(find "$audit_root" -maxdepth 1 -type d -iname "$ws_name" 2>/dev/null | head -1)"
            [[ -n "$resolved" ]] && audit_dir="$resolved"
        fi
        audit_count=0
        if [[ -d "$audit_dir" ]]; then
            audit_count="$(find "$audit_dir" -maxdepth 1 -name '*thesmothete*cycle-*.md' 2>/dev/null | wc -l | tr -d ' ')"
        fi
        echo "[read] cycle=${cycle_count:-?} per-cycle-audit-files=$audit_count audit_dir=$audit_dir"

        # ── PRIMARY freeze signal: PHYSICAL work-trace vs per-cycle audit freshness ──
        # Counter-INDEPENDENT. work_trace_epoch advances on real git commits /
        # progress-artifact mtime whether or not Archon rolls cycle_number. If work has
        # progressed but the newest per-cycle audit is older than the work by more than
        # FREEZE_GAP_SECS, the cadence is frozen — even when cycle_count is stuck at 1.
        FREEZE_GAP_SECS="${FREEZE_GAP_SECS:-86400}"   # 24h: work newer than last audit by >1 day = freeze
        work_epoch="$(work_trace_epoch)"
        audit_epoch="$(newest_percycle_audit_epoch "$audit_dir")"
        now_epoch="$(date +%s)"
        freeze_detected=0
        freeze_reason=""

        if [[ -n "$work_epoch" ]]; then
            if [[ -z "$audit_epoch" ]]; then
                # Work exists but NOT A SINGLE per-cycle audit -> freeze (unless brand-new ws).
                freeze_detected=1
                freeze_reason="work-trace present (newest commit/progress @$(date -d @"$work_epoch" -Iseconds 2>/dev/null)) but ZERO per-cycle audit files"
            elif [[ $((work_epoch - audit_epoch)) -gt "$FREEZE_GAP_SECS" ]]; then
                gap_h=$(( (work_epoch - audit_epoch) / 3600 ))
                freeze_detected=1
                freeze_reason="work advanced ~${gap_h}h beyond newest per-cycle audit (work=$(date -d @"$work_epoch" +%Y-%m-%dT%H:%M 2>/dev/null) audit=$(date -d @"$audit_epoch" +%Y-%m-%dT%H:%M 2>/dev/null)); per-cycle Thesmothete+Diabolos audit is frozen while work progresses"
            fi
            if [[ -n "$audit_epoch" ]]; then
                echo "[physical] work_trace=$(date -d @"$work_epoch" -Iseconds 2>/dev/null) newest_percycle_audit=$(date -d @"$audit_epoch" -Iseconds 2>/dev/null) gap_secs=$(( work_epoch - audit_epoch )) threshold=$FREEZE_GAP_SECS"
            else
                echo "[physical] work_trace=$(date -d @"$work_epoch" -Iseconds 2>/dev/null) newest_percycle_audit=NONE threshold=$FREEZE_GAP_SECS"
            fi
        else
            echo "[physical] no work-trace found (no child git repos / progress artifacts) — physical signal inconclusive"
        fi

        # ── SECONDARY signal (retained capability, NON-exclusive): counter vs audit count ──
        # Kept so the original detection still contributes when Archon DOES roll the counter.
        # NOTE: this is no longer the sole gate — it is OR'd with the physical signal above,
        # so a frozen counter (cycle_count=1) can no longer blind the detector.
        if [[ -n "$cycle_count" && "$cycle_count" -gt $((audit_count + 1)) ]]; then
            freeze_detected=1
            [[ -n "$freeze_reason" ]] && freeze_reason="$freeze_reason; "
            freeze_reason="${freeze_reason}counter signal: cycle_count=$cycle_count > per-cycle-audits=$audit_count+1"
        fi

        if [[ "$freeze_detected" -eq 1 ]]; then
            raise_flag ".cadence-freeze" "freeze: $freeze_reason | expected=per-cycle Thesmothete+Diabolos; convene(autonomous)/notify-Telos(supervised) before work"
            echo "[FREEZE] raised .cadence-freeze — $freeze_reason"
            health_summary "cadence-check" "FREEZE detected (physical): $freeze_reason -> .cadence-freeze raised"
        else
            echo "[ok] no governance cadence freeze detected (physical+counter both clear)"
            health_summary "cadence-check" "ok: no freeze (work_trace=${work_epoch:-none} newest_percycle_audit=${audit_epoch:-none} cycle=$cycle_count audits=$audit_count)"
        fi
        # Integrity check on prior flag (tamper-evidence for next agent / Continuity).
        verify_flag_integrity ".cadence-freeze"
    fi
    echo "=== done: $(date -Iseconds) ==="
} >> "$LOG" 2>&1

# Log rotation (keep last 500 lines).
if [[ -f "$LOG" && $(wc -l < "$LOG" 2>/dev/null || echo 0) -gt 1000 ]]; then
    tail -500 "$LOG" > "$LOG.tmp" && mv "$LOG.tmp" "$LOG"
fi

echo '{}'
exit 0
