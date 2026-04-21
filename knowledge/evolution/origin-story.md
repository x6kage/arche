# Arche Origin Story — From AI-DLC to Polis Governance

**Last Updated**: 2026-04-14
**Confidence**: HIGH (direct primary source — HANDOFF.md from Akadaemia workspace)

## Context

Arche originated from the "AI-DLC" (AI-Driven Lifecycle Control) framework, built during the Akadaemia project — a FFXIV Dalamud plugin workspace managing 19+ plugins. The framework emerged from practical necessity: managing multi-agent AI development at scale required governance structure that ad-hoc rules couldn't provide.

## Reasoning Chain

### Phase 1: Ad-hoc Rules (pre 2026-04-12)
- Single `handoff.mdc` file (187 lines) bundled all roles: planner, reviewer, product owner
- Problem identified: "planner = reviewer = no independent verification. Rules without eval are toothless."
- No separation of concerns; authority was concentrated

### Phase 2: Role Separation (2026-04-12)
- 7 initial roles created: PdM, CPO, VPoE, Adversary (Devil's Advocate), CTO Reviewer, Self-Improvement Curator, Implementer
- Three-layer separation: planning (PdM/CPO) vs review (CTO) vs execution (Implementer)
- Adversary role introduced from day one as independent challenger
- Research basis cited: ACE, MOSAIC, MindWatcher, Hyperagents, Agent-as-a-Judge, RedCoder

### Phase 3: Legal Framework (2026-04-12)
- Key decision: split rules into **law** (immutable principles) and **regulation** (operational procedures)
- Rationale: "Changing a deploy procedure shouldn't require constitutional review. Changing the authority hierarchy shouldn't be as easy as updating a procedure."
- Amendment difficulty matched to impact scope
- Sentinel roles created: Governance (law compliance), Oversight (regulation compliance)

### Phase 4: 7-Layer Review Chain (2026-04-12)
- Hooks (L0) → Implementer (L1) → VPoE 1st review (L2) → Adversary parallel (L3) → CTO 2nd review (L4) → Meta-Judge hook (L5) → Self-Improvement Curator (L6)
- Structured Artifact Protocol: typed output per review stage to prevent information degradation
- Workspace agent overrides enabled domain-specific attack patterns (e.g., Adversary with Dalamud-specific checks)

### Phase 5: Framework Extraction (2026-04-12)
- Framework extracted from Akadaemia into standalone repository (`ai-dlc-framework`, later renamed `arche`)
- 20 agent roles, law/regulation legal framework, 11 knowledge articles, MCP server
- Rules consolidation: 11 → 7 rule files (42% reduction)

### Phase 6: Polis Model (2026-04-14, Paper 003)
- Corporate terminology (CEO, CTO, etc.) replaced with classical Greek polis model
- 22 roles consolidated to 18 based on distributed authority principles
- Governance Council formalized at 13 seats
- Akademia established as independent research institution

## Alternatives Considered

- **Single monolithic rules file**: Rejected — amendment difficulty couldn't vary by impact
- **Planner-as-reviewer model**: Rejected — "no independent verification"
- **Corporate hierarchy only**: Eventually rejected — concentrated power violated the framework's own distributed authority principles (Paper 003)

## Key Findings

1. **Governance emerged from practice, not theory**: The legal framework was designed because deploying 19 plugins with multiple AI agents required structural guarantees
2. **Adversary role was foundational**: Present from the very first role separation, not added later
3. **Law/regulation split was the pivotal design decision**: This single choice enabled amendment-difficulty-matched-to-impact, which became Article 9
4. **The review chain predates the governance council**: Sequential multi-agent review (7-layer) came first; formal governance voting came later
5. **Research-informed but practice-driven**: Academic references (ACE, MOSAIC, etc.) were cited but the design was driven by concrete operational failures

## Evidence

- Primary source: Akadaemia workspace `HANDOFF.md` (2285 lines, 170KB)
- Key sections: "AI-DLC Project Structure" (L452-464), "Agent Role Separation" (L466-474), "AI-DLC Legal Framework" (L823-835), "AI-DLC Framework Adoption" (L337-344)
- Corroborating: Papers 001 (governance theory), 003 (role architecture)

## Falsifiable Predictions

1. The law/regulation split will remain the core structural principle even after significant framework evolution
2. The Adversary/Diabolos role will never be removed — its foundational status predicts permanence
3. Structured artifact protocols (typed review outputs) will re-emerge as the framework scales, even if currently simplified

## Corrections Log

| Date | Entry |
|------|-------|
| 2026-04-14 | Initial creation from HANDOFF.md primary source extraction |
