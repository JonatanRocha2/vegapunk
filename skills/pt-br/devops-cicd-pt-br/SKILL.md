---
name: devops-cicd-pt-br
description: Projeta, revisa, protege e soluciona problemas de pipelines de CI/CD no GitHub Actions, GitLab CI, Azure DevOps, Jenkins e entregas em cloud. Use para build, testes, artefatos, supply chain, ambientes, aprovações, estratégias de implantação, releases ou falhas de pipeline.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# DevOps CI/CD

Otimize o lead time sem comprometer a reprodutibilidade, a segurança ou a capacidade de recuperação.

## Fluxo de trabalho

1. Mapeie o evento de origem, o nível de confiança, o ambiente de build, os testes, os artefatos, os registries, os ambientes, as aprovações, o destino da implantação e o rollback.
2. Reproduza a falha localmente ou com o menor job de diagnóstico possível antes de alterar o pipeline.
3. Faça o build uma única vez e promova entre os ambientes o mesmo artefato imutável e com checksum.
4. Fixe runtimes e actions/plugins de terceiros em versões controladas ou commits imutáveis.
5. Use OIDC ou federação de workloads para credenciais de cloud de curta duração. Restrinja ao mínimo as permissões de tokens e o acesso aos ambientes.
6. Separe a execução de pull requests não confiáveis dos secrets e dos caminhos privilegiados de implantação.
7. Paralelize verificações independentes, mantenha em cache somente entradas reproduzíveis, cancele execuções substituídas e retenha evidências úteis.
8. Implante com gates de integridade, estratégia canary, blue-green ou rolling conforme justificável, sinais para rollback automatizado e rastreabilidade da release.

## Gates obrigatórios

- Formatação, análise estática, testes unitários e testes relevantes de integração ou contrato.
- Verificações de dependências, secrets, IaC, containers e políticas adequadas ao risco.
- Proveniência do artefato, SBOM, assinatura ou atestado quando o risco da supply chain justificar.
- Preview ou plano, além de aprovação humana, para infraestrutura de produção com alto raio de impacto.
- Smoke tests após a implantação e observabilidade baseada em sinais percebidos pelos usuários.

## Restrições de segurança

Não exiba secrets, use credenciais administrativas de longa duração, implante tags mutáveis, refaça o build para cada ambiente, ignore verificações obrigatórias nem adicione novas tentativas indiscriminadas. Mantenha explícitas as permissões geradas e o acesso à rede.

## Saída

Retorne o gargalo ou risco atual, as etapas propostas para o pipeline, os limites de confiança, o modelo de credenciais, o uso de cache e artefatos, o caminho de implantação e rollback, a observabilidade, as alterações realizadas, os testes executados e os riscos residuais.
