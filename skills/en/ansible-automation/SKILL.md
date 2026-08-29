---
name: ansible-automation
description: Authors, reviews, tests, and troubleshoots Ansible playbooks, roles, inventories, collections, and automation workflows. Use for YAML automation, ansible-core, Ansible Lint, Molecule, variable precedence, idempotency, or safe rollout planning; not for unapproved production execution.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Ansible Automation

Build repeatable automation that is safe to rerun and clear about its target scope.

## Workflow

1. Inspect `ansible.cfg`, dependency manifests, inventories, variable directories, playbooks, roles, CI, and repository conventions before editing.
2. Confirm the intended hosts, environment, connection method, privilege escalation, supported Ansible version, and collection versions.
3. Prefer built-in module behavior over `command` or `shell`, use fully qualified collection names when ambiguity is possible, and keep roles cohesive.
4. Model desired state idempotently. Give tasks descriptive names, use handlers for service changes, and mark changed or failed behavior explicitly when modules cannot infer it.
5. Keep defaults overridable, required inputs validated, and variable ownership clear. Account for Ansible variable precedence instead of relying on accidental overrides.
6. Run syntax checks and the project's lint and tests. Use check and diff modes where supported, but do not treat them as proof when modules lack complete support.
7. Test idempotency and important failure paths in an isolated environment with the repository's existing Molecule or integration workflow.
8. For rollout, preview the exact inventory and host limit, start with a canary or small serial batch, verify handlers and health, then expand only after approval.

## Guardrails

- Never commit credentials, unencrypted secrets, vault passwords, private keys, tokens, or sensitive rendered output.
- Do not print secret variables; use `no_log: true` where output could expose them, while preserving enough non-sensitive diagnostics.
- Never run a playbook against production, rotate credentials, reboot hosts, or perform destructive package, storage, network, firewall, or account changes without explicit approval.
- Do not assume check mode predicts every change or that a successful task proves the managed service is healthy.
- Avoid blanket `ignore_errors`, broad privilege escalation, unbounded host patterns, and non-idempotent shell pipelines.
- Preserve repository-supported versions and dependency pins unless the task explicitly includes an upgrade.

## Verification Output

Report changed files, targeted hosts or test instances, syntax/lint/test commands, first-run and second-run results, expected changed count, skipped checks, rollout risk, and the exact production command only as a proposed command unless execution was approved.
