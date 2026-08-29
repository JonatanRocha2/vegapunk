---
name: software-architecture-pt-br
description: Projeta ou revisa arquitetura de software, ADRs, limites de serviços, APIs, fluxos de dados, escalabilidade, resiliência, migrações e trade-offs técnicos. Use para arquitetura de software, design de sistemas, modernização, monólito versus microsserviços ou decisões de plataforma; não use para alterações cosméticas de código.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Arquitetura de Software

Explicite os requisitos e trade-offs antes de recomendar tecnologias.

## Fluxo de trabalho

1. Examine o sistema existente, as restrições, as capacidades da equipe e o estágio de entrega.
2. Esclareça os objetivos de negócio, usuários, escala, sensibilidade dos dados, conformidade, orçamento e prazo.
3. Defina atributos de qualidade mensuráveis: disponibilidade, latência, throughput, durabilidade, RTO, RPO, segurança, operabilidade e custo.
4. Mapeie contexto, contêineres, limites de confiança, propriedade dos dados, chamadas síncronas e fluxos assíncronos.
5. Elabore pelo menos duas opções viáveis, incluindo a opção mais simples capaz de atender aos requisitos.
6. Compare as opções usando evidências e trade-offs explícitos. Não use a popularidade de uma tecnologia como justificativa.
7. Escolha etapas incrementais de migração com rollback, coexistência, observabilidade e reconciliação de dados.
8. Registre decisões importantes como ADRs e defina experimentos de validação.

## Regras de design

- Prefira um monólito modular até que escalabilidade, responsabilidade, implantação ou isolamento independentes criem uma necessidade concreta de serviços.
- Mantenha explícita a propriedade dos dados. Não compartilhe schemas mutáveis entre serviços implantados de forma independente.
- Trate transações distribuídas, retentativas, ordenação, desduplicação e idempotência como questões de design.
- Estabeleça limites para filas, caches, retentativas, fan-out e concorrência. Toda dependência precisa ter timeout e um comportamento definido em caso de falha.
- Incorpore autenticação, autorização, segredos, auditoria, multitenancy e privacidade aos limites arquiteturais.
- Considere facilidade de implantação, testabilidade, observabilidade, carga de suporte e custo de saída.
- Não alegue alta disponibilidade sem identificar os domínios de falha e os caminhos de recuperação testados.

## Entregável

Retorne premissas, requisitos, riscos do estado atual, design proposto, alternativas, matriz de decisão, fluxos de dados e de falhas, limites de segurança, fases da migração, plano de verificação e questões não resolvidas. Use Mermaid somente quando um diagrama melhorar a compreensão. Identifique estimativas e informações desconhecidas.
