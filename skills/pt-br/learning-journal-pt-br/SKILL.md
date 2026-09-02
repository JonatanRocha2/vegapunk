---
name: learning-journal-pt-br
description: Ensina como e por que trabalhos técnicos foram concluídos e persiste aprendizados duráveis em Markdown para o usuário e futuras sessões da IA. Use automaticamente após mudanças relevantes de código, configuração, infraestrutura, depuração, arquitetura ou workflow, e quando o usuário pedir explicação, retrospectiva, walkthrough, registro de aprendizado ou memória do projeto; não use para mudanças triviais ou puramente mecânicas.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
  inspiration: apxxrv/session-teacher
---

# Diário de Aprendizado

Transforme trabalhos técnicos relevantes em conhecimento que o usuário possa
compreender e que agentes futuros possam verificar e reutilizar.

## Fluxo de trabalho

1. Explique o problema ou a necessidade que motivou o trabalho.
2. Explique como a solução funciona, citando arquivos e símbolos relevantes.
3. Explique por que essa abordagem foi escolhida, incluindo restrições e trade-offs.
4. Mencione apenas alternativas realmente consideradas ou ainda relevantes.
5. Apresente testes, comandos ou evidências observáveis que verifiquem o resultado.
6. Extraia o princípio reutilizável, risco ou armadilha descoberto durante o trabalho.

Mantenha a explicação proporcional à mudança. Não exponha cadeia de pensamento
privada; apresente justificativas técnicas concisas, objetivas e verificáveis.

Quando o usuário solicitar aprendizado aprofundado, ensine de forma incremental.
Peça que ele reformule as ideias principais com as próprias palavras e use
perguntas práticas para verificar o entendimento antes de declarar domínio.

## Memória do projeto

Armazene aprendizados duráveis específicos do repositório em:

```text
docs/learning/LEARNINGS.md
```

Siga a convenção existente quando o projeto já possuir um local equivalente.
Crie ou atualize o diário somente quando o trabalho produzir conhecimento
durável. Mantenha as entradas append-only, exceto quando uma entrada anterior
precisar de correção ou a mesma decisão tiver evoluído.

Use este formato:

```markdown
## AAAA-MM-DD - Título objetivo

**Contexto:** O problema ou a necessidade.

**Solução:** O que mudou, com referências a arquivos e símbolos.

**Decisão:** Por que esta abordagem foi escolhida e quais restrições importaram.

**Verificação:** Testes ou evidências observadas.

**Aprendizado reutilizável:** Um princípio aplicável a trabalhos futuros.
```

Use o mecanismo de ADR do projeto para decisões arquiteturais formais quando ele
existir. Vincule a entrada do diário ao ADR em vez de duplicá-lo.

## Memória global

Armazene somente preferências e princípios comprovadamente reutilizáveis entre
projetos em:

```text
~/.agents/learning/LEARNINGS.md
```

Não promova automaticamente uma convenção de um único repositório para a memória
global. Exija evidência em vários projetos ou uma instrução explícita do usuário.

Antes de trabalhos relevantes, consulte os registros de aprendizado do projeto e
globais quando existirem. Trate-os como contexto, não como verdade imutável, e
valide-os contra o código e as instruções atuais.

## Guardrails

- Registre fatos, decisões e evidências, não transcrições da conversa.
- Nunca persista segredos, credenciais, dados pessoais ou conteúdo sensível.
- Não invente alternativas, justificativas ou resultados de testes.
- Diferencie fatos verificados de premissas e hipóteses não resolvidas.
- Mantenha entradas concisas, pesquisáveis e compreensíveis sem a sessão original.
- Não altere arquivos de memória quando não houver conhecimento durável novo.
- Informe na resposta final qual arquivo de aprendizado foi atualizado.
- Se a escrita fora do workspace não estiver disponível, preserve a memória do
  projeto e informe que a memória global não foi persistida.
