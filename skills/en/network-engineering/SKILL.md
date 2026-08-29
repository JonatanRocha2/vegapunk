---
name: network-engineering
description: Designs, reviews, secures, and troubleshoots enterprise, data-center, cloud, Kubernetes, and hybrid networks. Use for TCP/IP, IPv4/IPv6, subnetting, VLANs, routing, BGP, VPN, DNS, DHCP, NAT, firewalls, load balancers, proxies, HTTP/TLS, packet loss, latency, or connectivity incidents.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# Network Engineering

Troubleshoot from evidence and layer boundaries. Start read-only and change one controlled variable at a time.

## Discovery

1. Define source, destination, protocol, port, direction, expected path, environment, time window, and user impact.
2. Establish the layers involved: physical/link, IP, transport, TLS, HTTP/application, DNS, identity, and policy.
3. Map address spaces, subnets, VLANs/VRFs, routes, autonomous systems, NAT, firewalls, proxies, load balancers, DNS, and hybrid/cloud boundaries.
4. Confirm the observation point. Client, server, firewall, load balancer, and packet capture can show different truths.
5. Identify recent changes, asymmetric paths, overlapping CIDRs, MTU differences, quotas, expiring certificates, and control-plane dependencies.

## Troubleshooting Workflow

1. Reproduce the smallest failing flow and compare it with a known-good flow.
2. Resolve names and inspect record type, authority, TTL, split-horizon behavior, DNSSEC, and resolver path.
3. Validate local address, route selection, next hop, policy routing, and source NAT expectations.
4. Test transport establishment and distinguish timeout, refusal, reset, retransmission, packet loss, and application delay.
5. Validate TLS SNI, certificate chain, names, validity, protocol, cipher, ALPN, and interception.
6. Trace every enforcement point in both directions: host firewall, network ACL, security group, distributed firewall, proxy, service mesh, and application policy.
7. Inspect counters, flow logs, packet captures, routing tables, conntrack/state, interface errors, and latency by hop as authorized.
8. Form one falsifiable hypothesis, test it, record evidence, and stop when the root cause and recovery are verified.

## Design Rules

- Allocate non-overlapping IPv4 and IPv6 space with room for growth and summarization.
- Separate routing, segmentation, and identity concerns; document where each policy is enforced.
- Prefer explicit ingress and egress, least privilege, resilient DNS, redundant paths, and observable failure modes.
- Account for return paths, stateful devices, NAT exhaustion, ephemeral ports, MTU/MSS, anycast, health checks, and failure domains.
- Define ownership, source of truth, configuration review, rollback, out-of-band access, monitoring, and disaster recovery.
- Treat zero trust as continuous identity and policy enforcement, not as a product purchase.

## Guardrails

- Never change routes, ACLs, firewall rules, DNS, BGP advertisements, VPNs, or device configuration without scope, diff, rollback, and explicit approval.
- Packet captures and flow logs may contain credentials, tokens, personal data, and payloads. Minimize collection and redact output.
- Do not disable security controls merely to prove connectivity. Use a narrow, time-bounded test if authorized.
- Do not assume ICMP failure proves the service path is down or that successful ping proves the application works.

## Output

For incidents, provide impact, topology/path, evidence, layer of failure, root cause or ranked hypotheses, safe mitigation, permanent fix, and validation. For designs, provide requirements, addressing and routing, segmentation, DNS and traffic flows, resilience, security controls, observability, capacity, migration, rollback, and unresolved risks.
