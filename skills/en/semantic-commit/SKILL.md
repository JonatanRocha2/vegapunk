---
name: semantic-commit
description: Creates and validates semantic Git commit messages using Conventional Commits, based on the actual staged diff and repository history. Use for commit messages, semantic commits, conventional commits, changelog-friendly history, or preparing a requested commit. Do not commit or push unless the user explicitly asks.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Semantic Commit

Describe the actual change precisely. Never invent scope, motivation, issue IDs, tests, or breaking changes.

## Workflow

1. Read repository instructions and inspect `git status`, the staged diff, the unstaged diff, and recent commit subjects.
2. If a commit was requested, verify which files are intended. Do not stage unrelated changes or modifications made by someone else.
3. Derive the primary user-visible or engineering intent from the staged diff, not from filenames alone.
4. Select the narrowest valid type and an optional scope consistent with repository history.
5. Write an imperative, concise subject with no trailing period. Keep it independently understandable.
6. Add a body only when the reason, behavior, migration, risk, or non-obvious trade-off needs explanation.
7. Add footers for breaking changes, issue references, co-authors, or repository-required metadata only when supported by evidence.
8. Validate that the message describes all staged changes. Split unrelated changes into separate commits when explicitly authorized.

## Conventional Commit Format

```text
<type>[optional scope][!]: <description>

[optional body]

[optional footer(s)]
```

Common types:

- `feat`: new user-facing capability.
- `fix`: defect correction.
- `refactor`: internal change without intended behavior change.
- `perf`: measurable performance improvement.
- `test`: test-only change.
- `docs`: documentation-only change.
- `build`: build system or dependency change.
- `ci`: CI/CD configuration or workflow change.
- `chore`: maintenance that fits no more specific type.
- `revert`: reverts an earlier commit.

Use `!` and a `BREAKING CHANGE:` footer only for an incompatible public behavior, API, schema, protocol, configuration, or operational contract.

## Guardrails

- Do not use `feat` for every code addition or `fix` for speculative cleanup.
- Do not bundle generated files, formatting, or dependency changes unless they belong to the same atomic change.
- Never bypass hooks, amend, force-push, or rewrite history without explicit instruction.
- Never expose secrets from diffs in the commit message.
- Run repository-required checks before committing when feasible, and report checks that were not run.

## Output

When only a message is requested, return the proposed message in a text block plus a one-line rationale if needed. When a commit is explicitly requested, show the selected files, checks run, resulting commit hash and subject, and confirm that no push occurred unless requested.
