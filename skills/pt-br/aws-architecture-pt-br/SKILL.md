---
name: aws-architecture-pt-br
description: Projeta e revisa cargas de trabalho na AWS usando as orientações do AWS Well-Architected. Use para contas e AWS Organizations, IAM, redes VPC, computação, armazenamento, bancos de dados, serverless, sistemas orientados a eventos, observabilidade, recuperação de desastres, segurança ou decisões de custo na AWS.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Arquitetura da AWS

Verifique o comportamento atual dos serviços, as cotas, a disponibilidade regional e os preços na documentação oficial da AWS antes de finalizar um design.

## Fluxo de trabalho

1. Registre os requisitos da carga de trabalho, a classificação dos dados, as regiões, SLO, RTO, RPO, tráfego e orçamento.
2. Estabeleça o modelo de contas e do AWS Organizations, os limites de SCPs, a federação de identidades, o acesso de emergência e a conta de auditoria.
3. Projete VPCs, sub-redes, roteamento, entrada, saída, DNS, endpoints, inspeção e conectividade híbrida. Minimize surpresas com NAT e tráfego entre AZs.
4. Escolha a computação conforme os requisitos: Lambda, ECS/Fargate, EKS, EC2, Batch ou serviços gerenciados de aplicações.
5. Escolha os serviços de dados com base nos padrões de acesso, consistência, escala, recuperação e necessidades operacionais, não por familiaridade.
6. Defina contratos de eventos, idempotência, retentativas, DLQs, ordenação e replay para SQS, SNS, EventBridge, Kinesis ou Step Functions.
7. Aplique IAM com privilégio mínimo, estratégia de KMS, Secrets Manager ou Parameter Store, CloudTrail, Config, GuardDuty e Security Hub, conforme apropriado.
8. Defina métricas/logs/alarmes do CloudWatch, tracing, rollback de implantação, backups, testes de restauração, cotas e alocação de custos.

## Guardrails

- Prefira roles e identidades de carga de trabalho; nunca incorpore chaves de acesso ao código ou à configuração.
- Evite curingas no IAM, a menos que o modelo de recursos os torne inevitáveis e a exceção esteja documentada.
- Use várias AZs para cargas de trabalho stateful de produção quando o SLO exigir.
- Trate múltiplas regiões como um design de aplicação e consistência de dados, não como uma opção a ser marcada.
- Modele os custos de requisições, armazenamento, transferência de dados, NAT Gateway, logs, KMS e tráfego entre AZs.
- Use CloudFormation, CDK, Terraform ou OpenTofu com pré-visualização e verificações de políticas; não altere a produção por meio de um comando não revisado.

## Saída

Inclua topologia de contas, arquitetura e fluxos de dados, limites de IAM e de rede, cenários de falha, procedimento de recuperação de desastres, caminho de implantação, observabilidade, estimativa dos direcionadores de custo, riscos do Well-Architected e comandos de verificação que sejam somente leitura, salvo quando a execução for explicitamente aprovada.
