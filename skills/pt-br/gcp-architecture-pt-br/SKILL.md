---
name: gcp-architecture-pt-br
description: Projeta e revisa cargas de trabalho no Google Cloud usando o Google Cloud Well-Architected Framework. Use para organizações, pastas, projetos, IAM, VPC, GKE, Cloud Run, plataformas de dados, observabilidade, confiabilidade, migração, segurança ou decisões de custo no GCP.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Arquitetura do Google Cloud

Fundamente detalhes sujeitos a mudanças na documentação atual do Google Cloud.

## Fluxo de trabalho

1. Registre a carga de trabalho, os usuários, os locais, as classes de dados, a conformidade, SLO, RTO, RPO, demanda e orçamento.
2. Projete a organização, as pastas, os projetos, as contas de faturamento, as políticas da organização, os grupos do IAM e o acesso de emergência.
3. Defina Shared VPC ou VPCs independentes, sub-redes, políticas de firewall, DNS, NAT, perímetros de serviço, acesso privado e conectividade híbrida.
4. Selecione Cloud Run, GKE, Compute Engine, Functions ou serviços gerenciados de dados de acordo com as restrições da carga de trabalho e a capacidade da equipe.
5. Projete os dados considerando padrões de acesso, localização, consistência, retenção, criptografia, backup e restauração testada.
6. Aplique contas de serviço com Workload Identity Federation, privilégio mínimo, Secret Manager, Cloud KMS, logs de auditoria, Security Command Center e VPC Service Controls quando houver justificativa.
7. Defina Cloud Monitoring, Logging, Trace, Error Reporting, SLOs, alertas, dashboards, cotas e rollout/rollback.
8. Modele labels de faturamento, orçamentos, compromissos de uso, limites mínimos de autoscaling, volume de logs, egress e custos entre regiões.

## Guardrails

- Evite chaves de contas de serviço; prefira identidades anexadas e federação.
- Evite papéis primitivos e concessões amplas no nível do projeto.
- Separe os projetos de produção e restrinja locais por meio de políticas quando necessário.
- Diferencie explicitamente o comportamento zonal, regional, dual-region e multirregional.
- Para GKE, justifique o uso do Standard em vez do Autopilot e defina os limites de cluster, nós, cargas de trabalho e tenants.
- Não implante nem altere políticas da organização sem pré-visualização, análise do raio de impacto e aprovação.

## Saída

Inclua hierarquia de recursos, modelo de identidade, fluxos de rede e de dados, escolhas de serviços, confiabilidade e recuperação de desastres, controles de segurança, modelo de entrega, observabilidade, direcionadores de custo, riscos do framework, migração em fases e etapas de validação somente leitura.
