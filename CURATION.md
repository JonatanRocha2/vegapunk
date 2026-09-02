# Curadoria e fontes

[English](CURATION.en.md) | **Português (Brasil)**

Revisado em 2026-09-02. A selecao privilegia documentacao oficial, escopo claro,
manutencao ativa, progressive disclosure e baixo risco operacional. Popularidade
nao substitui auditoria: uma skill e instrucao executavel pelo agente e deve ser
revisada antes de receber credenciais ou permissoes de escrita.

## Base oficial

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
- [Documentação Ansible](https://docs.ansible.com/)
- [Exames e preparação AWS Certification](https://aws.amazon.com/certification/exams/)
- [Microsoft Credentials](https://learn.microsoft.com/credentials/certifications/)
- [Certificações Google Cloud](https://cloud.google.com/learn/certification)
- [Certificações HashiCorp](https://developer.hashicorp.com/certifications)
- [Certificações Red Hat](https://www.redhat.com/en/services/certification)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [IETF RFC Editor](https://www.rfc-editor.org/)
- [MANRS network security](https://www.manrs.org/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)

## Upstream recomendado

| Fonte | Skills de destaque | Decisao |
| --- | --- | --- |
| `aws/agent-toolkit-for-aws` | aws-core, agents, data analytics, skills por serviço e MCP | Oficial e suportado pela AWS; preferir para implementação detalhada |
| `google/skills` | GKE basics e pilares do Google Cloud WAF | Oficial e excelente para aprofundar GCP |
| `hashicorp/agent-skills` | Terraform style, test, stacks e refactor-module | Oficial; instalar conforme o fluxo usado |
| `microsoft/skills` | cloud-solution-architect | Oficial para arquitetura Azure |
| `trailofbits/skills` | differential-review | Revisao de diff com foco forte em seguranca |
| `getsentry/skills` | sentry-workflow | Incidentes e review com contexto de producao |
| `datadog-labs/skills` | APM, logs e monitors | Operacao dependente de conta e CLI Datadog |
| `coderabbitai/skills` | code-review | Util se o servico CodeRabbit fizer parte do fluxo |
| `zxkane/aws-skills` | CDK, custo/operacoes e serverless EDA | Boa comunidade; nao e publicacao oficial da AWS |
| `JuliusBrussee/caveman` | caveman | Economia de saida; proxy opcional para entrada |
| `mattpocock/skills` | handoff | Skill MIT pequena para continuidade entre sessoes com remocao de dados sensiveis; instalada por padrao |
| `anthropics/skills` | frontend-design | Orientacao de design Apache-2.0 sem dependencia de runtime; instalada por padrao |
| `apxxrv/session-teacher` | teach | Referência MIT para ensino incremental; inspirou a skill autoral `learning-journal` com memória persistente |

O Agent Toolkit for AWS e um catálogo operacional, nao uma skill de preparacao
para certificacoes. Nao foi encontrada uma Agent Skill oficial da Ansible nem dos
vendors para preparacao de certificacoes. `ansible-automation` e
`certification-study` sao skills autorais deste repositorio; a segunda usa guias,
treinamentos e simulados oficiais como fontes atuais e recusa exam dumps ou
questoes recordadas de provas.

## O que nao instalar por padrao

- Colecoes com centenas de skills: aumentam colisoes e pioram descoberta.
- Skills que duplicam conhecimento ja coberto por uma skill mais focada.
- Plugins que executam mudancas cloud sem preview e aprovacao.
- Integracoes que exigem tokens de terceiros sem necessidade recorrente.
- Repositorios sem licenca clara, historico verificavel ou escopo definido.

## Politica de atualizacao

1. Reavaliar fontes trimestralmente ou quando um provider mudar seu framework.
2. Preferir links e conceitos estaveis a copiar documentacao extensa.
3. Testar descrições com prompts positivos e negativos nos dois idiomas.
4. Remover regras obsoletas em vez de acumular compatibilidade historica.
5. Registrar mudancas de comportamento relevantes no historico Git.
6. Receber atualizacoes externas por PR do Renovate, nunca por automerge, e
   revisar diff, licenca, digest, telemetria e comportamento de rede.
