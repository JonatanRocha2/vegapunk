---
name: learning-journal
description: Teaches how and why technical work was completed and persists durable lessons in Markdown for the user and future AI sessions. Use automatically after meaningful code, configuration, infrastructure, debugging, architecture, or workflow changes, and when the user asks for an explanation, retrospective, walkthrough, learning record, or project memory; not for trivial or purely mechanical changes.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
  inspiration: apxxrv/session-teacher
---

# Learning Journal

Turn meaningful technical work into knowledge the user can understand and future
agents can verify and reuse.

## Workflow

1. Explain the problem or need that motivated the work.
2. Explain how the solution works, citing relevant files and symbols.
3. Explain why this approach was chosen, including constraints and trade-offs.
4. Mention only alternatives that were actually considered or remain relevant.
5. Provide tests, commands, or observable evidence that verify the result.
6. Extract the reusable principle, risk, or pitfall discovered during the work.

Keep the explanation proportional to the change. Do not expose private chain of
thought; provide concise, objective, and verifiable technical rationale.

When the user requests deep learning, teach incrementally. Ask the user to
restate key ideas in their own words and use practical questions to verify
understanding before declaring mastery.

## Project Memory

Store durable repository-specific lessons in:

```text
docs/learning/LEARNINGS.md
```

Follow an existing project convention instead when it already has an equivalent
location. Create or update the journal only when the work produced durable
knowledge. Keep entries append-only unless an earlier entry needs correction or
the same decision has evolved.

Use this format:

```markdown
## YYYY-MM-DD - Objective title

**Context:** The problem or need.

**Solution:** What changed, with file and symbol references.

**Decision:** Why this approach was selected and which constraints mattered.

**Verification:** Tests or observed evidence.

**Reusable lesson:** A principle that applies to future work.
```

Use the project's ADR mechanism for formal architectural decisions when one
exists. Link the journal entry to the ADR instead of duplicating it.

## Global Memory

Store only preferences and principles proven reusable across projects in:

```text
~/.agents/learning/LEARNINGS.md
```

Do not promote a convention from one repository to global memory automatically.
Require evidence from multiple projects or an explicit user instruction.

Before meaningful work, consult project and global learning records when they
exist. Treat them as context rather than immutable truth and validate them
against current code and instructions.

## Guardrails

- Record facts, decisions, and evidence, not conversation transcripts.
- Never persist secrets, credentials, personal data, or sensitive content.
- Do not invent alternatives, rationale, or test results.
- Distinguish verified facts from assumptions and unresolved hypotheses.
- Keep entries concise, searchable, and understandable without the original session.
- Do not modify memory files when there is no new durable knowledge.
- State which learning file was updated in the final response.
- If writing outside the workspace is unavailable, preserve project memory and
  report that global memory was not persisted.
