---
name: azure-architecture-pt-br
description: Projeta e revisa cargas de trabalho no Microsoft Azure usando as orientações do Azure Well-Architected e do Cloud Adoption Framework. Use para tenants, grupos de gerenciamento, assinaturas, Entra ID, redes, AKS, App Service, Functions, dados, governança, segurança, resiliência ou decisões de custo no Azure.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Arquitetura do Azure

Verifique os limites atuais, a disponibilidade dos serviços, as versões de API e os preços no Microsoft Learn e nas fontes de preços do Azure.

## Fluxo de trabalho

1. Defina a carga de trabalho, as regiões, a classificação dos dados, as regulamentações, SLO, RTO, RPO, tráfego e orçamento.
2. Projete o tenant, os grupos de gerenciamento, as assinaturas, os grupos de recursos, Azure Policy, RBAC, convenções de nomenclatura, tags e acesso de emergência.
3. Escolha hub-spoke, Virtual WAN ou uma rede mais simples com base na escala. Defina VNets, sub-redes, DNS, egress, Private Link, firewall, DDoS e conexões híbridas.
4. Selecione AKS, Container Apps, App Service, Functions, VMs ou plataformas gerenciadas com base nos requisitos da aplicação e das operações.
5. Selecione armazenamento e bancos de dados com base nas necessidades de acesso, consistência, residência, escala, backup e recuperação.
6. Aplique identidades gerenciadas, RBAC com privilégio mínimo, Key Vault, Defender for Cloud, criptografia, configurações de diagnóstico e retenção imutável de auditoria.
7. Defina Azure Monitor, Log Analytics, Application Insights, alertas, anéis de implantação, rollback, cotas, backup e testes de restauração.
8. Modele reservas ou savings plans, Benefício Híbrido do Azure, egress, logs, recursos ociosos e alocação de custos.

## Guardrails

- Prefira identidade gerenciada; não crie segredos do cliente quando houver federação disponível.
- Evite Owner e Contributor em escopos amplos sem justificativa explícita.
- Mantenha a produção em assinaturas separadas quando o isolamento e a governança justificarem.
- Declare o suporte a zonas de disponibilidade e regiões em vez de pressupor uma cobertura uniforme.
- Trate a complexidade de landing zones como opcional até que a escala organizacional a exija.
- Pré-visualize alterações de Bicep, ARM ou Terraform e obtenha aprovação antes de efetuá-las.

## Saída

Inclua hierarquia, identidade, design de rede e de dados, justificativa dos serviços, comportamento em falhas de zona/região, recuperação de desastres, segurança e políticas, entrega, observabilidade, direcionadores de custo, riscos, roadmap e etapas de validação somente leitura.
