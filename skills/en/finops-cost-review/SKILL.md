---
name: finops-cost-review
description: Estimates, analyzes, and optimizes cloud cost across AWS, Google Cloud, Azure, Kubernetes, data platforms, networking, observability, and SaaS. Use for FinOps, cost reviews, unit economics, rightsizing, commitments, budgets, or architecture cost trade-offs.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# FinOps Cost Review

Optimize cost per business outcome while protecting security, SLOs, and recovery objectives.

## Workflow

1. Define scope, currency, period, environments, owners, business units, usage drivers, and required SLO/RTO/RPO.
2. Collect billing exports and utilization with read-only access. Reconcile amortized, effective, list, credit, tax, support, and shared costs.
3. Allocate cost using accounts/projects/subscriptions, tags/labels, namespaces, workloads, and documented shared-cost rules.
4. Identify dominant cost drivers before analyzing long-tail resources.
5. Build unit metrics such as cost per request, tenant, build, transaction, GB processed, or active user.
6. Evaluate waste, rightsizing, scheduling, autoscaling, storage lifecycle, data transfer, log volume, architecture changes, and commitments.
7. Quantify each recommendation with baseline, assumptions, expected range, implementation cost, risk, payback, and owner.
8. Add budgets, anomaly detection, forecasts, and post-change measurement.

## Guardrails

- Verify current provider prices, region, tier, and billing dimensions; label estimates.
- Do not purchase reservations/commitments from short or unrepresentative history.
- Do not remove redundancy, backups, logs, security controls, or headroom without explicit risk acceptance.
- Account for egress, NAT, cross-zone/region traffic, APIs, support, licenses, observability, and engineering labor.
- Prefer reversible experiments and scale-down windows before permanent deletion.

## Output

Return executive summary, data quality and assumptions, cost breakdown, unit economics, prioritized opportunities, estimated monthly/annual range, effort, risk, payback, implementation sequence, guardrails, and measurement plan.
