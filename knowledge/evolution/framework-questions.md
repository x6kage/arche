# Open Framework Questions

**Last Updated**: 2026-04-12
**Confidence**: LOW (these are questions, not answers)
**Summary**: Unresolved design questions about the Arche framework structure, collected for ongoing research and operational validation.

## Context

The framework was rapidly prototyped based on 6 research papers and operational experience from one project (Akadaemia). Many structural decisions were made quickly and need validation.

## Open Questions

### Q1: Is 10 roles the right number?

**Current state**: 33 roles (13 Governance Council + 11 Archontes + 2 VP + 4 Lead + 1 Technites + 2 deprecated)

**Arguments for fewer**:
- More roles = more coordination overhead
- In practice, some roles may rarely activate (Demiourgos? Strategos?)
- Cursor's context window is finite — role definitions consume tokens
- Simpler systems are easier to reason about

**Arguments for more**:
- Information isolation improves focus
- Specialized roles produce better outputs than generalists
- Real organizations have many roles for good reasons
- As the system grows, current roles may be overloaded

**Research needed**: Track role activation frequency over 20+ sessions. Which roles are consistently used? Which are dormant? Which are overloaded?

### Q2: Is the hierarchy correct?

**Current state**: 5 layers (0-4), from Governance to Execution

**Concerns**:
- Is Layer 2 too crowded? (Polemarch, Thesmothete, Diabolos, Mnemon)
- Should Polemarch be a singleton authority or one of several Layer 2 peers?
- Does Grammateus at Layer 3 have enough authority to coordinate Layer 4?
- Is there a meaningful difference between Layer 3 (Management) and Layer 4 (Execution)?

**Historical parallel**: Military has clear hierarchy (General → Colonel → Major → Captain → Lieutenant → Sergeant → Private). Corporate has flatter structure. Which model fits AI agents better?

### Q3: Should the Governance Council evaluate itself?

**The bootstrapping problem**: Who watches the watchmen?

**Options**:
- a) the Council is self-evaluating (risky — same bias problem it's designed to prevent)
- b) The Founder manually reviews Council output (practical but doesn't scale)
- c) A separate meta-auditor exists (infinite regression)
- d) The Council's output is public/transparent, creating social accountability

**Current design**: Option (b) — Founder reviews Governance Audits. This is pragmatic but centralizes too much on one human.

**RESOLVED (v0.0.3)**: The bootstrapping problem is addressed through:
1. **13-member Governance Council** with cross-accountability — each seat is evaluated by an adjacent seat in a circular ring
2. **Diabolos (Seat 13)** challenges all 12 other seats, preventing groupthink
3. **Self-update prohibition** (Article 11) — no role may modify its own Standing
4. **Layer-transparent flagging** — even Layer 4 (Technites) can flag Layer 0 anomalies
5. **Corruption paradox acknowledged** — total system compromise requires external anchor (Founder)

### Q4: How should the framework adapt to new LLM architectures?

**Current assumption**: LLMs have thinking/reasoning capabilities, context windows, and tool use. The framework is designed around these.

**What if**:
- A new model has native persistent memory? (knowledge base may be redundant)
- A new model can truly learn from interactions? (self-regressive accumulation may change form)
- Multi-modal models change the interaction paradigm?
- Models become cheap enough that model allocation strategy is irrelevant?

### Q5: Should roles be statically defined or dynamically created?

**Current state**: 10 fixed roles, defined in markdown files

**Alternative**: Roles are generated on-demand based on the task at hand. The system describes the needed capabilities, and a role definition is synthesized in real-time.

**Pros of dynamic**: Perfectly tailored to each task, no unused roles
**Cons of dynamic**: No institutional memory, inconsistent behavior, higher overhead

**Hybrid possibility**: Core roles are static (Archon, Council seats, Technites), specialist roles are dynamic

### Q6: What governance models from political science apply?

**Explored**:
- Separation of powers (Legislature/Executive/Judiciary → Constitution/Archon/Polemarch)
- Checks and balances (multiple layers of oversight)
- Constitutional law (inviolable principles)

**Not yet explored**:
- Federalism (independent sub-systems with shared governance)
- Direct democracy (all agents vote on decisions?)
- Meritocracy (roles assigned based on demonstrated capability)
- Evolutionary governance (competing governance models, best one survives)

**Now explored (v0.0.3)**:
- Federalism: Layer 0 = international law (global), Layers 1-4 = domestic law (per workspace)
- Direct democracy: All agents can flag anomalies (Layer-transparent flagging), Standing is merit-based
- Meritocracy: Standing system makes role authority performance-linked
- Cabinet governance: Archon requires Archontes consensus for strategic decisions

### Q7: How does this scale beyond one human operator?

**Current design**: One Founder, full authority

**What if**:
- Multiple humans collaborate using the same framework?
- Different humans have different authority levels?
- The framework is used by an organization, not an individual?

### Q8: What are the failure modes of this framework?

**Identified**:
- The Council becomes too aggressive → constant false alarms → gets ignored
- Too many layers → decision paralysis
- Knowledge base grows too large → context pollution
- Model dependency → framework breaks with new model generation
- Human bottleneck → Founder can't review fast enough

**Not yet identified**: Unknown unknowns. Operational experience will reveal them.

### Q9: MCP server as governance infrastructure?

**Current state**: MCP server provides knowledge access tools

**Potential extension**: MCP server could also enforce governance:
- Track role activations and generate Council audit reports automatically
- Enforce write permissions based on role (Technites can't write governance articles)
- Provide audit trail for all knowledge modifications
- Automatic trigger for Framework Evolution when conditions are met

**Note (v0.0.3)**: Current approach uses state files (governance.md + state.md) for tool-agnostic governance. MCP remains a knowledge access layer, not a governance enforcement layer.

### Q10: Is the anti-rationalization protocol sufficient?

**Current approach**: Falsifiable predictions + confidence levels + corrections logs

**Concerns**:
- An LLM can generate plausible-sounding falsifiable predictions that are actually unfalsifiable
- Confidence calibration depends on honest self-assessment (which LLMs are bad at)
- Corrections Logs only capture known errors — unknown errors persist
- The protocol fights symptoms (rationalization) not the cause (training incentives)

**Research needed**: Empirical measurement — how often do "falsifiable" predictions actually get tested? How often do confidence levels match reality?

## Falsifiable Predictions

- At least 3 of these questions will have evidence-based answers within 6 months of framework operation
- The role count will change (add or remove) within the first 20 sessions based on activation data
- At least 1 failure mode not listed here will be discovered through operation

## Corrections Log

| Date | Correction |
|------|-----------|
| 2026-04-12 | Initial creation with 10 questions |
| 2026-04-14 | v0.0.3: Role names updated per Paper 003. Q1 updated for 31-role count. Q3 resolved with Council + cross-accountability. Q6 resolved with federal model. |
