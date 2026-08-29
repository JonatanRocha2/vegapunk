---
name: finops-cost-review-pt-br
description: Estima, analisa e otimiza custos de cloud na AWS, no Google Cloud, no Azure, no Kubernetes, em plataformas de dados, redes, observabilidade e SaaS. Use para FinOps, revisões de custos, unit economics, rightsizing, compromissos de uso, orçamentos ou trade-offs de custo arquitetural.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Revisão de Custos FinOps

Otimize o custo por resultado de negócio, preservando a segurança, os SLOs e os objetivos de recuperação.

## Fluxo de trabalho

1. Defina escopo, moeda, período, ambientes, responsáveis, unidades de negócio, direcionadores de uso e SLO, RTO e RPO necessários.
2. Colete exportações de faturamento e utilização com acesso somente leitura. Concilie custos amortizados, efetivos, de tabela, créditos, impostos, suporte e custos compartilhados.
3. Aloque os custos usando contas, projetos ou subscriptions, tags ou labels, namespaces, workloads e regras documentadas para custos compartilhados.
4. Identifique os principais direcionadores de custo antes de analisar recursos de cauda longa.
5. Crie métricas unitárias, como custo por requisição, tenant, build, transação, GB processado ou usuário ativo.
6. Avalie desperdícios, rightsizing, agendamento, autoscaling, ciclo de vida do armazenamento, transferência de dados, volume de logs, alterações de arquitetura e compromissos de uso.
7. Quantifique cada recomendação com baseline, premissas, faixa esperada, custo de implementação, risco, prazo de retorno e responsável.
8. Adicione orçamentos, detecção de anomalias, previsões e medição após as alterações.

## Restrições de segurança

- Verifique os preços atuais do provedor, a região, a categoria e as dimensões de faturamento; identifique claramente as estimativas.
- Não compre reservas nem assuma compromissos de uso com base em um histórico curto ou não representativo.
- Não remova redundância, backups, logs, controles de segurança nem margem de capacidade sem aceitação explícita do risco.
- Considere egress, NAT, tráfego entre zonas ou regiões, APIs, suporte, licenças, observabilidade e mão de obra de engenharia.
- Prefira experimentos reversíveis e períodos de redução de escala antes da exclusão permanente.

## Saída

Retorne um resumo executivo, a qualidade dos dados e as premissas, a decomposição dos custos, unit economics, oportunidades priorizadas, faixa mensal e anual estimada, esforço, risco, prazo de retorno, sequência de implementação, restrições de segurança e plano de medição.
