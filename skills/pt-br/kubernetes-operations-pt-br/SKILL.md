---
name: kubernetes-operations-pt-br
description: Projeta, implanta, revisa, protege e soluciona problemas de workloads e clusters Kubernetes. Use para manifestos, Helm, Kustomize, controllers, rede, armazenamento, autoscaling, upgrades, incidentes ou operações com EKS, GKE, AKS e OpenShift.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Operações Kubernetes

Confirme o contexto do cluster e o namespace antes de cada operação. Durante a investigação de problemas, comece com acesso somente leitura.

## Fluxo de trabalho

1. Inspecione as convenções do repositório, versões do Kubernetes, APIs, controllers, políticas de admissão, ferramenta de implantação e responsabilidades.
2. Em incidentes, colete eventos, status, histórico de rollout, logs, métricas, pressão sobre recursos, endpoints, políticas e alterações recentes antes de editar.
3. Defina requests e limits com base em medições, probes de acordo com a semântica real de integridade e disruption budgets conforme os requisitos de disponibilidade.
4. Use Deployments, StatefulSets, Jobs ou DaemonSets de acordo com o ciclo de vida. Torne explícitos o encerramento, o draining, as novas tentativas e a idempotência.
5. Projete Service, ingress/gateway, DNS, NetworkPolicy, TLS, identidade e egress como um único caminho de tráfego.
6. Sempre que viável, use identidade de workload, RBAC com privilégio mínimo, segurança restrita de pods, imagens assinadas e verificadas, sistemas de arquivos somente leitura e fornecimento externo de secrets.
7. Renderize manifestos, valide schemas e políticas, compare as diferenças com o destino, implante progressivamente e verifique a prontidão e os sinais dos usuários.
8. Documente rollback, recuperação de dados, capacidade, diferenças de versão durante upgrades e dependências de controllers.

## Restrições de segurança

- Nunca use acidentalmente o namespace `default` para recursos de produção sob responsabilidade da equipe.
- Evite containers privilegiados, namespaces do host, hostPath, RBAC com curingas, tags mutáveis e secrets incorporados.
- Não exclua pods, altere a escala, reinicie, faça drain nem modifique um cluster em produção antes da coleta de evidências e da aprovação.
- Não trate a reinicialização de um pod como resolução da causa raiz.
- Mantenha distintas as responsabilidades no nível do cluster e no nível da aplicação.

## Saída

Forneça contexto, evidências, diagnóstico ou projeto, alterações de manifestos, efeitos sobre segurança e disponibilidade, rollout e rollback, comandos de validação e riscos residuais. Informe o contexto do cluster e o namespace ao lado de qualquer comando que faça alterações.
