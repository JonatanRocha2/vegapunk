# Segurança

[English](SECURITY.en.md) | **Português (Brasil)**

Agent Skills são instruções executáveis pelo agente. Trate alterações em
`SKILL.md`, instaladores e dependências externas como mudanças de código.

## Modelo de confiança

- As 16 skills bilíngues deste repositório são conteúdo autoral sob MIT.
- O instalador executa o `skills` CLI do npm com versão fixa e instala a skill
  Caveman e as skills oficiais do `aws-core` diretamente dos upstreams em
  commits imutáveis.
- A instalação do `aws-core` copia somente Agent Skills. Ela não configura o AWS
  MCP Server, não autentica uma conta e não concede permissões AWS. Use
  `-NoAwsToolkit` ou `--no-aws-toolkit` para não instalá-la.
- O proxy Caveman é opcional, instala outro pacote npm e pode encaminhar tráfego
  ao provider. Ele nunca é habilitado sem `-WithCavemanProxy` ou
  `--with-caveman-proxy`.
- Os instaladores recusam execução elevada por padrão para limitar o impacto de
  uma dependência comprometida. Use a opção de override apenas após revisar o
  script e quando a instalação realmente exigir esse privilégio.

## Guardrails

- Revise scripts remotos antes de usar `iex` ou pipe para `sh`, principalmente
  quando o repositório ou o pin tiver mudado.
- Nunca forneça segredos, tokens cloud ou acesso de produção a uma skill antes de
  revisar seu conteúdo e limitar as permissões da sessão.
- Use credenciais temporárias e de privilégio mínimo; mantenha ambientes de
  estudo e teste separados da produção.
- Não aceite mudanças destrutivas sem diff ou plano, alvo explícito, backup ou
  rollback e aprovação humana.
- Não faça automerge de atualizações externas. Confira autoria, licença,
  changelog, diff do release, digest e alterações de telemetria ou rede.
- Rode `npm test`, verifique a sintaxe do instalador correspondente e faça uma
  instalação sem credenciais antes de aprovar uma atualização.

## Atualizações automatizadas

O `renovate.json` acompanha `skills`, o commit do `aws-core`, a release e o
commit imutável da skill Caveman e `@caveman-ai/cli`. O Renovate espera três dias
após uma publicação e abre PRs sem automerge. A configuração só entra em operação
após habilitar o Renovate GitHub App para o repositório.

## Reportar vulnerabilidade

Não publique credenciais nem detalhes exploráveis em uma issue. Prefira o canal
privado de security advisories do GitHub; se ele não estiver habilitado, contate
o mantenedor sem incluir segredos e combine um canal privado.
