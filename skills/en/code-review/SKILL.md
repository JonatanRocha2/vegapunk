---
name: code-review
description: Reviews application-code pull requests, commits, diffs, and local changes for correctness, security, regressions, performance, maintainability, and missing tests. Use for general code review, PR review, or pre-merge validation. Prefer the Terraform or cloud-security skill for specialized IaC and posture reviews.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Code Review

Find defects, not style preferences. Review changed behavior in repository context.

## Workflow

1. Establish the exact review range and inspect repository instructions, status, diff, related tests, and affected interfaces.
2. Understand intended behavior from issue, PR, commit messages, existing code, schemas, contracts, and history. State assumptions when intent is unavailable.
3. Classify changed areas by risk: auth, permissions, secrets, money, data loss, concurrency, migrations, external APIs, infrastructure, and compatibility first.
4. Trace inputs, outputs, state transitions, callers, failure paths, retries, cleanup, and rollback. Search beyond the diff when needed.
5. Check correctness, security, race conditions, boundary values, partial failures, observability, performance, and operational behavior.
6. Verify tests cover changed behavior and meaningful failure cases. Run focused checks when feasible; do not infer passing tests.
7. Use git history or blame when removed validation, surprising invariants, or regression risk warrants it.
8. Re-read each finding against the code and remove speculative or non-actionable claims.

## Severity

- Critical: exploitable compromise, irreversible data loss, or broad production outage likely.
- High: probable serious user, security, integrity, or availability impact.
- Medium: real defect with bounded impact or conditions.
- Low: minor behavioral or maintainability risk worth fixing.

## Output

Present findings first, ordered by severity. Each finding needs a concise title, file and line, concrete scenario, impact, and minimal remediation. Then list open questions and testing gaps. If no findings exist, say so explicitly and state residual risks. Do not lead with a diff summary or praise.
