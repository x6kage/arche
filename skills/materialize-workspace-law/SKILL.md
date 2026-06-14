# Skill: materialize-workspace-law

**Purpose**: Materialize (or split a legacy freeform rules file into) the per-workspace law/regulation tiers required by Law Article 2.1 and Regulation 14. Use this skill whenever a workspace needs its `workspace-law.mdc` + `workspace-regulation.mdc` created, or an existing freeform workspace-rules file (e.g. `akadaemia.mdc`) split into the two tiers.

## When to invoke
- A new Arche workspace has only global symlinks and no materialized workspace-law/regulation.
- A workspace has a single freeform rules file mixing invariants and procedures.
- The Coherence/Thesmothete audit flags that referenced `workspace-law.mdc` / `workspace-regulation.mdc` files do not exist (spec-vs-reality gap).

## Governing rules (read first)
- Law **Article 2.1** (Workspace-Law Subordination & Preemption) in `<arche>/rules/law.md`.
- **Regulation 14** (Workspace Law/Regulation Materialization) in `<arche>/rules/regulation.md` — the authoritative procedure; this skill operationalizes it.

## Procedure

### 1. Establish topology (3-file model)
- Keep/create `law.mdc` + `regulation.mdc` as **symlinks** to `<arche>/rules/law.md` + `regulation.md` (never copies — copies go stale on global amend). If `setup.sh workspace-law` exists, run it to scaffold; otherwise create the symlinks manually.
- `workspace-law.mdc` and `workspace-regulation.mdc` are **real per-workspace files**.

### 2. Classify every section (placement criteria — Regulation 14.2)
For each rule/section, apply the **amendment-authority test**:
- Requires **Telos approval** (invariant: forbidden deps, SDK/runtime mandates, architectural invariants, branch discipline, build-quality bindings) → `workspace-law.mdc`.
- **Polemarch-alone procedure** (build commands, deploy steps, boot order, runbook duties, tone, file layout) → `workspace-regulation.mdc`.
- Technology-specific topic → a Domain Ordinance file.
- **Ambiguous → default to `workspace-regulation.mdc`** (less-rigid tier) + leave a `<!-- CLASSIFY: reason -->` marker. NEVER guess an invariant into law (under-classifying to regulation is safe; over-classifying to law wrongly raises the amendment bar).

### 3. Mandatory file structure (Regulation 14.3)
- `workspace-law.mdc` opens with `## Global Anchors` — name which global Article/Regulation each invariant specializes; anchorless invariants are declared originating-workspace invariants and flagged for Coherence. Header: `Tier: Workspace Law | Amendment: Polemarch + Constitution+Coherence conformance gate + Telos (Law Art 2.1)`.
- `workspace-regulation.mdc` header: `Tier: Workspace Regulation | Amendment: Polemarch, audited by Thesmothete` + one-line pointer "Invariants live in workspace-law.mdc".
- Both keep `alwaysApply: true`.

### 4. Content conservation + no duplicate
- Every line of the source file lands in exactly one target file (or carries a CLASSIFY marker). 100% conservation — delete nothing.
- The legacy freeform file MUST NOT survive as a duplicate: rename it (git mv if tracked) to `workspace-regulation.mdc`, do not leave the old name.

### 5. Reference update
- Grep the workspace for hard references to the old filename (CLAUDE.md, AGENTS.md, INTEGRATION_RUNBOOK.md / runbook, state.md, knowledge indexes, other rules).
- Update boot order to read `workspace-law.mdc` THEN `workspace-regulation.mdc`.

### 6. Conformance check (MANDATORY before declaring complete — Diabolos condition)
Dispatch the **Coherence** seat to run a contradiction-check across `workspace-law.mdc`, `workspace-regulation.mdc`, residual ordinances, and global law/regulation, verifying:
- **Subordination**: no workspace clause contradicts, relaxes, or exceeds global law/regulation (Article 2.1 void-on-conflict).
- **Global Anchors**: every workspace-law invariant has an anchor or is explicitly declared originating-workspace.
- **No duplicate source of truth**: the legacy file is gone, not copied.
A materialization without this check is incomplete.

## Output
Report: the section→file classification table applied, any CLASSIFY flags left for human review, confirmation of 100% content conservation, and the Coherence conformance-check result.

## Anti-patterns (do NOT)
- Do NOT byte-shuffle the legacy file into two halves without applying the classification test (Diabolos: "lazy split fakes tier discipline").
- Do NOT copy global law/regulation into the workspace (stale-propagation bug).
- Do NOT leave the legacy freeform file alongside the new files (third source of truth).
- Do NOT over-classify procedures as law (wrongly raises amendment bar).
