---
name: terraform-infrastructure-pt-br
description: Cria, revisa, testa, importa, refatora e soluciona problemas de infraestrutura com Terraform ou OpenTofu. Use para HCL, módulos, providers, state, planos, drift, CI, migrações ou segurança de IaC; não use para aplicar alterações em produção sem aprovação explícita.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.1"
  language: "pt-BR"
---

# Infraestrutura com Terraform

Preserve a integridade do state e faça a menor alteração segura na infraestrutura.

## Fluxo de trabalho

1. Examine as versões exigidas, providers, módulos, backends, arquivo de lock, estratégia de workspaces/ambientes e convenções do repositório.
2. Identifique o ciclo de vida desejado dos recursos e se objetos ou endereços existentes precisam ser preservados.
3. Prefira variáveis tipadas, validações, outputs significativos, restrições de providers e módulos pequenos e coesos.
4. Execute a formatação e a validação estática, seguidas de lint específico dos providers e das verificações de segurança, políticas e testes já usados pelo projeto.
5. Gere um plano salvo ou registrado pela CI. Analise todas as implicações de criação, atualização, substituição, exclusão, valores desconhecidos e valores sensíveis.
6. Em refatorações, use `moved`, `import` ou operações de state de forma deliberada; faça backup e bloqueie o state antes de manipulações excepcionais.
7. Aplique somente após aprovação na conta, projeto, assinatura, região e workspace pretendidos.
8. Verifique o recurso real, os outputs, a integridade, as políticas, o drift e o caminho de rollback ou recuperação.

## Guardrails

- Nunca coloque credenciais ou valores secretos desnecessariamente em HCL, arquivos de variáveis, planos, outputs, logs ou state.
- Trate planos e state como artefatos sensíveis.
- Não use `-target` como estratégia rotineira de implantação.
- Evite provisioners quando um provider ou mecanismo de imagem/bootstrap puder modelar o ciclo de vida.
- Fixe deliberadamente os intervalos de versões dos providers e faça commit do arquivo de lock de dependências dos módulos raiz.
- Não adicione `ignore_changes` apenas para ocultar um drift sem explicação.
- Nunca execute `apply`, `destroy`, desbloqueio forçado ou alteração de state sem aprovação explícita e confirmação do escopo.

## Orientação oficial especializada

Para trabalhos específicos com Terraform, consulte a skill relevante no catálogo
oficial [`hashicorp/agent-skills`](https://github.com/hashicorp/agent-skills),
incluindo estilo, testes, stacks, refatoração de módulos, políticas e importação de
recursos. Use essas instruções seletivamente em vez de instalar skills sobrepostas
por padrão. Mantenha esta skill como o fluxo provider-neutral de segurança e ciclo
de vida.

## Resultado da revisão

Relate os achados por severidade, com arquivo e linha, impacto esperado no plano, risco para state/migração, implicações de segurança e custo, testes ausentes, comandos executados e risco residual. Se criar código, deixe-o formatado e validado e mostre o resumo do plano sem alegar que houve implantação.
