# Vegapunk Skills

[English](README.en.md) | **Português (Brasil)**

Curadoria pessoal de skills para Codex focada em cloud, DevOps, infraestrutura,
arquitetura, operações, code review e aprendizado contínuo. Cada skill possui
duas versões completas: inglês e português brasileiro.

O repositório segue o padrão aberto [Agent Skills](https://agentskills.io) e usa
progressive disclosure: o agente carrega os detalhes de uma skill somente quando
a tarefa corresponde à sua descrição.

## Instalar tudo

O idioma padrão é inglês.

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1 | iex
```

Linux, macOS ou WSL:

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh
```

Os comandos instalam globalmente as 17 skills em inglês, as skills oficiais do
`aws-core`, as skills selecionadas `handoff` e `frontend-design` e a skill MIT do
[Caveman](https://github.com/JuliusBrussee/caveman) para o Codex. Reexecute o
instalador para atualizar e reinicie o Codex se as skills não aparecerem.

Requisitos: Node.js 22.20 ou mais recente e Git. O `skills` CLI envia telemetria
anônima por padrão; defina `DISABLE_TELEMETRY=1` antes do comando para desativar.
Executar um script remoto implica confiança no conteúdo atual de `main`; revise o
script primeiro em ambientes sensíveis. Veja [SECURITY.md](SECURITY.md).

## Instalar Node.js

O instalador requer Node.js 22.20 ou mais recente. A versão LTS atual é
recomendada.

Windows com `winget`:

```powershell
winget install --id OpenJS.NodeJS.LTS --exact
```

Feche e reabra o terminal após a instalação.

Linux, macOS ou Google Cloud Workstations podem usar `nvm`. Como o `nvm` e o
Node.js ficam em `$HOME`, a instalação persiste no disco da Cloud Workstation:

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

Valide a instalação:

```bash
node --version
npm --version
```

## Escolher Idioma

Somente um pack deve ser instalado para evitar ativações duplicadas.
As skills externas `aws-core`, `handoff` e `frontend-design` são publicadas em
inglês e são as mesmas nos dois packs.

Inglês, a partir de um clone:

```powershell
.\install.ps1 -Language en
```

```bash
sh install.sh --lang en
```

Português brasileiro, diretamente do repositório remoto:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.ps1))) -Language pt-br
```

```bash
curl -fsSL https://raw.githubusercontent.com/JonatanRocha2/vegapunk/main/install.sh | sh -s -- --lang pt-br
```

## Catálogo

| Inglês | Português brasileiro | Uso principal |
| --- | --- | --- |
| `software-architecture` | `software-architecture-pt-br` | Decisões arquiteturais, ADRs, trade-offs e NFRs |
| `cloud-architecture` | `cloud-architecture-pt-br` | Arquitetura provider-neutral e multicloud |
| `aws-architecture` | `aws-architecture-pt-br` | AWS Well-Architected, contas, IAM, redes e serviços |
| `gcp-architecture` | `gcp-architecture-pt-br` | Google Cloud WAF, projetos, IAM, redes e serviços |
| `azure-architecture` | `azure-architecture-pt-br` | Azure WAF, assinaturas, Entra ID, redes e serviços |
| `terraform-infrastructure` | `terraform-infrastructure-pt-br` | Terraform/OpenTofu seguro, modular e testável |
| `kubernetes-operations` | `kubernetes-operations-pt-br` | Kubernetes para deploy, operação e troubleshooting |
| `devops-cicd` | `devops-cicd-pt-br` | Pipelines reproduzíveis, seguros e promovíveis |
| `sre-incident-response` | `sre-incident-response-pt-br` | SLOs, incidentes, runbooks e post-mortems |
| `cloud-security-review` | `cloud-security-review-pt-br` | Threat modeling e revisão de postura cloud/IaC |
| `finops-cost-review` | `finops-cost-review-pt-br` | Custos e FinOps sem degradar SLOs |
| `network-engineering` | `network-engineering-pt-br` | Design e troubleshooting de redes, DNS, TLS, cloud e híbrido |
| `ansible-automation` | `ansible-automation-pt-br` | Ansible idempotente, testável e com rollout seguro |
| `certification-study` | `certification-study-pt-br` | Estudo ético e atualizado para certificações oficiais de cloud e infraestrutura |
| `code-review` | `code-review-pt-br` | Revisão baseada em risco, evidências e testes |
| `semantic-commit` | `semantic-commit-pt-br` | Conventional Commits baseados no diff real |
| `learning-journal` | `learning-journal-pt-br` | Explicação das decisões e memória persistente de aprendizados técnicos |

As versões em inglês ficam em `skills/en/`. As versões brasileiras ficam em
`skills/pt-br/` e usam o sufixo `-pt-br` para manter nomes globalmente únicos.

O Caveman permanece externo e é instalado diretamente do upstream. Isso evita
vendoring, preserva autoria e licença e permite atualizações controladas.

## Skills externas recomendadas

O instalador padrão também copia duas skills em inglês, selecionadas com escopo
restrito e fixadas em commits imutáveis dos upstreams:

- [`handoff`](https://github.com/mattpocock/skills) resume uma sessão em um
  documento de transição com dados sensíveis removidos. Licença: MIT.
- [`frontend-design`](https://github.com/anthropics/skills) orienta interfaces
  distintas e responsivas sem adicionar ferramenta de runtime. Licença:
  Apache-2.0.

Nenhuma delas solicita credenciais ou instala executáveis. Para não instalá-las,
use `-NoRecommendedSkills` ou `--no-recommended-skills`.

## Toolkit Oficial da AWS

Para implementação detalhada em serviços AWS, o
[Agent Toolkit for AWS](https://github.com/aws/agent-toolkit-for-aws) é o catálogo
oficial e suportado pela AWS. O instalador padrão adiciona todas as skills de
`aws-core`, fixadas em um commit imutável, mas não configura o AWS MCP Server nem
solicita credenciais. Para não instalá-las, use `-NoAwsToolkit` ou
`--no-aws-toolkit`.

Para habilitar separadamente o plugin completo, incluindo o MCP, adicione o
marketplace:

```bash
codex plugin marketplace add aws/agent-toolkit-for-aws
```

Depois, use `/plugins` no Codex para revisar e instalar `aws-core`. Os plugins
`aws-agents` e `aws-data-analytics` são opções especializadas. Revise conta,
região, IAM, telemetria e permissões de escrita antes de habilitar o MCP.

## Caveman Proxy

O instalador padrão adiciona somente a skill de resposta concisa. O proxy, que
comprime entrada e envolve o Codex, é opcional porque usa componentes BSL-1.1,
encaminha tráfego ao provider e ativa telemetria anônima por padrão.

Windows, a partir de um clone:

```powershell
.\install.ps1 -WithCavemanProxy
```

Linux, macOS ou WSL:

```bash
sh install.sh --with-caveman-proxy
```

Leia a documentação de segurança e licenciamento do Caveman antes de habilitar
o proxy. Para desativar sua telemetria: `caveman telemetry off`.

As versões e o commit imutável das dependências externas ficam fixados no início
dos instaladores. O Renovate acompanha novas versões, espera três dias e abre
PRs sem automerge para revisão de changelog, licença, diff, digest, telemetria e
segurança.

## Princípios da Curadoria

- Skills pequenas e acionáveis, em vez de um mega-prompt.
- Fontes oficiais usadas como referência primária.
- Nenhuma mudança destrutiva de cloud sem plano, diff e aprovação humana.
- Nenhum segredo em código, logs, state ou respostas.
- Evidência e verificação antes de declarar sucesso.
- Arquitetura guiada por requisitos, não por catálogo de serviços.

Veja [CURATION.md](CURATION.md) para fontes e decisões ou
[CURATION.en.md](CURATION.en.md) para a versão em inglês.

## Desenvolvimento

```bash
npm test
```

O validador exige 17 skills por idioma, pares completos entre os packs,
frontmatter válido e correspondência com este catálogo. A CI usa permissões
somente de leitura, Actions fixadas por SHA e sem credenciais persistidas; também
valida os dois instaladores e a descoberta real pelo `skills` CLI.

## Licença

Conteúdo autoral deste repositório: [MIT](LICENSE). Dependências e skills
externas mantêm suas próprias licenças.
