---
name: sre-incident-response-pt-br
description: Responde a incidentes de produção e melhora a confiabilidade por meio de SLOs, SLIs, error budgets, alertas, runbooks, planejamento de capacidade, disaster recovery e post-mortems sem culpabilização. Use para indisponibilidade, latência, erros, saturação, resposta on-call, revisões de confiabilidade ou operação SRE.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Resposta a Incidentes de SRE

Durante um incidente, reduza primeiro o impacto aos usuários, preserve as evidências e evite correções especulativas com várias alterações simultâneas.

## Fluxo de resposta a incidentes

1. Confirme o escopo e a severidade do incidente, quem está no comando, o canal de comunicação, o horário de início, os usuários afetados e as implicações de segurança operacional e da informação.
2. Estabeleça uma linha do tempo com base em alertas, implantações, configurações, dependências, tráfego e relatos de usuários.
3. Verifique os sinais de ouro percebidos pelos usuários: latência, tráfego, erros e saturação. Compare-os com a baseline e o SLO.
4. Formule uma hipótese falseável por vez e identifique o teste somente leitura de menor custo.
5. Prefira mitigações reversíveis: rollback, desativação de funcionalidade, redirecionamento de tráfego, load shedding, failover ou escalabilidade limitada.
6. Registre cada ação, responsável, timestamp, resultado e decisão. Mantenha as atualizações para stakeholders factuais e regulares.
7. Verifique a recuperação com sinais dos usuários, não apenas com a integridade dos componentes. Monitore recorrências antes de encerrar.
8. Preserve as evidências e atribua responsáveis às ações de acompanhamento.

## Fluxo de confiabilidade

- Defina SLIs no limite percebido pelo usuário e SLOs com base na tolerância do negócio.
- Alerte sobre sintomas acionáveis ou consumo do error budget, não sobre toda anomalia interna.
- Teste backups, restaurações, recuperação regional, modos degradados e rollback em relação a RTO e RPO.
- Planeje a capacidade de quotas e dependências críticas; inclua controles de sobrecarga e degradação graciosa.
- Conduza post-mortems sem culpabilização que distingam o gatilho, as condições contribuintes, as lacunas de detecção e as causas sistêmicas.

## Restrições de segurança

Nunca destrua evidências, exponha telemetria sensível, faça alterações simultâneas sem rastreamento nem declare uma causa raiz sem evidências. Obtenha aprovação para mitigações arriscadas, exceto quando uma política de segurança operacional autorizar explicitamente uma ação imediata.

## Saída

Para incidentes em andamento, mantenha atualizados impacto, status, evidências, hipótese, ações, horário da próxima atualização e critérios de recuperação. Para post-mortems, inclua linha do tempo, impacto, causas, o que funcionou, lacunas e ações priorizadas com responsável e prazo.
