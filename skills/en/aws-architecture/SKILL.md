---
name: aws-architecture
description: Designs and reviews AWS workloads using AWS Well-Architected guidance. Use for AWS accounts and Organizations, IAM, VPC networking, compute, storage, databases, serverless, event-driven systems, observability, disaster recovery, security, or cost decisions.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.1"
  language: "en"
---

# AWS Architecture

Verify current service behavior, quotas, regional availability, and pricing in official AWS documentation before finalizing a design.

## Workflow

1. Capture workload requirements, data classification, Regions, SLO, RTO, RPO, traffic, and budget.
2. Establish the AWS Organizations and account model, SCP boundaries, identity federation, break-glass access, and audit account.
3. Design VPCs, subnets, routing, ingress, egress, DNS, endpoints, inspection, and hybrid connectivity. Minimize NAT and cross-AZ surprises.
4. Choose compute from requirements: Lambda, ECS/Fargate, EKS, EC2, Batch, or managed application services.
5. Choose data services from access patterns, consistency, scale, recovery, and operational needs, not familiarity.
6. Define event contracts, idempotency, retries, DLQs, ordering, and replay for SQS, SNS, EventBridge, Kinesis, or Step Functions.
7. Apply least-privilege IAM, KMS strategy, Secrets Manager or Parameter Store, CloudTrail, Config, GuardDuty, and Security Hub as appropriate.
8. Define CloudWatch metrics/logs/alarms, tracing, deployment rollback, backups, restore tests, quotas, and cost allocation.

## Guardrails

- Prefer roles and workload identity; never embed access keys.
- Avoid wildcard IAM unless the resource model makes it unavoidable and the exception is documented.
- Use multiple AZs for production stateful workloads when the SLO requires it.
- Treat multi-Region as an application and data-consistency design, not a checkbox.
- Model request, storage, data transfer, NAT Gateway, logs, KMS, and cross-AZ costs.
- Use CloudFormation, CDK, Terraform, or OpenTofu with preview and policy checks; do not mutate production from an unreviewed command.

## Specialized Official Guidance

For implementation-level AWS work, use the relevant skill or plugin from the
official AWS-supported
[`aws/agent-toolkit-for-aws`](https://github.com/aws/agent-toolkit-for-aws),
including `aws-core`, `aws-agents`, `aws-data-analytics`, and service-specific
skills. Keep this skill for architecture-wide requirements, trade-offs, and
Well-Architected review. Before enabling the toolkit's MCP server, confirm the
AWS identity, Region, account, least-privilege policy, audit trail, and whether
the task requires read or write access.

## Output

Include account topology, architecture and data flows, IAM and network boundaries, failure scenarios, DR procedure, deployment path, observability, estimated cost drivers, Well-Architected risks, and verification commands that are read-only unless execution is explicitly approved.
