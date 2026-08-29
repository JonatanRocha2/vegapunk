# Curation And Sources

**English** | [Português (Brasil)](CURATION.md)

Reviewed on 2026-08-29. This selection prioritizes official documentation,
clear scope, active maintenance, progressive disclosure, and low operational
risk. Popularity is not a substitute for auditing: a skill is executable agent
instruction and must be reviewed before receiving credentials or write access.

## Official Foundation

- [OpenAI: Build skills](https://developers.openai.com/codex/build-skills)
- [Agent Skills specification](https://agentskills.io/specification)
- [Vercel Skills CLI](https://skills.sh/docs/cli)
- [AWS Well-Architected](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [Google Cloud Well-Architected Framework](https://cloud.google.com/architecture/framework)
- [Azure Well-Architected Framework](https://learn.microsoft.com/azure/well-architected/)
- [Cloud Adoption Framework for Azure](https://learn.microsoft.com/azure/cloud-adoption-framework/)
- [Google SRE books](https://sre.google/books/)
- [Kubernetes documentation](https://kubernetes.io/docs/)
- [Terraform documentation](https://developer.hashicorp.com/terraform/docs)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)

## Recommended Upstream Sources

| Source | Notable skills | Decision |
| --- | --- | --- |
| `google/skills` | GKE basics and Google Cloud WAF pillars | Official and excellent for deeper GCP work |
| `hashicorp/skills` | Terraform style, test, stacks, and refactor-module | Official; install according to the workflow in use |
| `microsoft/skills` | cloud-solution-architect | Official Azure architecture guidance |
| `trailofbits/skills` | differential-review | Strong security-focused differential review |
| `getsentry/skills` | sentry-workflow | Incidents and review with production context |
| `datadog-labs/skills` | APM, logs, and monitors | Operations requiring a Datadog account and CLI |
| `coderabbitai/skills` | code-review | Useful when CodeRabbit is part of the workflow |
| `zxkane/aws-skills` | CDK, cost/operations, and serverless EDA | Good community source; not an official AWS publication |
| `JuliusBrussee/caveman` | caveman | Output savings; optional proxy for input compression |

## Not Installed By Default

- Collections with hundreds of skills, which increase collisions and hurt discovery.
- Skills that duplicate knowledge already covered by a more focused skill.
- Plugins that perform cloud mutations without preview and approval.
- Integrations that require third-party tokens without recurring need.
- Repositories without clear licensing, verifiable history, or defined scope.

## Update Policy

1. Reassess sources quarterly or when a provider changes its framework.
2. Prefer stable links and concepts over copying extensive documentation.
3. Test descriptions with positive and negative prompts in both languages.
4. Remove obsolete rules instead of accumulating historical compatibility.
5. Record meaningful behavior changes in Git history.
