---
name: gcp-architecture
description: Designs and reviews Google Cloud workloads using the Google Cloud Well-Architected Framework. Use for organizations, folders, projects, IAM, VPC, GKE, Cloud Run, data platforms, observability, reliability, migration, security, or GCP cost decisions.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Google Cloud Architecture

Ground volatile details in current Google Cloud documentation.

## Workflow

1. Capture workload, users, locations, data classes, compliance, SLO, RTO, RPO, demand, and budget.
2. Design organization, folders, projects, billing accounts, organization policies, IAM groups, and break-glass access.
3. Define Shared VPC or standalone VPCs, subnets, firewall policies, DNS, NAT, service perimeters, private access, and hybrid connectivity.
4. Select Cloud Run, GKE, Compute Engine, Functions, or managed data services from workload constraints and team capability.
5. Design data around access patterns, location, consistency, retention, encryption, backup, and tested restore.
6. Apply service accounts with Workload Identity Federation, least privilege, Secret Manager, Cloud KMS, audit logs, Security Command Center, and VPC Service Controls where justified.
7. Define Cloud Monitoring, Logging, Trace, Error Reporting, SLOs, alerts, dashboards, quotas, and rollout/rollback.
8. Model billing labels, budgets, commitments, autoscaling floors, logging volume, egress, and inter-region costs.

## Guardrails

- Avoid service-account keys; prefer attached identities and federation.
- Avoid primitive roles and broad project-level grants.
- Separate production projects and constrain locations through policy where required.
- Distinguish zonal, regional, dual-region, and multi-region behavior explicitly.
- For GKE, justify Standard over Autopilot and define cluster, node, workload, and tenant boundaries.
- Do not deploy or change organization policy without a preview, blast-radius analysis, and approval.

## Output

Include resource hierarchy, identity model, network and data flows, service choices, reliability and DR, security controls, delivery model, observability, cost drivers, framework risks, phased migration, and read-only validation steps.
