# Vegapunk Skills

**English** | [Português (Brasil)](README.md)

A personal Codex skills collection focused on cloud, DevOps, infrastructure,
architecture, operations, and code review. Every skill has two complete
versions: English and Brazilian Portuguese.

The repository follows the open [Agent Skills](https://agentskills.io) standard
and uses progressive disclosure: the agent loads a skill's detailed instructions
only when a task matches its description.

## Install Everything

English is the default language.

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1 | iex
```

Linux, macOS, or WSL:

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh
```

These commands globally install the 16 English skills, the official `aws-core`
skills, and the MIT [Caveman](https://github.com/JuliusBrussee/caveman) skill for
Codex. Rerun the installer to update and restart Codex if the skills do not
appear.

Requirement: Node.js 22.20 or newer. The `skills` CLI sends anonymous telemetry
by default; set `DISABLE_TELEMETRY=1` before running the command to opt out.
Running a remote script trusts the current contents of `main`; review the script
first in sensitive environments. See [SECURITY.en.md](SECURITY.en.md).

## Choose A Language

Install only one pack to avoid duplicate activations.
The external official `aws-core` skills are published by AWS in English and are
the same for both language packs.

English, from a local clone:

```powershell
.\install.ps1 -Language en
```

```bash
sh install.sh --lang en
```

English, directly from the remote repository:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1))) -Language en
```

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh -s -- --lang en
```

Use `-Language pt-br` or `--lang pt-br` for Brazilian Portuguese.

## Catalog

| English | Brazilian Portuguese | Primary purpose |
| --- | --- | --- |
| `software-architecture` | `software-architecture-pt-br` | Architecture decisions, ADRs, trade-offs, and NFRs |
| `cloud-architecture` | `cloud-architecture-pt-br` | Provider-neutral and multi-cloud architecture |
| `aws-architecture` | `aws-architecture-pt-br` | AWS Well-Architected, accounts, IAM, networking, and services |
| `gcp-architecture` | `gcp-architecture-pt-br` | Google Cloud WAF, projects, IAM, networking, and services |
| `azure-architecture` | `azure-architecture-pt-br` | Azure WAF, subscriptions, Entra ID, networking, and services |
| `terraform-infrastructure` | `terraform-infrastructure-pt-br` | Secure, modular, and testable Terraform/OpenTofu |
| `kubernetes-operations` | `kubernetes-operations-pt-br` | Kubernetes delivery, operations, and troubleshooting |
| `devops-cicd` | `devops-cicd-pt-br` | Reproducible, secure, and promotable pipelines |
| `sre-incident-response` | `sre-incident-response-pt-br` | SLOs, incidents, runbooks, and postmortems |
| `cloud-security-review` | `cloud-security-review-pt-br` | Threat modeling and cloud/IaC posture reviews |
| `finops-cost-review` | `finops-cost-review-pt-br` | Cost and FinOps without degrading SLOs |
| `network-engineering` | `network-engineering-pt-br` | Network design and troubleshooting across DNS, TLS, cloud, and hybrid environments |
| `ansible-automation` | `ansible-automation-pt-br` | Idempotent, testable Ansible with safe rollouts |
| `certification-study` | `certification-study-pt-br` | Ethical, current preparation for official cloud and infrastructure certifications |
| `code-review` | `code-review-pt-br` | Risk-, evidence-, and test-driven code review |
| `semantic-commit` | `semantic-commit-pt-br` | Conventional Commits grounded in the actual diff |

English versions live in `skills/en/`. Brazilian versions live in
`skills/pt-br/` and use the `-pt-br` suffix to preserve globally unique names.

Caveman remains external and is installed directly from upstream. This avoids
vendoring, preserves attribution and licensing, and enables controlled updates.

## Official AWS Toolkit

For detailed AWS service implementation, the
[Agent Toolkit for AWS](https://github.com/aws/agent-toolkit-for-aws) is the
official AWS-supported catalog. The default installer adds all `aws-core` skills
at an immutable commit, but does not configure the AWS MCP Server or request
credentials. Use `-NoAwsToolkit` or `--no-aws-toolkit` to skip them.

To enable the complete plugin separately, including its MCP, add the marketplace:

```bash
codex plugin marketplace add aws/agent-toolkit-for-aws
```

Then use `/plugins` in Codex to review and install `aws-core`. `aws-agents` and
`aws-data-analytics` are specialized alternatives. Review the account, Region,
IAM, telemetry, and write permissions before enabling the MCP.

## Caveman Proxy

The default installer adds only the concise-output skill. The proxy, which
compresses input and wraps Codex, is optional because it includes BSL-1.1
components, forwards traffic to the provider, and enables anonymous telemetry
by default.

From a local clone on Windows:

```powershell
.\install.ps1 -Language en -WithCavemanProxy
```

On Linux, macOS, or WSL:

```bash
sh install.sh --lang en --with-caveman-proxy
```

Read Caveman's security and licensing documentation before enabling the proxy.
Disable its telemetry with `caveman telemetry off`.

External dependency versions and the immutable commit are pinned at the top of
both installers. Renovate tracks new versions, waits three days, and opens PRs
without automerge for review of changelogs, licensing, diffs, digests, telemetry,
and security.

## Curation Principles

- Small, actionable skills instead of a mega-prompt.
- Official sources as the primary reference.
- No destructive cloud changes without a plan, diff, and human approval.
- No secrets in code, logs, state, or responses.
- Evidence and verification before declaring success.
- Architecture driven by requirements, not service catalogs.

See [CURATION.en.md](CURATION.en.md) for sources and decisions, or
[CURATION.md](CURATION.md) for Brazilian Portuguese.

## Development

```bash
npm test
```

The validator requires 16 skills per language, complete language pairs, valid
frontmatter, and consistency with the catalog. CI uses read-only permissions,
SHA-pinned Actions, and no persisted credentials; it also validates both
installers and actual discovery through the `skills` CLI.

## License

Original repository content is [MIT licensed](LICENSE). External dependencies
and skills retain their own licenses.
