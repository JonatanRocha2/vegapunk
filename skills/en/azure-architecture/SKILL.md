---
name: azure-architecture
description: Designs and reviews Microsoft Azure workloads using Azure Well-Architected and Cloud Adoption Framework guidance. Use for tenants, management groups, subscriptions, Entra ID, networking, AKS, App Service, Functions, data, governance, security, resilience, or Azure cost decisions.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Azure Architecture

Verify current limits, service availability, API versions, and prices in Microsoft Learn and Azure pricing sources.

## Workflow

1. Define workload, regions, data classification, regulations, SLO, RTO, RPO, traffic, and budget.
2. Design tenant, management groups, subscriptions, resource groups, Azure Policy, RBAC, naming, tags, and break-glass access.
3. Choose hub-spoke, Virtual WAN, or simpler networking based on scale. Define VNets, subnets, DNS, egress, Private Link, firewall, DDoS, and hybrid links.
4. Select AKS, Container Apps, App Service, Functions, VMs, or managed platforms from application and operations requirements.
5. Select storage and databases from access, consistency, residency, scale, backup, and recovery needs.
6. Apply managed identities, least-privilege RBAC, Key Vault, Defender for Cloud, encryption, diagnostic settings, and immutable audit retention.
7. Define Azure Monitor, Log Analytics, Application Insights, alerts, deployment rings, rollback, quotas, backup, and restore tests.
8. Model reservations or savings plans, Azure Hybrid Benefit, egress, logs, idle resources, and cost allocation.

## Guardrails

- Prefer managed identity; do not create client secrets when federation is available.
- Avoid Owner and Contributor at broad scopes without explicit justification.
- Keep production in separate subscriptions when isolation and governance warrant it.
- State availability-zone and region support instead of assuming uniform coverage.
- Treat landing-zone complexity as optional until organizational scale requires it.
- Preview Bicep, ARM, or Terraform changes and obtain approval before mutation.

## Output

Include hierarchy, identity, network and data design, service rationale, zone/region failure behavior, DR, security and policy, delivery, observability, cost drivers, risks, roadmap, and read-only validation steps.
