# Vegapunk Skills

[English](README.en.md) | **Português (Brasil)**

Curadoria pessoal de skills para Codex focada em cloud, DevOps, infraestrutura,
arquitetura, operações e code review. Cada skill possui duas versões completas:
inglês e português brasileiro.

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

Os comandos instalam globalmente as 12 skills em inglês e a skill MIT do
[Caveman](https://github.com/JuliusBrussee/caveman) para o Codex. Reexecute o
instalador para atualizar e reinicie o Codex se as skills não aparecerem.

Requisito: Node.js 22.20 ou mais recente. O `skills` CLI envia telemetria
anônima por padrão; defina `DISABLE_TELEMETRY=1` antes do comando para desativar.

## Escolher Idioma

Somente um pack deve ser instalado para evitar ativações duplicadas.

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
| `code-review` | `code-review-pt-br` | Revisão baseada em risco, evidências e testes |

As versões em inglês ficam em `skills/en/`. As versões brasileiras ficam em
`skills/pt-br/` e usam o sufixo `-pt-br` para manter nomes globalmente únicos.

O Caveman permanece externo e é instalado diretamente do upstream. Isso evita
vendoring, preserva autoria e licença e permite atualizações controladas.

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

Os instaladores fixam `skills@1.5.23`, Caveman `v2.3.1` pelo commit verificado
`b5ec635` e, quando solicitado, `@caveman-ai/cli@1.2.5`. Atualize esses pins de
forma deliberada depois de revisar changelog, licença e segurança.

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

O validador exige 12 skills por idioma, pares completos entre os packs,
frontmatter válido e correspondência com este catálogo. A CI também testa a
descoberta real pelo `skills` CLI.

## Licença

Conteúdo autoral deste repositório: [MIT](LICENSE). Dependências e skills
externas mantêm suas próprias licenças.
