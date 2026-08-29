---
name: cloud-architecture
description: Designs provider-neutral or multi-cloud architectures and compares AWS, Google Cloud, and Azure trade-offs. Use for cross-cloud strategy, landing zones, provider selection, migrations, or organization-wide Well-Architected reviews. For a workload confined to one provider, use its AWS, GCP, or Azure architecture skill instead.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Cloud Architecture

Use provider Well-Architected guidance, but derive the answer from workload requirements.

## Assessment

1. Establish workload purpose, criticality, environments, regions, users, traffic, data classes, and regulations.
2. Quantify SLOs, latency, throughput, growth, RTO, RPO, retention, and cost guardrails.
3. Inventory identities, accounts/projects/subscriptions, networks, DNS, certificates, compute, data, integrations, and deployment paths.
4. Identify trust boundaries, failure domains, quotas, single points of failure, manual operations, and vendor dependencies.
5. Evaluate security, reliability, operational excellence, performance, cost, and sustainability.

## Design Defaults

- Separate production from non-production using provider isolation boundaries.
- Prefer workload identity and short-lived credentials over static keys.
- Use private connectivity where justified, centralized policy, immutable audit logs, and encryption with deliberate key ownership.
- Select managed services when reduced operations outweigh lock-in and constraints.
- Design zone failure by default; add multi-region only when business RTO/RPO and failure analysis justify its cost.
- Make infrastructure reproducible through reviewed IaC and automated policy checks.
- Define telemetry, ownership, runbooks, backup restoration tests, rollback, and cost allocation before launch.
- Avoid multi-cloud unless a specific regulatory, acquisition, customer, or resilience requirement repays duplicated complexity.

## Deliverable

Provide assumptions, target architecture, provider mappings, identity and network model, data and DR strategy, deployment model, observability, cost drivers, risks, alternatives, phased roadmap, and acceptance tests. Distinguish facts from estimates and link current official documentation for volatile service limits or pricing.
