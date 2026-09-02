---
name: software-architecture
description: Designs or reviews software architecture, ADRs, service boundaries, APIs, data flows, scalability, resilience, migrations, and technical trade-offs. Use for software architecture, system design, modernization, monolith versus microservices, or platform decisions; not for cosmetic code changes.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Software Architecture

Make requirements and trade-offs explicit before recommending technology.

## Workflow

1. Inspect the existing system, constraints, team capabilities, and delivery stage.
2. Clarify business goals, users, scale, data sensitivity, compliance, budget, and timeline.
3. Define measurable quality attributes: availability, latency, throughput, durability, RTO, RPO, security, operability, and cost.
4. Map context, containers, trust boundaries, data ownership, synchronous calls, and asynchronous flows.
5. Generate at least two viable options, including the simplest option that can meet the requirements.
6. Compare options using evidence and explicit trade-offs. Avoid technology popularity as justification.
7. Choose incremental migration steps with rollback, coexistence, observability, and data reconciliation.
8. Record important decisions as ADRs and define validation experiments.

## Design Rules

- Prefer a modular monolith until independent scaling, ownership, deployment, or isolation creates a concrete need for services.
- Keep data ownership explicit. Do not share mutable schemas across independently deployed services.
- Treat distributed transactions, retries, ordering, deduplication, and idempotency as design concerns.
- Bound queues, caches, retries, fan-out, and concurrency. Every dependency needs timeout and failure behavior.
- Design authentication, authorization, secrets, audit, tenancy, and privacy into boundaries.
- Include deployability, testability, observability, support burden, and exit cost.
- Do not claim high availability without identifying failure domains and tested recovery paths.

## Deliverable

Return assumptions, requirements, current-state risks, proposed design, alternatives, decision matrix, data and failure flows, security boundaries, migration phases, verification plan, and unresolved questions. Use Mermaid only when a diagram improves comprehension. Label estimates and unknowns.
