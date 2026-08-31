# Curation And Sources

**English** | [Português (Brasil)](CURATION.md)

Reviewed on 2026-08-31. This selection prioritizes official documentation,
clear scope, active maintenance, progressive disclosure, and low operational
risk. Popularity is not a substitute for auditing: a skill is executable agent
instruction and must be reviewed before receiving credentials or write access.

## Official Foundation

- [OpenAI: Build skills](https://developers.openai.com/codex/build-skills)
- [Agent Skills specification](https://agentskills.io/specification)
- [Vercel Skills CLI](https://skills.sh/docs/cli)
- [AWS Well-Architected](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [Agent Toolkit for AWS](https://github.com/aws/agent-toolkit-for-aws)
- [Google Cloud Well-Architected Framework](https://cloud.google.com/architecture/framework)
- [Azure Well-Architected Framework](https://learn.microsoft.com/azure/well-architected/)
- [Cloud Adoption Framework for Azure](https://learn.microsoft.com/azure/cloud-adoption-framework/)
- [Google SRE books](https://sre.google/books/)
- [Kubernetes documentation](https://kubernetes.io/docs/)
- [Terraform documentation](https://developer.hashicorp.com/terraform/docs)
- [Ansible documentation](https://docs.ansible.com/)
- [AWS Certification exams and preparation](https://aws.amazon.com/certification/exams/)
- [Microsoft Credentials](https://learn.microsoft.com/credentials/certifications/)
- [Google Cloud certifications](https://cloud.google.com/learn/certification)
- [HashiCorp certifications](https://developer.hashicorp.com/certifications)
- [Red Hat certifications](https://www.redhat.com/en/services/certification)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [IETF RFC Editor](https://www.rfc-editor.org/)
- [MANRS network security](https://www.manrs.org/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)

## Recommended Upstream Sources

| Source | Notable skills | Decision |
| --- | --- | --- |
| `aws/agent-toolkit-for-aws` | aws-core, agents, data analytics, service skills, and MCP | Official and AWS-supported; prefer for detailed implementation |
| `google/skills` | GKE basics and Google Cloud WAF pillars | Official and excellent for deeper GCP work |
| `hashicorp/agent-skills` | Terraform style, test, stacks, and refactor-module | Official; install according to the workflow in use |
| `microsoft/skills` | cloud-solution-architect | Official Azure architecture guidance |
| `trailofbits/skills` | differential-review | Strong security-focused differential review |
| `getsentry/skills` | sentry-workflow | Incidents and review with production context |
| `datadog-labs/skills` | APM, logs, and monitors | Operations requiring a Datadog account and CLI |
| `coderabbitai/skills` | code-review | Useful when CodeRabbit is part of the workflow |
| `zxkane/aws-skills` | CDK, cost/operations, and serverless EDA | Good community source; not an official AWS publication |
| `JuliusBrussee/caveman` | caveman | Output savings; optional proxy for input compression |
| `mattpocock/skills` | handoff | Small MIT skill for redacted continuity between sessions; installed by default |
| `anthropics/skills` | frontend-design | Apache-2.0 design guidance with no runtime dependency; installed by default |

The Agent Toolkit for AWS is an operational catalog, not a certification-prep
skill. No official Ansible Agent Skill or certification-preparation Agent Skill
from these vendors was found. `ansible-automation` and `certification-study` are
original skills in this repository; the latter uses current official guides,
training, and practice materials and rejects exam dumps or recalled questions.

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
6. Receive external updates through Renovate PRs, never automerge them, and
   review diffs, licensing, digests, telemetry, and network behavior.
