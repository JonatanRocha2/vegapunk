---
name: devops-cicd
description: Designs, reviews, secures, and troubleshoots CI/CD pipelines for GitHub Actions, GitLab CI, Azure DevOps, Jenkins, and cloud delivery. Use for build, test, artifacts, supply chain, environments, approvals, deployment strategies, releases, or pipeline failures.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# DevOps CI/CD

Optimize lead time without weakening reproducibility, security, or recovery.

## Workflow

1. Map source event, trust level, build environment, tests, artifacts, registries, environments, approvals, deployment target, and rollback.
2. Reproduce a failure locally or with the smallest diagnostic job before changing the pipeline.
3. Build once and promote the same immutable, checksummed artifact across environments.
4. Pin runtimes and third-party actions/plugins to controlled versions or immutable commits.
5. Use OIDC or workload federation for short-lived cloud credentials. Scope token permissions and environment access minimally.
6. Separate untrusted pull-request execution from secrets and privileged deployment paths.
7. Parallelize independent checks, cache only reproducible inputs, cancel superseded runs, and retain useful evidence.
8. Deploy with health gates, canary/blue-green/rolling strategy as justified, automated rollback signals, and release traceability.

## Required Gates

- Formatting, static analysis, unit tests, and relevant integration/contract tests.
- Dependency, secret, IaC, container, and policy checks appropriate to risk.
- Artifact provenance, SBOM, signature, or attestation where supply-chain risk warrants it.
- Preview or plan plus human approval for high-blast-radius production infrastructure.
- Post-deploy smoke tests and observability against user-facing signals.

## Guardrails

Do not print secrets, use long-lived administrator credentials, deploy mutable tags, rebuild per environment, bypass required checks, or add blind retries. Keep generated permissions and network access explicit.

## Output

Return the current bottleneck or risk, proposed pipeline stages, trust boundaries, credential model, caching and artifacts, deployment/rollback path, observability, changes made, tests run, and residual risks.
