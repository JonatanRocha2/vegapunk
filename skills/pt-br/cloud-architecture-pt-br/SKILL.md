---
name: cloud-architecture-pt-br
description: Projeta arquiteturas independentes de provedor ou multicloud e compara os trade-offs entre AWS, Google Cloud e Azure. Use para estratégia entre nuvens, landing zones, seleção de provedor, migrações ou revisões Well-Architected em toda a organização. Para uma carga de trabalho restrita a um provedor, use o skill de arquitetura da AWS, do GCP ou do Azure.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Arquitetura de Nuvem

Use as orientações Well-Architected dos provedores, mas derive a resposta dos requisitos da carga de trabalho.

## Avaliação

1. Determine a finalidade, a criticidade, os ambientes, as regiões, os usuários, o tráfego, as classes de dados e as regulamentações da carga de trabalho.
2. Quantifique SLOs, latência, throughput, crescimento, RTO, RPO, retenção e limites de custo.
3. Faça o inventário de identidades, contas/projetos/assinaturas, redes, DNS, certificados, computação, dados, integrações e caminhos de implantação.
4. Identifique limites de confiança, domínios de falha, cotas, pontos únicos de falha, operações manuais e dependências de fornecedores.
5. Avalie segurança, confiabilidade, excelência operacional, desempenho, custo e sustentabilidade.

## Padrões de design

- Separe produção de não produção usando os limites de isolamento do provedor.
- Prefira identidades de carga de trabalho e credenciais de curta duração em vez de chaves estáticas.
- Use conectividade privada quando houver justificativa, políticas centralizadas, logs de auditoria imutáveis e criptografia com propriedade deliberada das chaves.
- Selecione serviços gerenciados quando a redução do esforço operacional compensar o lock-in e as restrições.
- Projete por padrão para falhas de zona; adicione múltiplas regiões somente quando o RTO/RPO de negócio e a análise de falhas justificarem o custo.
- Torne a infraestrutura reproduzível por meio de IaC revisada e verificações automatizadas de políticas.
- Defina telemetria, responsabilidades, runbooks, testes de restauração de backups, rollback e alocação de custos antes do lançamento.
- Evite multicloud, a menos que um requisito específico regulatório, de aquisição, de cliente ou de resiliência compense a complexidade duplicada.

## Entregável

Forneça premissas, arquitetura-alvo, mapeamentos entre provedores, modelo de identidade e rede, estratégia de dados e recuperação de desastres, modelo de implantação, observabilidade, direcionadores de custo, riscos, alternativas, roadmap em fases e testes de aceitação. Diferencie fatos de estimativas e inclua links para a documentação oficial atual sobre limites voláteis de serviços ou preços.
