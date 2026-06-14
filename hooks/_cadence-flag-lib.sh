#!/bin/bash
# Shared flag-helper library for the Archon-decoupled cadence freeze-detection hook.
# Sourced by cadence-check.sh and cadence-convene.sh.
#
# Flag tamper-evidence: flags are APPEND-ONLY and carry a checksum sidecar so a
# captured orchestrator cannot silently delete/rewrite a flag to erase a convening
# obligation. Two-end tamper-evidence: both the flag AND its checksum ledger are
# guarded, and a missing-but-expected flag is itself detectable (vacuous-deletion
# guard) because the ledger records every flag ever raised.
#
# generic-path discipline (knowledge/process/generic-path-no-hardcode-tool-specific.md):
# this script derives the workspace root from its OWN location, not a hardcoded
# tool-specific literal. The flag dir is resolved relative to the workspace root,
# so the same library works regardless of which tool's hooks dir it is installed in.

# Resolve the workspace root from this library's own physical location:
#   <workspace>/<tool>/hooks/_cadence-flag-lib.sh  ->  <workspace>
_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$_LIB_DIR/../.." && pwd)"

# Flag artifacts live at the workspace root (tool-neutral location, next to state.md).
FLAG_DIR="$WORKSPACE_ROOT/.arche-flags"
# Append-only tamper-evidence ledger: every raise/clear is recorded here, never deleted.
FLAG_LEDGER="$FLAG_DIR/.flag-ledger"
# Unified human-readable health log (Telos-visible "did the hooks run & what did they find?").
# Mirrors update-references.sh's .update.log so "is it working?" is answerable at a glance.
HEALTH_LOG="$FLAG_DIR/.cadence-health.log"

mkdir -p "$FLAG_DIR" 2>/dev/null

# health_summary <hook-name> <one-line-status>
# Appends a single timestamped status line to the unified health log. This is the
# at-a-glance "the hook ran and concluded X" evidence Telos reads. Distinct from the
# per-hook verbose logs (.cadence-check.log etc.) — those are debug detail; this is the
# single pane that proves each hook fired this session and its verdict.
health_summary() {
    printf '%s\t%-16s\t%s\n' "$(date -Iseconds)" "$1" "$2" >> "$HEALTH_LOG"
    # Rotation: keep last 300 lines (multi-session history, bounded).
    if [[ $(wc -l < "$HEALTH_LOG" 2>/dev/null || echo 0) -gt 600 ]]; then
        tail -300 "$HEALTH_LOG" > "$HEALTH_LOG.tmp" && mv "$HEALTH_LOG.tmp" "$HEALTH_LOG"
    fi
}

# _flag_checksum <file> -> sha256 (or empty on missing)
_flag_checksum() {
    [[ -f "$1" ]] || { echo ""; return; }
    sha256sum "$1" 2>/dev/null | cut -d' ' -f1
}

# raise_flag <flag-name> <one-line-payload>
# Idempotent: if the flag already exists with the same payload, only re-stamps the
# ledger heartbeat (does not duplicate). APPEND-ONLY to both the flag file and ledger.
raise_flag() {
    local name="$1" payload="$2"
    local flag="$FLAG_DIR/$name"
    local ts; ts="$(date -Iseconds)"
    # Append (never overwrite) so prior detections remain visible (append-only, Article 5.3 spirit).
    printf '%s\t%s\n' "$ts" "$payload" >> "$flag"
    local sum; sum="$(_flag_checksum "$flag")"
    # Ledger entry binds flag-name + checksum + timestamp = tamper-evidence anchor.
    printf 'RAISE\t%s\t%s\t%s\t%s\n' "$ts" "$name" "$sum" "$payload" >> "$FLAG_LEDGER"
}

# ─────────────────────────────────────────────────────────────────────────────
# PHYSICAL WORK-TRACE SIGNALS (counter-independent freeze detection)
# ─────────────────────────────────────────────────────────────────────────────
# Rationale: the freeze detector MUST NOT depend solely on a counter the orchestrator
# (Archon) must roll. Observable work-cycles (newest git commit / the tool's progress
# artifact mtime) serve as a freeze signal ALTERNATIVE to cycle_number/cycle_count.
# A detector that keys only on `cycle_count > audit_count+1` goes blind when Archon
# never rolls the counter
# (the diagnosed ~60% root cause) cycle_count freezes at 1 and the detector goes
# blind on the very failure it must catch ("the fire alarm dies on the fire's power").
# These helpers derive a freeze signal from PHYSICAL evidence that advances whether
# or not Archon rolls a counter: newest git commit across workspace repos (real work),
# vs. newest per-cycle audit file (real governance). Work newer than the last per-cycle
# audit by more than a threshold = freeze, independent of any self-reported counter.

# work_trace_epoch -> epoch seconds of the most recent PHYSICAL work evidence, or "".
# Sources (max of):
#   (1) newest commit time across immediate-child git repos (folder-of-repos work-trace)
#   (2) newest mtime of workspace-local progress artifacts (PROGRESS.md / Dispatch Log in state.md)
# Bounded + cached: the git scan over many /mnt/c repos is I/O-heavy, so the result is
# cached for WORK_TRACE_TTL seconds in .work-trace.cache (avoids re-scanning every hook /
# every session-start). Read-only; no eval of repo content.
WORK_TRACE_TTL="${WORK_TRACE_TTL:-1800}"  # 30 min cache; freeze is a multi-hour/day signal
work_trace_epoch() {
    local cache="$FLAG_DIR/.work-trace.cache"
    local now; now="$(date +%s)"
    # Serve from cache if fresh (cache line: "<computed_epoch>\t<computed_at_epoch>").
    if [[ -f "$cache" ]]; then
        local c_epoch c_at
        c_epoch="$(cut -f1 "$cache" 2>/dev/null)"
        c_at="$(cut -f2 "$cache" 2>/dev/null)"
        if [[ -n "$c_at" && "$c_at" =~ ^[0-9]+$ && $((now - c_at)) -lt "$WORK_TRACE_TTL" ]]; then
            echo "$c_epoch"; return
        fi
    fi
    local newest=0 t
    # (1) git work-trace: newest commit across immediate-child repos. Cap scan time by
    # limiting to immediate children only (-maxdepth 1 semantics via glob), git log -1.
    local d
    for d in "$WORKSPACE_ROOT"/*/; do
        [[ -d "$d/.git" || -f "$d/.git" ]] || continue
        t="$(git -C "$d" log -1 --format=%ct 2>/dev/null)"
        [[ -n "$t" && "$t" =~ ^[0-9]+$ && "$t" -gt "$newest" ]] && newest="$t"
    done
    # (2) workspace-local progress artifacts (tool-neutral DB first, then root + tool-specific fallbacks).
    local p
    for p in "$WORKSPACE_ROOT/.arche/PROGRESS.md" "$WORKSPACE_ROOT/PROGRESS.md" "$WORKSPACE_ROOT/state.md" \
             "$WORKSPACE_ROOT/.cursor/PROGRESS.md" "$WORKSPACE_ROOT/.claude/PROGRESS.md"; do
        [[ -f "$p" ]] || continue
        t="$(stat -c %Y "$p" 2>/dev/null)"
        [[ -n "$t" && "$t" =~ ^[0-9]+$ && "$t" -gt "$newest" ]] && newest="$t"
    done
    [[ "$newest" -eq 0 ]] && { echo ""; return; }
    printf '%s\t%s\n' "$newest" "$now" > "$cache" 2>/dev/null
    echo "$newest"
}

# newest_percycle_audit_epoch <audit_dir> -> epoch of newest per-cycle (Thesmothete)
# audit file, or "" if none. This is the GOVERNANCE-keeping-up signal. Per-cycle audits
# are the Article-14.2 cycle-completion artifact; meta-audits (aition/diabolos/full-council)
# are NOT per-cycle process audits, so they are excluded from this freshness measure.
newest_percycle_audit_epoch() {
    local audit_dir="$1"
    [[ -d "$audit_dir" ]] || { echo ""; return; }
    find "$audit_dir" -maxdepth 1 -name '*thesmothete*cycle-*.md' -printf '%T@\n' 2>/dev/null \
        | cut -d. -f1 | sort -rn | head -1
}

# verify_flag_integrity <flag-name>
# Detects two tamper classes for the next-launched agent / Continuity (Article 14.5):
#   (1) flag mutated/truncated after a RAISE  -> checksum mismatch vs last ledger RAISE
#   (2) flag deleted while ledger shows an unresolved RAISE (no matching CLEAR)
#       -> vacuous-deletion (captured-Archon rm) detected even though both ends "look clean"
# Emits TAMPER lines (read by agents); never blocks the session (read-only check).
verify_flag_integrity() {
    local name="$1"
    local flag="$FLAG_DIR/$name"
    [[ -f "$FLAG_LEDGER" ]] || return 0
    local last_raise last_clear last_sum
    last_raise="$(grep -nP "^RAISE\t[^\t]*\t$name\t" "$FLAG_LEDGER" 2>/dev/null | tail -1)"
    last_clear="$(grep -nP "^CLEAR\t[^\t]*\t$name\t" "$FLAG_LEDGER" 2>/dev/null | tail -1)"
    [[ -z "$last_raise" ]] && return 0
    local raise_line clear_line
    raise_line="${last_raise%%:*}"; clear_line="${last_clear%%:*}"
    # Unresolved RAISE = the most recent RAISE is later than any CLEAR.
    if [[ -z "$last_clear" || "$raise_line" -gt "$clear_line" ]]; then
        if [[ ! -f "$flag" ]]; then
            printf 'TAMPER\t%s\t%s\tflag-deleted-while-RAISE-unresolved (vacuous-deletion / captured-Archon rm suspected)\n' \
                "$(date -Iseconds)" "$name" >> "$FLAG_LEDGER"
        else
            last_sum="$(printf '%s' "$last_raise" | cut -f4)"
            local cur_sum; cur_sum="$(_flag_checksum "$flag")"
            if [[ -n "$last_sum" && "$cur_sum" != "$last_sum" ]]; then
                printf 'TAMPER\t%s\t%s\tflag-checksum-mismatch (flag mutated after RAISE)\n' \
                    "$(date -Iseconds)" "$name" >> "$FLAG_LEDGER"
            fi
        fi
    fi
}
