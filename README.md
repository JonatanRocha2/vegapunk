# Vegapunk Skills

A personal Codex skills collection focused on cloud, DevOps, infrastructure,
architecture, operations, code review, and continuous learning.

The repository follows the open [Agent Skills](https://agentskills.io) standard
and uses progressive disclosure: the agent loads a skill's detailed instructions
only when a task matches its description.

## Install Everything

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1 | iex
```

Linux, macOS, or WSL:

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh
```

These commands globally install the 17 English skills, the official `aws-core`
skills, the curated `handoff` and `frontend-design` skills, and the MIT
[Caveman](https://github.com/JuliusBrussee/caveman) skill for Codex. Rerun the
installer to update and restart Codex if the skills do not appear.

Requirements: Node.js 22.20 or newer and Git. The `skills` CLI sends anonymous telemetry
by default; set `DISABLE_TELEMETRY=1` before running the command to opt out.
Running a remote script trusts the current contents of `main`; review the script
first in sensitive environments. See [SECURITY.md](SECURITY.md).

## Update Repository Skills Only

Use these commands to refresh only the 17 skills published by Vegapunk. They
read the current remote repository and do not reinstall `aws-core`, `handoff`,
`frontend-design`, or Caveman.

Windows PowerShell:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1))) -RepoOnly
```

Linux, macOS, or WSL:

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh -s -- --repo-only
```

These commands update globally installed copies. They do not modify a local
Vegapunk clone.

## Install Node.js

The installer requires Node.js 22.20 or newer. The current LTS release is
recommended.

Windows with `winget`:

```powershell
winget install --id OpenJS.NodeJS.LTS --exact
```

Close and reopen the terminal after installation.

Linux, macOS, and Google Cloud Workstations can use `nvm`. Because `nvm` and
Node.js are stored under `$HOME`, the installation persists on the Cloud
Workstation disk:

```bash
export NVM_DIR="$HOME/.nvm"
test -d "$NVM_DIR/.git" || git clone --branch v0.40.3 --depth 1 \
  https://github.com/nvm-sh/nvm.git "$NVM_DIR"

profile="$HOME/.bashrc"
[ -n "${ZSH_VERSION:-}" ] && profile="$HOME/.zshrc"
grep -q 'NVM_DIR="$HOME/.nvm"' "$profile" 2>/dev/null || \
  printf '\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"\n' >> "$profile"

. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm alias default 'lts/*'
```

Verify the installation:

```bash
node --version
npm --version
```

## Install From A Clone

Windows PowerShell:

```powershell
.\install.ps1
```

Linux, macOS, or WSL:

```bash
sh install.sh
```

## Catalog

| Skill | Primary purpose |
| --- | --- |
| `software-architecture` | Architecture decisions, ADRs, trade-offs, and NFRs |
| `cloud-architecture` | Provider-neutral and multi-cloud architecture |
| `aws-architecture` | AWS Well-Architected, accounts, IAM, networking, and services |
| `gcp-architecture` | Google Cloud WAF, projects, IAM, networking, and services |
| `azure-architecture` | Azure WAF, subscriptions, Entra ID, networking, and services |
| `terraform-infrastructure` | Secure, modular, and testable Terraform/OpenTofu |
| `kubernetes-operations` | Kubernetes delivery, operations, and troubleshooting |
| `devops-cicd` | Reproducible, secure, and promotable pipelines |
| `sre-incident-response` | SLOs, incidents, runbooks, and postmortems |
| `cloud-security-review` | Threat modeling and cloud/IaC posture reviews |
| `finops-cost-review` | Cost and FinOps without degrading SLOs |
| `network-engineering` | Network design and troubleshooting across DNS, TLS, cloud, and hybrid environments |
| `ansible-automation` | Idempotent, testable Ansible with safe rollouts |
| `certification-study` | Ethical, current preparation for official cloud and infrastructure certifications |
| `code-review` | Risk-, evidence-, and test-driven code review |
| `semantic-commit` | Conventional Commits grounded in actual diff |
| `learning-journal` | Decision explanations and persistent memory for technical lessons |

Skills live in `skills/en/`.

Caveman remains external and is installed directly from upstream. This avoids
vendoring, preserves attribution and licensing, and enables controlled updates.

## Recommended External Skills

The default installer also copies two narrowly selected English skills at
immutable upstream commits:

- [`handoff`](https://github.com/mattpocock/skills) compacts a session into a
  redacted handoff document for another agent or context window. License: MIT.
- [`frontend-design`](https://github.com/anthropics/skills) guides distinctive,
  responsive interface design without adding a runtime tool. License: Apache-2.0.

Neither skill requests credentials or installs an executable. Use
`-NoRecommendedSkills` or `--no-recommended-skills` to skip both.

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
.\install.ps1 -WithCavemanProxy
```

On Linux, macOS, or WSL:

```bash
sh install.sh --with-caveman-proxy
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

See [CURATION.md](CURATION.md) for sources and decisions.

## Development

```bash
npm test
```

The validator requires 17 English skills, valid frontmatter, and consistency
with the catalog. CI uses read-only permissions, SHA-pinned Actions, and no
persisted credentials; it also validates both installers and actual discovery
through the `skills` CLI.

## License

Original repository content is [MIT licensed](LICENSE). External dependencies
and skills retain their own licenses.
