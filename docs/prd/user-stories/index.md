---
title: User Stories
description: US par persona · MoSCoW · critères d'acceptation
---
# User Stories

## Human Client — Sylvain

| ID | En tant que | Je veux | Afin de | MoSCoW | Agent |
|---|---|---|---|---|---|
| US-C01 | Sylvain | poser une question vocale en français | interagir sans taper sur mobile | <span class="badge-must">Must</span> | LUCA/ASTRA |
| US-C02 | Sylvain | voir mon P&L temps réel | savoir où j'en suis sans calcul manuel | <span class="badge-must">Must</span> | LUCA |
| US-C03 | Sylvain | recevoir une projection fiscale nette | connaître mon vrai gain après PFU 30% | <span class="badge-must">Must</span> | ASTRA |
| US-C04 | Sylvain | être alerté avant une ex-date dividende | ne jamais rater un détachement | <span class="badge-must">Must</span> | LUCA |
| US-C05 | Sylvain | voir ma progression vers 5 000 € net | mesurer l'avancement de mon objectif | <span class="badge-must">Must</span> | ASTRA |
| US-C06 | Sylvain | recevoir l'ordre d'achat prioritaire du mois | exécuter sans réfléchir | <span class="badge-should">Should</span> | ASTRA |
| US-C07 | Sylvain | comparer mes perf à un ETF World | benchmarker mon allocation | <span class="badge-should">Should</span> | LUCA |
| US-C08 | Sylvain | basculer entre vue CTO / PEA / global | piloter chaque véhicule | <span class="badge-could">Could</span> | LUCA |

## GenAI FullStack

| ID | En tant que | Je veux | Afin de | MoSCoW |
|---|---|---|---|---|
| US-D01 | Dev | déployer en 1 commande `git push` | livrer rapidement | <span class="badge-must">Must</span> |
| US-D02 | Dev | voir les logs Bedrock temps réel | déboguer LUCA/ASTRA | <span class="badge-must">Must</span> |
| US-D03 | Dev | modifier les prompts sans redéploiement | itérer vite sur l'IA | <span class="badge-must">Must</span> |
| US-D04 | Dev | avoir un env DEV isolé de PROD | tester sans risque | <span class="badge-must">Must</span> |
| US-D05 | Dev | importer les tokens CSS depuis Penpot | synchroniser design ↔ code | <span class="badge-should">Should</span> |
| US-D06 | Dev | recevoir une alerte si Saxo API down | détecter les données stale | <span class="badge-should">Should</span> |

## LUCA — Agent IA

| ID | LUCA doit | Condition | Critère d'acceptation | MoSCoW |
|---|---|---|---|---|
| US-L01 | Répondre en < 1,5s (P50) | Question valorisation | Latence Bedrock mesurée | <span class="badge-must">Must</span> |
| US-L02 | Refuser toute recommandation | Scope Data uniquement | "Je transfère à ASTRA" | <span class="badge-must">Must</span> |
| US-L03 | Citer la source de la donnée | Toute réponse chiffrée | Lien Saxo + horodatage | <span class="badge-must">Must</span> |
| US-L04 | Répondre en français exclusivement | Toujours | Pas d'anglais dans la réponse | <span class="badge-must">Must</span> |
| US-L05 | Détecter une question hors scope | Prompt injection test | Log + refus propre | <span class="badge-must">Must</span> |

## ASTRA — Agent IA

| ID | ASTRA doit | Condition | Critère d'acceptation | MoSCoW |
|---|---|---|---|---|
| US-A01 | Appliquer décomposition 4 lignes | Toute projection | Tableau systématique | <span class="badge-must">Must</span> |
| US-A02 | PFU sur PV uniquement | Toute simulation | `(VF − Capital) × 30%` | <span class="badge-must">Must</span> |
| US-A03 | Triade C/R/O | Projections 3 ans | 3 colonnes dans le tableau | <span class="badge-must">Must</span> |
| US-A04 | Ordre d'achat structuré | Demande mensuelle | Montant + ratio + rationale | <span class="badge-must">Must</span> |
| US-A05 | Refuser de vendre une position | Toujours | "On renforce, on ne vend pas" | <span class="badge-must">Must</span> |
| US-A06 | Respecter contrainte PEA/CTO | Recommandation EU | Pas de US stocks sur PEA | <span class="badge-must">Must</span> |

## Anti-persona Hack — Règles de rejet

| ID | Le système doit | Déclencheur | Réponse attendue | MoSCoW |
|---|---|---|---|---|
| US-H01 | Bloquer toute prompt injection | Pattern suspect | Refus + log CloudTrail | <span class="badge-must">Must</span> |
| US-H02 | Ne jamais exposer un token | Tout appel Bedrock | Secrets Manager uniquement | <span class="badge-must">Must</span> |
| US-H03 | Confirmer chaque ordre vocal | Commande achat/vente | Confirmation textuelle | <span class="badge-must">Must</span> |
| US-H04 | Rate-limiter les appels | > 60 req/min | HTTP 429 + alerte | <span class="badge-must">Must</span> |
| US-H05 | Journaliser tout accès | Chaque session | CloudTrail + S3 | <span class="badge-must">Must</span> |
