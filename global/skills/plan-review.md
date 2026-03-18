---
name: plan-review
description: Review strategique d'un plan avant execution. 4 modes de scope + 10 sections d'audit.
triggers:
  - "/plan-review"
  - "review mon plan"
  - "audite ce projet"
  - "critique cette approche"
---

# Plan Review — Audit strategique

## Mode d'emploi
Avant d'executer un plan, lance `/plan-review` pour:
1. Choisir ton mode de scope (Expansion / Selectif / Hold / Reduction)
2. Passer le plan au crible des 10 sections

---

## Les 4 modes de scope

### EXPANSION
"Et si on voyait 10x plus grand ?"
- Quelles features transformeraient ce projet en game-changer ?
- Quel serait le resultat si on n'avait aucune contrainte ?
- Quelles opportunites adjacentes on rate ?

### SELECTIF
"On garde la base, on picore le meilleur"
- Le plan de base est bon. Quels ajouts ont le meilleur ROI ?
- Quels quick wins apportent 80% de la valeur en 20% d'effort ?
- 3 ameliorations max, bien choisies

### HOLD
"Execution pure, zero derive"
- Le scope est defini et ne bouge plus
- Focus: qualite, robustesse, edge cases
- Chaque ajout propose est challenge: "est-ce dans le scope ?"

### REDUCTION
"Couper jusqu'a l'os"
- Quel est le MVP absolu ?
- Qu'est-ce qu'on peut supprimer sans perdre la valeur core ?
- Livrer en 1/3 du temps prevu

---

## Les 10 sections d'audit

Pour chaque section, Claude doit:
- Analyser l'etat actuel
- Identifier les risques
- Proposer des ameliorations concretes

1. **Architecture** — Structure, dependances, scalabilite
2. **Gestion des erreurs** — Cas d'echec, fallbacks, recovery
3. **Securite** — Menaces, vulnerabilites, donnees sensibles
4. **Flux de donnees** — Entrees/sorties, edge cases, validation
5. **Qualite du code** — Lisibilite, maintenabilite, conventions
6. **Couverture tests** — Ce qui est teste, ce qui ne l'est pas
7. **Performance** — Bottlenecks, optimisations, metriques
8. **Observabilite** — Logs, monitoring, debugging
9. **Deploiement** — CI/CD, rollback, environnements
10. **Trajectoire long-terme** — Dette technique, evolution, maintenance

---

## Principe "Completeness is cheap"
L'IA rend l'exhaustivite gratuite. Ne JAMAIS recommander de raccourcis.
Chaque review doit etre COMPLETE, pas "on verra plus tard".

---

## Output attendu
- Score par section (1-10)
- Top 3 risques critiques
- Plan d'action priorise
- Decision GO / NO-GO / GO avec reserves
