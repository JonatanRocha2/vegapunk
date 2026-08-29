---
name: ansible-automation-pt-br
description: Cria, revisa, testa e soluciona problemas em playbooks, roles, inventories, collections e fluxos de automação Ansible. Use para automação YAML, ansible-core, Ansible Lint, Molecule, precedência de variáveis, idempotência ou planejamento de rollout seguro; não use para execução em produção sem aprovação.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Automação com Ansible

Crie automações repetíveis, seguras para reexecução e claras quanto ao escopo dos alvos.

## Fluxo de trabalho

1. Examine `ansible.cfg`, manifestos de dependências, inventories, diretórios de variáveis, playbooks, roles, CI e convenções do repositório antes de editar.
2. Confirme hosts e ambiente pretendidos, método de conexão, elevação de privilégio, versão suportada do Ansible e versões das collections.
3. Prefira o comportamento de módulos a `command` ou `shell`, use nomes totalmente qualificados de collections quando houver ambiguidade e mantenha as roles coesas.
4. Modele o estado desejado de forma idempotente. Dê nomes descritivos às tasks, use handlers para alterações em serviços e declare explicitamente os comportamentos de mudança ou falha quando os módulos não puderem inferi-los.
5. Mantenha defaults sobrescrevíveis, inputs obrigatórios validados e a propriedade das variáveis clara. Considere a precedência de variáveis do Ansible em vez de depender de sobrescritas acidentais.
6. Execute verificações de sintaxe e o lint e os testes do projeto. Use os modos check e diff quando suportados, mas não os trate como prova quando os módulos não tiverem suporte completo.
7. Teste a idempotência e caminhos de falha importantes em ambiente isolado com o fluxo existente de Molecule ou testes de integração do repositório.
8. No rollout, visualize o inventory e o limite exato de hosts, comece com um canário ou lote serial pequeno, verifique handlers e integridade e só então expanda após aprovação.

## Guardrails

- Nunca faça commit de credenciais, segredos não criptografados, senhas de vault, chaves privadas, tokens ou output renderizado sensível.
- Não imprima variáveis secretas; use `no_log: true` quando o output puder expô-las, preservando diagnóstico não sensível suficiente.
- Nunca execute um playbook em produção, rotacione credenciais, reinicie hosts ou faça alterações destrutivas em pacotes, storage, rede, firewall ou contas sem aprovação explícita.
- Não suponha que o modo check prevê toda mudança nem que uma task bem-sucedida prova a integridade do serviço gerenciado.
- Evite `ignore_errors` indiscriminado, elevação ampla de privilégio, padrões de hosts sem limites e pipelines shell não idempotentes.
- Preserve as versões e os pins de dependências suportados pelo repositório, salvo quando a tarefa incluir explicitamente uma atualização.

## Resultado da verificação

Relate arquivos alterados, hosts ou instâncias de teste alvo, comandos de sintaxe/lint/teste, resultados da primeira e segunda execuções, quantidade esperada de mudanças, verificações ignoradas, risco do rollout e o comando exato de produção somente como proposta, salvo quando a execução tiver sido aprovada.
