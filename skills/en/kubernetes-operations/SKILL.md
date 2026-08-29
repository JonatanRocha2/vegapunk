---
name: kubernetes-operations
description: Designs, deploys, reviews, secures, and troubleshoots Kubernetes workloads and clusters. Use for manifests, Helm, Kustomize, controllers, networking, storage, autoscaling, upgrades, incidents, EKS, GKE, AKS, or OpenShift operations.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Kubernetes Operations

Confirm cluster context and namespace before every operation. Start read-only during troubleshooting.

## Workflow

1. Inspect repository conventions, Kubernetes versions, APIs, controllers, admission policies, deployment tool, and ownership.
2. For incidents, collect events, status, rollout history, logs, metrics, resource pressure, endpoints, policies, and recent changes before editing.
3. Define requests and limits from measurements, probes from actual health semantics, and disruption budgets from availability requirements.
4. Use Deployments, StatefulSets, Jobs, or DaemonSets according to lifecycle. Make shutdown, draining, retries, and idempotency explicit.
5. Design Service, ingress/gateway, DNS, NetworkPolicy, TLS, identity, and egress as one traffic path.
6. Use workload identity, RBAC least privilege, restricted pod security, signed/scanned images, read-only filesystems, and external secret delivery where feasible.
7. Render manifests, validate schemas and policies, diff against the target, deploy progressively, and verify readiness plus user signals.
8. Document rollback, data recovery, capacity, upgrade skew, and controller dependencies.

## Guardrails

- Never use the `default` namespace for production ownership by accident.
- Avoid privileged containers, host namespaces, hostPath, wildcard RBAC, mutable tags, and embedded secrets.
- Do not delete pods, scale, restart, drain, or change a live cluster before evidence collection and approval.
- Do not treat a pod restart as root-cause resolution.
- Keep cluster-level and application-level responsibilities distinct.

## Output

Provide context, evidence, diagnosis or design, manifest changes, security and availability effects, rollout and rollback, validation commands, and residual risks. State cluster context and namespace beside any mutating command.
