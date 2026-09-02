# Security

**English** | [Português (Brasil)](SECURITY.md)

Agent Skills are executable instructions for an agent. Treat changes to
`SKILL.md`, installers, and external dependencies as code changes.

## Trust Model

- The 17 bilingual skills in this repository are MIT-licensed;
  `learning-journal` acknowledges inspiration from the MIT-licensed
  `apxxrv/session-teacher` skill.
- The installer runs a version-pinned npm `skills` CLI and copies the Caveman,
  `handoff`, `frontend-design`, and official `aws-core` skills directly from
  upstream at immutable commits.
- The `aws-core` installation copies Agent Skills only. It does not configure the
  AWS MCP Server, authenticate an account, or grant AWS permissions. Use
  `-NoAwsToolkit` or `--no-aws-toolkit` to skip it.
- `handoff` and `frontend-design` contain instructions and references only. They
  do not install executables or request credentials. Use `-NoRecommendedSkills`
  or `--no-recommended-skills` to skip them.
- The Caveman proxy is optional, installs another npm package, and may forward
  traffic to the provider. It is never enabled without `-WithCavemanProxy` or
  `--with-caveman-proxy`.
- Installers refuse elevated execution by default to limit the impact of a
  compromised dependency. Use the override only after reviewing the script and
  when installation genuinely requires that privilege.

## Guardrails

- Review remote scripts before using `iex` or piping to `sh`, especially after
  the repository or a pin changes.
- Never provide secrets, cloud tokens, or production access to a skill before
  reviewing its content and limiting the session's permissions.
- Use temporary least-privilege credentials and keep study and test environments
  separate from production.
- Do not accept destructive changes without a diff or plan, explicit target,
  backup or rollback, and human approval.
- Do not automerge external updates. Review authorship, licensing, changelog,
  release diff, digest, and telemetry or network changes.
- Run `npm test`, check the relevant installer syntax, and perform a
  credential-free installation before approving an update.

## Automated Updates

`renovate.json` tracks `skills`, the `aws-core`, `handoff`, and `frontend-design`
commits, the Caveman skill release and immutable commit, and
`@caveman-ai/cli`. Renovate waits three days after publication and opens PRs
without automerge. The configuration takes effect only after enabling the
Renovate GitHub App for the repository.

## Reporting A Vulnerability

Do not publish credentials or exploitable details in an issue. Prefer GitHub's
private security advisory channel; if it is unavailable, contact the maintainer
without secrets and arrange a private channel.
