---
name: semantic-commit-pt-br
description: Cria e valida mensagens de commit semântico usando Conventional Commits, com base no diff staged real e no histórico do repositório. Use para mensagens de commit, commits semânticos, conventional commits, histórico adequado para changelog ou preparação de um commit solicitado. Não faça commit nem push sem pedido explícito.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Commit Semântico

Descreva a alteração real com precisão. Nunca invente escopo, motivação, IDs de issues, testes ou breaking changes.

## Fluxo de trabalho

1. Leia as instruções do repositório e inspecione `git status`, o diff staged, o diff unstaged e os títulos dos commits recentes.
2. Se um commit foi solicitado, confirme quais arquivos fazem parte dele. Não adicione ao stage alterações não relacionadas ou feitas por outra pessoa.
3. Derive a intenção principal, visível ao usuário ou relevante à engenharia, a partir do diff staged, não apenas dos nomes dos arquivos.
4. Escolha o tipo válido mais específico e um escopo opcional consistente com o histórico do repositório.
5. Escreva um título imperativo e conciso, sem ponto final. Ele deve ser compreensível isoladamente.
6. Adicione um corpo somente quando o motivo, comportamento, migração, risco ou trade-off não óbvio precisar de explicação.
7. Adicione rodapés para breaking changes, referências de issues, coautores ou metadados exigidos pelo repositório somente quando houver evidência.
8. Valide se a mensagem descreve todas as alterações staged. Separe alterações não relacionadas em commits distintos quando houver autorização explícita.

## Formato Conventional Commits

```text
<tipo>[escopo opcional][!]: <descrição>

[corpo opcional]

[rodapé(s) opcional(is)]
```

Tipos comuns:

- `feat`: nova capacidade visível ao usuário.
- `fix`: correção de defeito.
- `refactor`: alteração interna sem mudança intencional de comportamento.
- `perf`: melhoria mensurável de desempenho.
- `test`: alteração somente em testes.
- `docs`: alteração somente em documentação.
- `build`: alteração no sistema de build ou em dependências.
- `ci`: alteração em configuração ou fluxo de CI/CD.
- `chore`: manutenção que não se encaixa em um tipo mais específico.
- `revert`: reverte um commit anterior.

Use `!` e o rodapé `BREAKING CHANGE:` somente para incompatibilidade em comportamento público, API, schema, protocolo, configuração ou contrato operacional.

## Guardrails

- Não use `feat` para toda adição de código nem `fix` para limpeza especulativa.
- Não agrupe arquivos gerados, formatação ou dependências sem relação com a mesma alteração atômica.
- Nunca ignore hooks, faça amend, force-push ou reescreva o histórico sem instrução explícita.
- Nunca exponha na mensagem segredos encontrados nos diffs.
- Execute as verificações exigidas pelo repositório antes do commit quando viável e informe quais não foram executadas.

## Saída

Quando apenas uma mensagem for solicitada, retorne a proposta em um bloco de texto e, se necessário, uma justificativa de uma linha. Quando o commit for solicitado explicitamente, mostre os arquivos selecionados, verificações executadas, hash e título resultantes e confirme que nenhum push ocorreu, salvo se também solicitado.
