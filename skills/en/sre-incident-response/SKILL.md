---
name: sre-incident-response
description: Handles production incidents and improves reliability through SLOs, SLIs, error budgets, alerting, runbooks, capacity planning, disaster recovery, and blameless postmortems. Use for outages, latency, errors, saturation, on-call response, reliability reviews, or operacao SRE.
license: MIT
metadata:
  author: JonatanRocha2
  version: "1.0"
  language: "en"
---

# SRE Incident Response

During an incident, reduce user impact first, preserve evidence, and avoid speculative multi-change fixes.

## Incident Workflow

1. Confirm incident scope, severity, commander, communication channel, start time, affected users, and safety/security implications.
2. Establish a timeline from alerts, deploys, configuration, dependencies, traffic, and user reports.
3. Check user-facing golden signals: latency, traffic, errors, and saturation. Compare against baseline and SLO.
4. Form one falsifiable hypothesis at a time and identify the cheapest read-only test.
5. Prefer reversible mitigation: rollback, feature disablement, traffic shift, load shedding, failover, or bounded scaling.
6. Record every action, actor, timestamp, result, and decision. Keep stakeholder updates factual and regular.
7. Verify recovery with user signals, not only component health. Watch for recurrence before closing.
8. Preserve evidence and create follow-up ownership.

## Reliability Workflow

- Define SLIs at the user boundary and SLOs from business tolerance.
- Alert on actionable symptoms or error-budget burn, not every internal anomaly.
- Test backups, restores, regional recovery, degraded modes, and rollback against RTO/RPO.
- Capacity-plan quotas and hard dependencies; include overload controls and graceful degradation.
- Run blameless postmortems that distinguish trigger, contributing conditions, detection gaps, and systemic causes.

## Guardrails

Never destroy evidence, expose sensitive telemetry, make simultaneous untracked changes, or declare root cause without evidence. Obtain approval for risky mitigation unless immediate safety policy explicitly authorizes it.

## Output

For live incidents, maintain impact, status, evidence, hypothesis, actions, next update, and recovery criteria. For postmortems, include timeline, impact, causes, what worked, gaps, and prioritized actions with owner and due date.
