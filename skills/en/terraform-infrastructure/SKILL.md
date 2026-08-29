---
name: terraform-infrastructure
description: Authors, reviews, tests, imports, refactors, and troubleshoots Terraform or OpenTofu infrastructure. Use for HCL, modules, providers, state, plans, drift, CI, migrations, or IaC security; not for applying production changes without explicit approval.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.1"
  language: "en"
---

# Terraform Infrastructure

Preserve state integrity and make the smallest safe infrastructure change.

## Workflow

1. Inspect required versions, providers, modules, backends, lock file, workspace/environment strategy, and repository conventions.
2. Identify the desired resource lifecycle and whether existing objects or addresses must be preserved.
3. Prefer typed variables, validation, meaningful outputs, provider constraints, and small cohesive modules.
4. Run formatting and static validation, then provider-specific lint, security, policy, and tests already used by the project.
5. Produce a saved or CI-recorded plan. Read every create, update, replace, delete, unknown, and sensitive-value implication.
6. For refactors, use `moved`, `import`, or state operations deliberately; back up and lock state before exceptional state manipulation.
7. Apply only after approval in the intended account, project, subscription, region, and workspace.
8. Verify the real resource, outputs, health, policy, drift, and rollback or recovery path.

## Guardrails

- Never place credentials or secret values in HCL, variable files, plans, outputs, logs, or state unnecessarily.
- Treat plans and state as sensitive artifacts.
- Do not use `-target` as routine deployment strategy.
- Avoid provisioners when a provider or image/bootstrap mechanism can model the lifecycle.
- Pin provider ranges deliberately and commit the dependency lock file for root modules.
- Do not add `ignore_changes` merely to hide unexplained drift.
- Never run `apply`, `destroy`, forced unlock, or state mutation without explicit approval and scope confirmation.

## Specialized Official Guidance

For focused Terraform work, consult the relevant skill in HashiCorp's official
[`hashicorp/agent-skills`](https://github.com/hashicorp/agent-skills) catalog,
including style, tests, stacks, module refactoring, policy, and resource import.
Use those instructions selectively rather than installing overlapping skills by
default. Keep this skill as the provider-neutral safety and lifecycle workflow.

## Review Output

Report findings by severity with file and line, expected plan impact, state/migration risk, security and cost implications, missing tests, commands executed, and residual risk. If authoring code, leave it formatted and validated and show the plan summary without claiming deployment.
