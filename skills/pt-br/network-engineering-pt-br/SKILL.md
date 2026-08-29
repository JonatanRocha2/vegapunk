---
name: network-engineering-pt-br
description: Projeta, revisa, protege e soluciona problemas de redes corporativas, data center, cloud, Kubernetes e ambientes híbridos. Use para TCP/IP, IPv4/IPv6, subnetting, VLANs, roteamento, BGP, VPN, DNS, DHCP, NAT, firewalls, load balancers, proxies, HTTP/TLS, perda de pacotes, latência ou incidentes de conectividade.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "pt-BR"
---

# Engenharia de Redes

Investigue com base em evidências e limites entre camadas. Comece somente leitura e altere uma variável controlada por vez.

## Descoberta

1. Defina origem, destino, protocolo, porta, direção, caminho esperado, ambiente, janela de tempo e impacto aos usuários.
2. Estabeleça as camadas envolvidas: física/enlace, IP, transporte, TLS, HTTP/aplicação, DNS, identidade e políticas.
3. Mapeie espaços de endereçamento, sub-redes, VLANs/VRFs, rotas, sistemas autônomos, NAT, firewalls, proxies, load balancers, DNS e limites híbridos/cloud.
4. Confirme o ponto de observação. Cliente, servidor, firewall, load balancer e captura de pacotes podem mostrar perspectivas diferentes.
5. Identifique mudanças recentes, caminhos assimétricos, CIDRs sobrepostos, diferenças de MTU, cotas, certificados expirando e dependências do plano de controle.

## Fluxo de troubleshooting

1. Reproduza o menor fluxo com falha e compare-o com um fluxo que funciona.
2. Resolva os nomes e inspecione tipo de registro, autoridade, TTL, split-horizon, DNSSEC e caminho do resolver.
3. Valide endereço local, seleção de rota, próximo salto, policy routing e expectativa de source NAT.
4. Teste o estabelecimento do transporte e diferencie timeout, recusa, reset, retransmissão, perda de pacotes e atraso da aplicação.
5. Valide SNI TLS, cadeia de certificados, nomes, validade, protocolo, cipher, ALPN e interceptação.
6. Rastreie todos os pontos de controle nos dois sentidos: firewall do host, network ACL, security group, firewall distribuído, proxy, service mesh e política da aplicação.
7. Inspecione contadores, flow logs, capturas de pacotes, tabelas de roteamento, conntrack/state, erros de interface e latência por salto conforme a autorização.
8. Formule uma hipótese falseável, teste-a, registre a evidência e pare quando a causa raiz e a recuperação forem verificadas.

## Regras de design

- Aloque espaços IPv4 e IPv6 sem sobreposição, com margem para crescimento e sumarização.
- Separe responsabilidades de roteamento, segmentação e identidade; documente onde cada política é aplicada.
- Prefira entrada e saída explícitas, privilégio mínimo, DNS resiliente, caminhos redundantes e modos de falha observáveis.
- Considere caminhos de retorno, dispositivos stateful, esgotamento de NAT, portas efêmeras, MTU/MSS, anycast, health checks e domínios de falha.
- Defina ownership, fonte da verdade, revisão de configuração, rollback, acesso out-of-band, monitoramento e recuperação de desastres.
- Trate zero trust como aplicação contínua de identidade e políticas, não como compra de um produto.

## Guardrails

- Nunca altere rotas, ACLs, regras de firewall, DNS, anúncios BGP, VPNs ou configurações de dispositivos sem escopo, diff, rollback e aprovação explícita.
- Capturas de pacotes e flow logs podem conter credenciais, tokens, dados pessoais e payloads. Minimize a coleta e remova dados sensíveis da saída.
- Não desative controles de segurança apenas para provar conectividade. Use um teste restrito e temporário quando autorizado.
- Não presuma que falha de ICMP prova indisponibilidade do serviço nem que um ping bem-sucedido prova que a aplicação funciona.

## Saída

Para incidentes, forneça impacto, topologia/caminho, evidências, camada da falha, causa raiz ou hipóteses ordenadas, mitigação segura, correção definitiva e validação. Para designs, forneça requisitos, endereçamento e roteamento, segmentação, DNS e fluxos de tráfego, resiliência, controles de segurança, observabilidade, capacidade, migração, rollback e riscos não resolvidos.
