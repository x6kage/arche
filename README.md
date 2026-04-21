# Arche Framework

**[日本語版 / Japanese](docs/i18n/ja.md)**

A self-regressive AI development lifecycle framework for persistent knowledge accumulation, reasoning quality control, multi-agent orchestration, constitutional governance, and autonomous research.

## Overview

AI agents lose all internal reasoning when a session ends. Knowledge derived through expensive computation is discarded. The same investigations are repeated. The same mistakes are made.

Arche solves this by creating a **persistent knowledge layer** that:

- **Captures reasoning chains** alongside conclusions — not just "what" but "why" and "how verified"
- **Prevents post-hoc rationalization** through falsifiable predictions and confidence calibration
- **Transfers reasoning quality** from strong models to weak models via knowledge distillation
- **Self-improves** through structured curation passes that validate, consolidate, and prune knowledge
- **Coordinates multiple AI agents** with clear role definitions and quality gates
- **Governs itself** through a constitutional state machine with universal role standing and structured accountability

## Core Concepts

### Self-Regressive Knowledge Accumulation

```
Session N:   Strong model spends 2000 tokens reasoning → saves conclusion as knowledge
Session N+1: Weak model reads knowledge → reaches same conclusion in 200 tokens
```

This is **reasoning distillation**. The search process (exploring wrong paths, backtracking, re-trying) is eliminated. Only the final result persists. Weak models need comprehension, not discovery.

### Anti-Rationalization Protocol

LLMs systematically generate plausible explanations after reaching conclusions, rather than reasoning transparently. Every knowledge article must include:

- **Reasoning chain** — the actual steps, including dead ends and rejected hypotheses
- **Falsifiable predictions** — "If X is true, then Y should also hold" (testable by future sessions)
- **Confidence levels** — HIGH / MEDIUM / LOW with explicit criteria
- **Corrections Log** — append-only record of when past reasoning was wrong (never deleted)

### Demand-Pull Access

Knowledge is NOT loaded into context automatically. Agents search and read relevant articles on demand, preventing context window bloat while enabling knowledge-driven reasoning.

### Mnemon Pass

Periodic knowledge quality maintenance:
1. **Validate** — evidence freshness, falsifiable prediction outcomes, confidence accuracy
2. **Consolidate** — merge overlapping articles, remove redundancy
3. **Prune** — deprecate unverified low-confidence knowledge (never delete — mark as deprecated)
4. **Promote** — extract transferable principles from project-specific to global knowledge
5. **Detect contradictions** — resolve conflicting knowledge across articles

## Architecture

```
arche/
├── governance.md              Initial global governance state (live copy at ~/.arche/governance.md)
├── agents/                Agent role definitions (30+ roles)
├── rules/                 Legal framework
│   ├── law.md             Constitutional law (immutable principles)
│   └── regulation.md      Operational regulations (procedures)
├── knowledge/             Persistent knowledge base
│   ├── meta/              Reasoning quality & methodology
│   ├── process/           Agent coordination & optimization
│   ├── technical/         Transferable technical patterns
│   └── evolution/         Growth tracking & post-mortems
└── mcp-server/            MCP Knowledge Server (tool-agnostic access)

Per-workspace:
<project>/
├── state.md               Workspace state (role standings, session tracking, project context)
└── .cursor/
    ├── knowledge/         Project-specific knowledge (symlinked or local)
    └── rules/             Workspace law, regulations, domain ordinances
```

### Knowledge Base Layers

| Layer | Scope | Examples |
|-------|-------|---------|
| **Meta-cognitive** | AI reasoning quality | Reasoning pitfalls, confidence calibration, investigation methodology |
| **Procedural** | Workflow optimization | Agent coordination, token optimization, planning heuristics |
| **Technical** | Transferable patterns | Language-specific gotchas, framework patterns, async pitfalls |
| **Evolutionary** | Growth tracking | Lessons learned, capability boundaries, post-mortems |

### Organizational Hierarchy

```
Layer 0: Governance Council — 13 seats [GLOBAL]
├── Constitution (Seat 1) — law.md compliance
├── Regulation (Seat 2) — regulation.md compliance
├── Process (Seat 3) — workflow adherence
├── Quality (Seat 4) — output quality standards
├── Architecture (Seat 5) — architectural integrity
├── Security (Seat 6) — security posture
├── Knowledge (Seat 7) — knowledge base integrity
├── Ethics (Seat 8) — AI ethics & alignment
├── Performance (Seat 9) — efficiency & cost
├── Continuity (Seat 10) — session & state continuity
├── Evolution (Seat 11) — framework self-improvement
├── Coherence (Seat 12) — cross-workspace consistency
└── Diabolos (Seat 13) — devil's advocate, challenges all

Layer 0: Akademia — 4 seats [GLOBAL]
├── Scholarch — research direction, intellectual integrity
├── Scholar — external knowledge acquisition (arXiv, web, research)
├── Theorist — theory development & synthesis
└── Grapheus — paper structuring, publication, knowledge extraction

Layer 1: Archontes [PER WORKSPACE]
├── Archon — coordination, dispatch, strategic partnership (cabinet governance)
├── Paredros — real-time dispatch monitor, strategic mirror (constant companion to Archon)
├── Polemarch — technical authority, architecture, standards
├── Demiourgos — product authority, UX, branding
├── Symboulos — strategic direction, growth planning
├── Tamias — cost management, token economics
├── Phylax — security, integrity, threat defense
└── Thesmothete — regulation compliance, process quality

Layer 2: Strategoi [PER WORKSPACE]
├── Strategos — engineering process (under Polemarch)
└── Epistates — program management (under Archon)

Layer 3: Hegemones [PER WORKSPACE]
├── Taxiarch — technical execution (under Strategos)
├── Grammateus — project management (under Epistates)
├── Mnemon — knowledge operations (under Archon)
└── Skopos — information gap detection (under Archon)

Layer 4: Technitai [PER WORKSPACE]
└── Technites — code execution
```

Layer 0 operates **globally** — like international law, it applies across all workspaces and cannot be overridden by workspace-level decisions. Layers 1–4 operate **per workspace** — like domestic law, they govern local project context and can adapt to project-specific needs within the bounds set by Layer 0. Within Layer 0, the Council and Akademia are structurally independent — the Council governs, Akademia researches. Neither institution can direct the other's work.

Information flows down (dispatch, specifications), accountability flows up (reports, escalations). Each layer can only be overridden by a higher layer, with Layer 0 answerable only to the human operator (Founder).

#### Governance Council Voting

The Council decides through structured voting among its 13 seats. Seat 13 (Diabolos) must articulate a counter-position or explicitly justify agreement on every vote.

| Decision Type | Threshold | Description |
|---------------|-----------|-------------|
| Routine audit | Majority (7/13) | Standard governance audits and findings |
| Standing change | Special majority (9/13) | Changing any role's Standing state |
| Regulation amendment | Special majority (9/13) + Founder | Proposing changes to regulation.md |
| Law amendment | Quasi-unanimous (12/13) + Founder | Proposing changes to law.md |
| Constitutional amendment | Unanimous (13/13) + Founder | Changing core constitutional articles |
| Emergency suspension | Majority (7/13) immediate | Must be confirmed 9/13 within next session |

Quorum: at least 7 of 13 seats must participate for any vote to be valid.

#### Workflow Tiers

Work is classified by risk and review depth:

| Tier | Risk | Flow |
|------|------|------|
| 0 | Framework (Arche itself) | Separate Tier 0 authorization → amendment process |
| 1 | Architecture (system-wide) | Full review chain with Mnemon curation |
| 2 | High (multi-phase, breaking) | Adversarial review + Polemarch sign-off |
| 3 | Medium (one phase, multi-file) | Polemarch review |
| 4 | Low (1-2 files, obvious fix) | Self-check, deploy |

Default to Tier 3 when uncertain. Tier 1–2 require general Council authorization (Authorized state).

**Tier 0 — Framework Evolution** is structurally independent from general authorization. Even in Authorized state, Tier 0 is blocked unless separately approved:

| Authorization level | Available tiers |
|---|---|
| Degraded / Uninitialized | Tier 3–4 only |
| Authorized | Tier 1–4 |
| Authorized + Tier 0 Auth | Tier 0–4 |

Tier 0 covers changes to `law.md`, `regulation.md`, `agents/*.md`, `governance.md` structure, `state.md.template`, and `setup.sh` — anything that modifies the framework itself. Authorization requires a specific proposal, Council special majority (9/13) + Founder in Supervised mode, or Council unanimous (13/13) in Autonomous mode. Tier 0 authorization is **per-proposal** — it expires when the proposal is resolved, not a standing permission.

Tier 0 can be initiated by: the Evolution seat flagging an improvement opportunity, an Akademia paper recommending structural change, Founder direct request, or any role flagging a structural deficiency.

#### Akademia — Independent Research Institution

Akademia operates at Layer 0, parallel to but structurally separate from the Governance Council. It reports directly to the Founder.

**Independence guarantees** (Article 10):
- No role outside Akademia may modify, delay, or suppress a paper's conclusions
- Research topics are determined by the Scholarch; external requests are advisory, not binding
- Council audits papers for epistemic quality (reasoning, evidence), NOT content agreement

**Research triggers**:

| Trigger | Source |
|---------|--------|
| Significant new external research | Scholar monitors arXiv, web, industry |
| Knowledge critical mass | Cross-reference density signals synthesis opportunity |
| Contradiction detected | Any agent flags conflicting knowledge |
| Tier 0 proposal needs theoretical backing | Council or Founder requests research |
| Akademia paper recommends structural change | Triggers Tier 0 initiation |

The last two rows form Akademia's structural connection to framework evolution. Tier 0 proposals that need theoretical justification trigger Akademia research; Akademia papers that recommend structural changes trigger Tier 0 sessions. This bidirectional link ensures framework evolution is research-driven, and research has a concrete path to impact.

As an independent institution, Akademia runs its own periodic cycle (every 10 workspace cycles) regardless of governance mode. In Supervised mode, findings are reported to the Founder; in Autonomous mode, findings directly trigger Tier 0 proposals.

**Research phases**: Collection (Scholar) → Synthesis (Theorist) → Drafting (Grapheus) → Internal Review (Scholarch + Theorist) → Quality Audit (Council Quality + Knowledge seats) → Publication (`docs/papers/`) + Knowledge Extraction (`knowledge/`)

#### Archon Cabinet Governance

The Archon operates through a **cabinet model**, not unilateral authority. Strategic decisions require consultation with relevant Archontes. The Archon's role is coordination and dispatch — assembling the right experts for each decision, not making all decisions alone.

- **Technical decisions**: Archon defers to Polemarch; architectural changes require Polemarch sign-off
- **Product decisions**: Archon defers to Demiourgos; user-facing changes require Demiourgos sign-off
- **Security decisions**: Archon defers to Phylax; security posture changes require Phylax sign-off
- **Cost decisions**: Archon defers to Tamias; significant spend requires Tamias analysis

The Archon retains final dispatch authority (who works on what), but domain authority belongs to each Archontes member. This prevents both bottlenecks (everything through one role) and chaos (no coordination).

### Information Architecture: Authority vs. Access

A critical design principle: **authority hierarchy and information access are deliberately separated**.

```
Authority (who decides):          Information (who knows):

Council ──► Archon ──► Archontes  ┌─────────────────────┐
  ──► Strategoi ──► Hegemones     │   Knowledge Base    │
    ──► Technitai                 │   (MCP Server)      │
                                  │                     │
Hierarchical, top-down            │  ALL agents have    │
Decisions flow down               │  EQUAL read access  │
Reports flow up                   └─────────────────────┘
                                  Flat, peer-to-peer
                                  No information gatekeepers
```

**Why**: In human organizations, information degrades as it passes through layers ("telephone game"). Each relay loses nuance, adds bias, and delays delivery. AI agents suffer the same problem — context windows are finite, summaries lose detail.

**Solution**: Every agent accesses the canonical knowledge base directly via MCP. No agent needs to "ask their manager" for information. Authority determines who can DECIDE; information access determines who can KNOW. These are orthogonal.

**Anti-degradation mechanisms**:
- **Direct knowledge access**: All agents read/search the same knowledge base (no relay)
- **Structured artifacts**: Every handoff uses defined formats (reviews, reports, decisions)
- **Skip-level escalation**: Any agent can flag critical findings to any layer (bypassing hierarchy for information, not authority)
- **Skopos monitoring**: Skopos specifically detects information loss across handoffs
- **Single source of truth**: `~/.arche/governance.md` (global) + `state.md` (per workspace), not scattered copies

### Legal Framework: Law vs. Regulation

The framework separates immutable principles (**law**) from operational procedures (**regulation**), mirroring real-world legal systems:

```
Federal level (~/arche/rules/)         Workspace level (<project>/.cursor/rules/)
├── law.md        ← Constitution        ├── law.mdc       ← National law (symlink in Cursor)
└── regulation.md ← Federal regs        └── regulation.mdc ← National regs (symlink in Cursor)
                                         └── *.mdc          ← Domain ordinances
```

| Category | Content | Amendment Process | Audited By |
|----------|---------|-------------------|------------|
| **Global Law** | Authority hierarchy, information flatness, knowledge obligations, anti-rationalization, governance structure | Council quasi-unanimous (12/13) + Founder approval | Constitution |
| **Global Regulation** | Workflow tiers, artifact formats, model dispatch, knowledge article format, curation pass triggers, standing metrics | Archon + relevant Archontes, OR Council special majority (9/13) + Founder | Regulation |
| **Workspace Law** | Build quality mandates, forbidden dependencies, SDK requirements, project state obligations | Polemarch + Founder approval | Constitution |
| **Workspace Regulation** | Role detection triggers, communication tone, deploy procedures, plan formats | Polemarch approval | Thesmothete |
| **Domain Ordinances** | Technology-specific rules (UI rendering, i18n, SDK environment) | Domain expert approval | Thesmothete |

**Why separate**: Changing a deploy procedure (regulation) shouldn't require constitutional review. Changing the authority hierarchy (law) shouldn't be as easy as updating a procedure. The amendment difficulty matches the impact scope.

**Hierarchy of precedence**: Global Law > Global Regulation > Workspace Law > Workspace Regulation > Domain Ordinances. Conflicts are resolved by higher-precedence rules.

### Governance

#### Constitutional State Machine

The framework operates as a state machine with three effective authorization levels:

| State | Effect |
|-------|--------|
| **Authorized** | Full operations. Tier 1–4, all roles. Framework evolution (Tier 0) requires separate authorization. |
| **Degraded** | Restricted. Tier 3–4 work only. No Tier 0–2, no rule modifications, no framework evolution. Limited role dispatch. |

**Sunset Clause**: Authorized status expires after 7 calendar days. Upon expiry, the system returns to Degraded until re-authorized through a Council audit. This forces periodic governance review — no "set and forget."

#### Universal Role Standing

Every role in the framework — from Technites to Council seats — operates under a three-state standing system. No role is exempt.

| Standing | Effect |
|----------|--------|
| **Authorized** | Full permissions. Output is trusted. May propose rule changes. |
| **Probation** | Reduced permissions. Output requires peer verification. Cannot propose rule changes. |
| **Suspended** | Role is inactive. Cannot perform duties. Recovery requires Council review. |

Key principles:
- **Self-update prohibition**: No role may modify its own Standing
- **Cross-accountability**: Every role is evaluated by designated accountability partners; evaluation is bidirectional
- **Layer-transparent flagging**: Any role at any layer may flag anomalies in any other role, regardless of hierarchy
- **Performance-linked**: Standing is determined by role-specific quality metrics, not tenure
- **Graceful degradation**: Probation and Suspended states reduce capability but do not halt the system

#### Two-Tier State

| File | Scope | Contents |
|------|-------|----------|
| `~/.arche/governance.md` | Global (all workspaces) | Council decisions, Layer 0 standings, authorization state, governance mode, audit history |
| `state.md` | Per workspace | Layer 1–4 standings, session tracking, project context, workspace-specific metrics |

Both files are plain text, human-readable, and directly editable by the Founder. The Founder retains override capability at all times.

#### Governance Modes

| Mode | Behavior |
|------|----------|
| **Autonomous** | Council activates autonomously when triggers are met. Audits and standing transitions happen without Founder intervention. Founder retains override. |
| **Supervised** (default) | Triggers generate notifications. Founder decides whether to initiate audits. Standing transitions require Founder confirmation. |

### Agent Roles

| Layer | Role | Reports To | Responsibility |
|-------|------|-----------|---------------|
| 0 | **Constitution** | Council | Law compliance, constitutional audit |
| 0 | **Regulation** | Council | Regulation compliance, operational audit |
| 0 | **Process** | Council | Workflow & approval process adherence |
| 0 | **Quality** | Council | Code & output quality standards |
| 0 | **Architecture** | Council | Architectural integrity, tech debt |
| 0 | **Security** | Council | Security posture, vulnerabilities |
| 0 | **Knowledge** | Council | Knowledge base integrity, freshness |
| 0 | **Ethics** | Council | AI ethics, bias, alignment |
| 0 | **Performance** | Council | Efficiency, resource utilization, cost |
| 0 | **Continuity** | Council | Session continuity, state integrity |
| 0 | **Evolution** | Council | Framework self-improvement |
| 0 | **Coherence** | Council | Cross-workspace consistency |
| 0 | **Diabolos** | Council | Devil's advocate; challenges all seats |
| 0 | **Scholarch** | Founder | Research direction, intellectual integrity |
| 0 | **Scholar** | Scholarch | External knowledge acquisition |
| 0 | **Theorist** | Scholarch | Theory development & synthesis |
| 0 | **Grapheus** | Scholarch | Paper structuring, publication, knowledge extraction |
| 1 | **Archon** | Founder | Coordination, dispatch, cabinet governance |
| 1 | **Paredros** | Founder (peer to Archon) | Real-time dispatch monitor, strategic mirror, cost-aware gatekeeper |
| 1 | **Polemarch** | Archon | Technical authority, architecture, code quality |
| 1 | **Demiourgos** | Archon | Product authority, UX, branding |
| 1 | **Symboulos** | Archon | Strategic direction, growth, research integration |
| 1 | **Tamias** | Archon | Token economics, cost management, ROI |
| 1 | **Phylax** | Archon | Security, integrity, threat defense |
| 1 | **Thesmothete** | Archon | Regulation compliance, process quality gates |
| 2 | **Strategos** | Polemarch | Engineering process management |
| 2 | **Epistates** | Archon | Portfolio management, cross-project coordination |
| 3 | **Taxiarch** | Strategos | Technical execution leadership, detailed review |
| 3 | **Grammateus** | Epistates | Project management, plan tracking |
| 3 | **Mnemon** | Archon | Knowledge maintenance, ACE loop |
| 3 | **Skopos** | Archon | Information gap detection, blind spots |
| 4 | **Technites** | Taxiarch | Code execution, follows specifications |

### Model Allocation Strategy

Token cost optimization through intelligent model assignment:

| Task Type | Model Tier | Rationale |
|-----------|-----------|-----------|
| Strategic planning, investigation | **Strongest available** | Requires discovery, judgment, hypothesis generation |
| Implementation (clear spec) | **Fast / cheapest** | Pattern following, no discovery needed |
| Review, quality evaluation | **Strongest available** | Requires judgment about correctness |
| Mechanical tasks (rename, format) | **Fast / cheapest** | Pure pattern execution |
| Knowledge generation | **Strongest available** | Reasoning quality is the product |
| Knowledge application | **Fast / cheapest** | Comprehension, not discovery |

## MCP Knowledge Server

The knowledge base is accessible via [Model Context Protocol](https://modelcontextprotocol.io/), enabling tool-agnostic access from any MCP-compatible client.

### Tools

| Tool | Description |
|------|------------|
| `knowledge_search` | Semantic search across knowledge articles |
| `knowledge_read` | Read a specific article |
| `knowledge_write` | Create or update an article with validation |
| `knowledge_validate` | Check evidence freshness and consistency |
| `knowledge_curate` | Run a Mnemon Pass |

### Supported Clients

Any MCP-compatible tool, including but not limited to:
- Cursor IDE
- Claude Desktop
- VS Code with MCP extensions
- Custom MCP clients

## Setup

> **Version**: v0.0.3

### Prerequisites

- **git** — clone the repository
- **bash** — run setup.sh
- **Node.js** (v20+) and **npm** — build the MCP knowledge server

### Quick Start

```bash
git clone <this-repo> ~/arche
cd ~/arche
./setup.sh all          # Install for all supported tools
```

### Commands

```bash
./setup.sh <target> [<target> ...]   # Install/generate for specified targets
./setup.sh update <target>           # Re-copy agents/rules from source (global tools only)
./setup.sh status                    # Show what's installed where
./setup.sh -h | --help               # Usage
```

### Supported Tools

| Target | Type | Output | Description |
|--------|------|--------|-------------|
| `cursor` | Global | `~/.cursor/{agents,rules,knowledge}` | Cursor IDE (rules converted .md → .mdc) |
| `claude` | Global | `~/.claude/{agents,rules,knowledge}` + CLAUDE.md + MCP | Claude Code |
| `roo` | Global | `~/.roo/{rules,knowledge}` | Roo Code (agents installed as rule files) |
| `kilo` | Global | `~/.kilo/{rules,knowledge}` | Kilo Code (Roo fork, same structure) |
| `codex` | Workspace | `./AGENTS.md` | OpenAI Codex CLI |
| `gemini` | Workspace | `./GEMINI.md` + `.gemini/settings.json` | Gemini CLI |
| `aider` | Global | `~/.aider.conf.yml` + `~/.aider/CONVENTIONS.md` | Aider |
| `cline` | Workspace | `./.clinerules` | Cline |
| `copilot` | Workspace | `.github/copilot-instructions.md` + `./AGENTS.md` | GitHub Copilot |
| `windsurf` | Workspace | `./.windsurfrules` | Windsurf |
| `agents-md` | Workspace | `./AGENTS.md` | AGENTS.md standard (universal) |
| `all` | Meta | — | All global tools + workspace tools (if in project dir) |
| `workspace` | Meta | — | All workspace tools |

**Global tools** install to `~/.<tool>/` and are shared across all projects. **Workspace tools** generate files in the current working directory and are project-specific.

### Copy vs. Link Strategy

| Directory | Strategy | Rationale |
|-----------|----------|-----------|
| `agents/` | **Copy** | Distribution; agents rarely change, each tool gets its own copy |
| `rules/` | **Copy** | Distribution; tool-specific format conversion (e.g. .md → .mdc) |
| `knowledge/` | **Symlink** (`ln -sfn`) | Bidirectional; agents read and write back to `~/.arche/knowledge/` (seeded from repo on first install) |
| Generated files | **Template** | Created fresh from embedded templates (AGENTS.md, CLAUDE.md, etc.) |

### Examples

```bash
./setup.sh all                # All global tools
./setup.sh cursor claude      # Cursor + Claude Code only
./setup.sh workspace          # All workspace files in current dir
./setup.sh codex aider        # AGENTS.md + Aider config
./setup.sh update cursor      # Re-sync Cursor from source
./setup.sh status             # Show what's installed
```

### MCP Server

The Claude Code target (`./setup.sh claude`) automatically builds and registers the MCP knowledge server if the `claude` CLI is available. For manual setup:

```bash
cd mcp-server
npm install
npm run build

# Add to your MCP client configuration:
# {
#   "mcpServers": {
#     "knowledge": {
#       "command": "node",
#       "args": ["<path>/arche/mcp-server/dist/index.js"]
#     }
#   }
# }
```

## Theoretical Foundations

This framework draws on recent research in AI agent systems:

| Concept | Paper | arXiv | How Applied |
|---------|-------|-------|-------------|
| **Agentic Context Engineering** | Zhang et al. (2025) | [2510.04618](https://arxiv.org/abs/2510.04618) | Evolving playbooks via Generation → Reflection → Curation loop. Knowledge articles are the "playbooks" that accumulate and refine strategies. |
| **MindWatcher** | (2025) | [2512.23412](https://arxiv.org/abs/2512.23412) | Reasoning monitoring and quality capture. Anti-rationalization protocol ensures reasoning chains are recorded, not just conclusions. |
| **Hyperagents** | Zhang et al. (2026) | [2603.19461](https://arxiv.org/abs/2603.19461) | Metacognitive self-modification. Mnemon role implements self-referential improvement with explicit halting conditions to prevent infinite recursion. |
| **Agent-as-a-Judge** | Zhuge et al. (2024) | [2410.10934](https://arxiv.org/abs/2410.10934) | Structured evaluation with checklists. Polemarch Reviewer role uses checklist-based evaluation; Mnemon audits evaluation consistency. |
| **RedCoder** | (2025) | [2507.22063](https://arxiv.org/abs/2507.22063) | Adversarial red-teaming for code. Diabolos role stress-tests assumptions and challenges conclusions. |
| **MOSAIC** | (2025) | [2510.08804](https://arxiv.org/abs/2510.08804) | Multi-agent orchestration. Multi-layer review pipeline: Technites → Polemarch → Diabolos → Mnemon. |

For detailed theoretical analysis of the governance architecture — including historical collapse patterns, game-theoretic proofs, and the corruption paradox — see **[Governance Theory](docs/papers/001-governance-theory/en.md)** ([日本語](docs/papers/001-governance-theory/ja.md)).

## Knowledge Article Format

Every article follows a strict structure designed to prevent reasoning degradation:

```markdown
# Title

**Last Updated**: YYYY-MM-DD
**Confidence**: HIGH / MEDIUM / LOW (+ what would change it)
**Summary**: 1-2 sentences

## Context
What problem/question led to this knowledge

## Reasoning Chain
The actual steps taken, including dead ends and rejected hypotheses

## Alternatives Considered
What was rejected and why (negative knowledge)

## Key Findings
Conclusions

## Evidence
Verifiable references (file paths, outputs, URLs)

## Falsifiable Predictions
"If X is true, then Y should hold" — testable by future sessions

## Known Limitations
When this reasoning might be wrong

## Corrections Log
| Date | Correction |
|------|-----------|
```

## Design Principles

1. **Knowledge outlives sessions** — Every significant reasoning chain should be capturable
2. **Errors are data** — Corrections Logs are never deleted; wrong reasoning teaches more than right reasoning
3. **Demand, don't flood** — Knowledge is pulled when needed, not pushed into every context
4. **Strong models discover, weak models apply** — The knowledge base bridges the quality gap
5. **Self-improvement has limits** — Mnemon halts when returns diminish (Hyperagents insight)
6. **Transparency over performance** — A slower agent with auditable reasoning beats a fast agent with opaque conclusions
7. **No single point of failure** — No role is too important to constrain; all roles operate under Universal Role Standing
8. **Separation of powers** — Governance (Council), executive (Archon + Archontes), and legislative (law + regulation) are structurally independent

## License

Private. Research-level, in development.
