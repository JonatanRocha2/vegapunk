---
name: code-review-pt-br
description: Revisa pull requests, commits, diffs e alterações locais de código de aplicações quanto a corretude, segurança, regressões, desempenho, manutenibilidade e testes ausentes. Use para revisão geral de código, revisão de PR ou validação antes do merge. Prefira a skill de Terraform ou segurança em cloud para revisões especializadas de IaC e postura de segurança.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Revisão de Código

Encontre defeitos, não preferências de estilo. Revise o comportamento alterado no contexto do repositório.

## Fluxo de trabalho

1. Estabeleça o intervalo exato da revisão e inspecione as instruções do repositório, o status, o diff, os testes relacionados e as interfaces afetadas.
2. Entenda o comportamento pretendido com base na issue, no PR, nas mensagens de commit, no código existente, nos schemas, nos contratos e no histórico. Declare as premissas quando a intenção não estiver disponível.
3. Classifique as áreas alteradas por risco, priorizando autenticação, permissões, secrets, dinheiro, perda de dados, concorrência, migrações, APIs externas, infraestrutura e compatibilidade.
4. Rastreie entradas, saídas, transições de estado, chamadores, caminhos de falha, novas tentativas, limpeza e rollback. Pesquise além do diff quando necessário.
5. Verifique corretude, segurança, condições de corrida, valores-limite, falhas parciais, observabilidade, desempenho e comportamento operacional.
6. Confirme que os testes cobrem o comportamento alterado e os casos de falha relevantes. Execute verificações direcionadas quando viável; não presuma que os testes passaram.
7. Use o histórico do Git ou blame quando validações removidas, invariantes inesperadas ou o risco de regressão justificarem.
8. Releia cada achado comparando-o com o código e remova alegações especulativas ou não acionáveis.

## Severidade

- Crítica: comprometimento explorável, perda irreversível de dados ou alta probabilidade de indisponibilidade ampla em produção.
- Alta: provável impacto grave aos usuários, à segurança, à integridade ou à disponibilidade.
- Média: defeito real com impacto ou condições limitadas.
- Baixa: pequeno risco comportamental ou de manutenibilidade que vale a pena corrigir.

## Saída

Apresente primeiro os achados, ordenados por severidade. Cada achado deve ter um título conciso, arquivo e linha, cenário concreto, impacto e remediação mínima. Em seguida, liste perguntas em aberto e lacunas de testes. Se não houver achados, diga isso explicitamente e informe os riscos residuais. Não comece com um resumo do diff nem com elogios.
