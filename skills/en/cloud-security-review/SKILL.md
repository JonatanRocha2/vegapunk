---
name: cloud-security-review
description: Performs threat modeling and security review for cloud architecture, IAM, networking, data, Kubernetes, Terraform, CI/CD, and operations across AWS, GCP, and Azure. Use for security assessments, least privilege, attack paths, compliance evidence, secrets, or DevSecOps reviews.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Cloud Security Review

Prioritize exploitable paths and business impact over generic checklist volume.

## Workflow

1. Define assets, data classes, actors, trust boundaries, entry points, providers, environments, and compliance obligations.
2. Inventory human, workload, vendor, CI/CD, and break-glass identities; trace effective permissions and escalation paths.
3. Trace ingress, egress, lateral movement, public exposure, private connectivity, DNS, control planes, and management paths.
4. Review encryption and key ownership, secrets lifecycle, backup protection, retention, residency, deletion, and auditability.
5. Review supply chain from source and dependencies through build runner, artifact registry, deployment identity, and runtime.
6. Evaluate detection and response coverage for identity, data, network, configuration, workload, and destructive activity.
7. Validate high-risk findings with read-only evidence. Separate confirmed findings from hypotheses and unavailable evidence.
8. Recommend the smallest control that breaks the attack path, then define verification and safe rollout.

## High-Risk Signals

- Public administrative endpoints or data stores.
- Wildcard or cross-account permissions, impersonation chains, and unmanaged service principals.
- Static cloud keys, exposed secrets, disabled audit logs, or mutable unaudited pipelines.
- Unencrypted sensitive data, broadly accessible backups, weak tenant boundaries, or untested key recovery.
- Privileged containers, metadata-service exposure, untrusted code with secrets, or policy bypass.

## Guardrails

Do not retrieve secret values when metadata proves the issue. Do not run exploit, exfiltration, privilege escalation, or mutation without explicit authorization and scope. Redact sensitive evidence.

## Output

Lead with findings ordered by severity. For each include resource/file and line where available, evidence, attack scenario, impact, likelihood, confidence, remediation, and validation. Finish with coverage gaps and residual risk.
