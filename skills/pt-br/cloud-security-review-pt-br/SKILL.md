---
name: cloud-security-review-pt-br
description: Realiza modelagem de ameaças e revisão de segurança de arquitetura cloud, IAM, rede, dados, Kubernetes, Terraform, CI/CD e operações na AWS, no GCP e no Azure. Use para avaliações de segurança, privilégio mínimo, caminhos de ataque, evidências de compliance, secrets ou revisões de DevSecOps.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Revisão de Segurança em Cloud

Priorize caminhos exploráveis e o impacto ao negócio, em vez do volume de checklists genéricos.

## Fluxo de trabalho

1. Defina ativos, classes de dados, agentes, limites de confiança, pontos de entrada, provedores, ambientes e obrigações de compliance.
2. Inventarie identidades humanas, de workloads, de fornecedores, de CI/CD e de break-glass; rastreie permissões efetivas e caminhos de escalada.
3. Rastreie ingress, egress, movimentação lateral, exposição pública, conectividade privada, DNS, planos de controle e caminhos de gerenciamento.
4. Revise criptografia e propriedade das chaves, ciclo de vida dos secrets, proteção de backups, retenção, residência, exclusão e auditabilidade.
5. Revise a supply chain desde o código-fonte e as dependências até o runner de build, o registry de artefatos, a identidade de implantação e o runtime.
6. Avalie a cobertura de detecção e resposta para identidades, dados, rede, configuração, workloads e atividades destrutivas.
7. Valide achados de alto risco com evidências somente leitura. Separe achados confirmados de hipóteses e evidências indisponíveis.
8. Recomende o menor controle que interrompa o caminho de ataque e, em seguida, defina a verificação e um rollout seguro.

## Sinais de alto risco

- Endpoints administrativos ou repositórios de dados expostos publicamente.
- Permissões com curingas ou entre contas, cadeias de impersonation e service principals não gerenciados.
- Chaves estáticas de cloud, secrets expostos, logs de auditoria desativados ou pipelines mutáveis sem auditoria.
- Dados sensíveis sem criptografia, backups amplamente acessíveis, isolamento fraco entre tenants ou recuperação de chaves não testada.
- Containers privilegiados, exposição do serviço de metadados, código não confiável com acesso a secrets ou bypass de políticas.

## Restrições de segurança

Não recupere os valores de secrets quando os metadados comprovarem o problema. Não realize exploração, exfiltração, escalada de privilégios nem alterações sem autorização e escopo explícitos. Remova informações sensíveis das evidências.

## Saída

Comece pelos achados ordenados por severidade. Para cada um, inclua recurso ou arquivo e linha, quando disponíveis, evidência, cenário de ataque, impacto, probabilidade, confiança, remediação e validação. Termine com as lacunas de cobertura e o risco residual.
