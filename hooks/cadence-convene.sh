#!/bin/bash
# cadence-convene.sh — freeze-flag CONVENING bridge.
#
# WHAT THIS IS (and is NOT):
#   The session-start hook (cadence-check.sh) is DETECTION-only — it raises `.cadence-freeze`
#   but NEVER convenes (firing-autonomy without decision-autonomy). The CONVENING is the
#   next-launched agent's act. This script is the reusable bridge the convening agent runs:
#     - autonomous mode: report that a per-cycle audit must be convened (Thesmothete+Diabolos),
#       and CLEAR the freeze flag ONLY when a NEW matching per-cycle audit file physically exists
#       (flag clear requires the matching audit file to exist — never on a promise).
#     - supervised mode: print the Cadence-Freeze Finding as a Telos notification; flag persists.
#   It NEVER writes a verdict and NEVER fabricates an audit (the audit is authored by a
#   dispatched Thesmothete; this script only verifies the artifact exists, then clears).
#
# Usage:
#   cadence-convene.sh status        # show current freeze flag + whether a fresh audit exists
#   cadence-convene.sh clear         # clear .cadence-freeze IFF a per-cycle audit newer than the
#                                    #   freeze RAISE exists (records CLEAR in the tamper-evident ledger)
#
# generic-path: workspace root from this script's own location. Read-mostly; the only write is
# the flag CLEAR (append to ledger + remove flag file) and only when the audit artifact exists.

set -u
HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=/dev/null
source "$HOOK_DIR/_cadence-flag-lib.sh"

ACTION="${1:-status}"
FLAG="$FLAG_DIR/.cadence-freeze"
STATE="$WORKSPACE_ROOT/state.md"

# Resolve audit dir (same case-insensitive logic as cadence-check.sh).
ws_name="$(basename "$WORKSPACE_ROOT")"
audit_root="$HOME/.arche/audits"
audit_dir="$audit_root/$ws_name"
if [[ ! -d "$audit_dir" && -d "$audit_root" ]]; then
    resolved="$(find "$audit_root" -maxdepth 1 -type d -iname "$ws_name" 2>/dev/null | head -1)"
    [[ -n "$resolved" ]] && audit_dir="$resolved"
fi

# Governance mode (default supervised per global; state.md may override to autonomous).
mode="$(grep -m1 -oP '^\s*governance_mode\s*:\s*\K\w+' "$STATE" 2>/dev/null || echo supervised)"

# Epoch of the most recent unresolved .cadence-freeze RAISE (from the ledger).
freeze_raise_epoch() {
    [[ -f "$FLAG_LEDGER" ]] || { echo ""; return; }
    local line ts
    line="$(grep -P "^RAISE\t[^\t]*\t\.cadence-freeze\t" "$FLAG_LEDGER" 2>/dev/null | tail -1)"
    [[ -z "$line" ]] && { echo ""; return; }
    ts="$(printf '%s' "$line" | cut -f2)"
    date -d "$ts" +%s 2>/dev/null || echo ""
}

if [[ ! -f "$FLAG" ]]; then
    echo "[convene] no active .cadence-freeze flag — nothing to convene."
    exit 0
fi

raise_epoch="$(freeze_raise_epoch)"
# A per-cycle audit that POST-DATES the freeze RAISE = the convened audit actually happened.
fresh_audit=""
if [[ -d "$audit_dir" && -n "$raise_epoch" ]]; then
    while IFS= read -r f; do
        fe="$(stat -c %Y "$f" 2>/dev/null)"
        [[ -n "$fe" && "$fe" -gt "$raise_epoch" ]] && { fresh_audit="$f"; break; }
    done < <(find "$audit_dir" -maxdepth 1 -name '*thesmothete*cycle-*.md' -printf '%T@ %p\n' 2>/dev/null | sort -rn | cut -d' ' -f2-)
fi

case "$ACTION" in
    status)
        echo "[convene] mode=$mode  freeze_raised_at_epoch=${raise_epoch:-?}"
        echo "[convene] freeze flag payload:"; sed 's/^/    /' "$FLAG"
        if [[ -n "$fresh_audit" ]]; then
            echo "[convene] a per-cycle audit POST-DATING the freeze exists: $fresh_audit"
            echo "[convene] -> run 'cadence-convene.sh clear' to clear the flag (ledger CLEAR recorded)."
        else
            if [[ "$mode" == "autonomous" ]]; then
                echo "[convene] AUTONOMOUS: convene Thesmothete+Diabolos per-cycle audit NOW; write it to"
                echo "          $audit_dir/{ts}_thesmothete_cycle-{N}.md with note 'convened-by: hook-detected freeze'."
                echo "          The flag will NOT clear until that audit file physically exists."
            else
                echo "[convene] SUPERVISED: surface this Cadence-Freeze Finding to Telos for direction. Flag persists."
            fi
        fi
        ;;
    clear)
        if [[ -z "$fresh_audit" ]]; then
            echo "[convene] REFUSING to clear: no per-cycle audit file post-dating the freeze RAISE exists."
            echo "          (a flag is never cleared on an empty promise.)"
            exit 1
        fi
        local_ts="$(date -Iseconds)"
        sum="$(_flag_checksum "$FLAG")"
        printf 'CLEAR\t%s\t%s\t%s\t%s\n' "$local_ts" ".cadence-freeze" "$sum" "cleared: matching per-cycle audit exists ($fresh_audit)" >> "$FLAG_LEDGER"
        rm -f "$FLAG"
        health_summary "cadence-convene" "CLEARED .cadence-freeze (matching audit: $(basename "$fresh_audit"))"
        echo "[convene] CLEARED .cadence-freeze — matching audit: $fresh_audit (ledger CLEAR recorded)."
        ;;
    *)
        echo "usage: cadence-convene.sh [status|clear]" >&2
        exit 2
        ;;
esac
exit 0
