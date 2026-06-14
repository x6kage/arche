# Model-Slug Availability Is IDE/Client-Dependent (not provider-dependent)

- **Last Updated:** 2026-06-13
- **Confidence:** HIGH (direct observation of the Task-dispatch allow-list this session + Telos correction on causation)
- **Scope:** Global / universal (applies to any Arche workspace; the rule is environment-conditional, not provider-specific).

## Context

While dispatching subagents under Regulation 4.1 ("All Task dispatches MUST specify `model: \"fast\"`"),
the operating agent observed that the Task-dispatch **allow-list did not expose a generic `fast` slug** —
only a single specific model id was selectable. An earlier draft of this article (and the first Reg 4.1
amendment) wrongly attributed the missing slug to the **model provider** ("because it's AWS Bedrock").

**The Telos corrected this:** slug availability **depends on the IDE / client implementation, not on the
model provider.** For example, Claude clients can accept an explicit JSON model spec; other clients expose
only a fixed allow-list. The same provider can be reachable through clients with different model-spec
capabilities. So the correct conditional is **"when a fast slug is not available (in this IDE/client)"** —
NOT "when running on provider X."

## Reasoning Chain (including dead ends)

1. Reg 4.1 (pre-amendment) read as an **absolute**: every non-Archon Task MUST carry `model: "fast"`.
2. Observed: this runtime's Task allow-list exposes no generic `fast` slug → the literal instruction was
   **unexecutable** (cannot set a slug the client won't accept).
3. **Dead end (corrected):** first attributed the absence to the provider (Bedrock). REJECTED after Telos
   correction — provider does not determine slug availability; the **IDE/client** does. Some clients (e.g.
   Claude) take an explicit JSON model spec; others only a fixed list. Attribution to a provider would
   produce a wrong, brittle rule.
4. Considered: fabricate/guess a slug → REJECTED (unrecognized slug → dispatch failure or silent fallback;
   never invent model ids).
5. Determined the semantics: **omitting `model` ⇒ subagent inherits the parent (dispatcher's) model.** On a
   strong-model parent, omission ⇒ subagents run strong. Omission is the *correct* mechanism when no fast
   slug is exposed — not a violation.
6. Reconciled with intent: Reg 4.1's *goal* (Article 7 — keep execution cheap, reserve strong models for
   decisions) is honored **by slug when a fast slug exists, and by the environment's available models when
   it does not.** Principle is environment-independent; mechanism is **IDE/client-conditional**.

## Key Findings

- **Slug availability is a property of the IDE / client, not the model provider.** Whether `model:"fast"`
  (or any explicit model spec) can be set depends on what the client's Task-dispatch surface accepts —
  some accept an explicit JSON model spec, some expose only a fixed allow-list.
- **Express the rule as a condition, not a provider name:** "when a fast slug is **not available**, omit
  `model`." Do NOT write "on Bedrock" / "on provider X."
- **Omitting `model` = parent-model inheritance**, and is compliant when no fast slug is available. NOT a
  violation — there is no slug to set.
- A regulation that hard-codes a specific slug name (or a specific provider) as a universal MUST goes stale
  / becomes unexecutable. **Encode the principle (cheap execution where possible); bind the mechanism to
  slug-availability, expressed conditionally.**
- A workspace on a strong-model-only / credit-backed posture (recorded in `governance.md` as a Reg 4.1
  exception) correctly inherits the strong model by omission.

## Alternatives Considered (rejected)

- *Keep the absolute "MUST specify fast" wording* — rejected: unexecutable where no fast slug is exposed.
- *Attribute the absence to the model provider (Bedrock)* — rejected (Telos correction): causation is
  IDE/client implementation, not provider. The provider-named rule would be wrong and brittle.
- *Hard-code the observed specific slug into the regulation* — rejected: slug ids change with client/SDK
  upgrades; that is the staleness this article warns against.
- *Per-call justification for every omission* — rejected: omission is the norm where no fast slug exists,
  not an exception needing justification.

## Evidence

- This session's Task-dispatch allow-list (single specific slug; no generic `fast`).
- Telos correction (2026-06-13): "slug absence depends on the IDE; Claude can specify via JSON; 'because
  Bedrock' is slightly wrong."
- Regulation 4.1 amended text (slug-availability clause, IDE/client-conditional) — `arche/rules/regulation.md`.
- `governance.md` Reg 4.1 amendment + strong-model-posture exception records.

## Falsifiable Predictions

- The SAME model provider reached through two different clients can differ in whether an explicit model
  spec is accepted — confirming IDE/client (not provider) is the determinant. (Testable by comparing two
  clients against one provider.)
- On a client that accepts an explicit JSON model spec, non-Archon dispatches can set a cheaper model and
  run cheaper than the parent — confirming the slug-availability split.
- If a client/SDK update adds a generic `fast` slug, the conditional clause auto-applies (set it when
  present) with no further amendment — confirming principle/mechanism separation.
- Passing a fabricated slug errors or is silently ignored — confirming "don't fabricate slugs."

## Corrections Log

- 2026-06-13 | Created as "Bedrock has no generic fast slug" (provider-attributed). **Superseded same day**
  by Telos correction: slug availability is **IDE/client-dependent, not provider-dependent** (Claude
  clients accept an explicit JSON model spec). Rewritten provider-agnostic; the operative condition is
  "when a fast slug is not available (in this IDE/client), omit `model` ⇒ parent inheritance." Reg 4.1
  amendment note corrected in lockstep.
