---
name: focus-process
description: Workflow standard pour tout nouveau projet. 5 phases sequentielles avec gates de validation. Adapte au setup agents Claude Code.
trigger: /focus-process
---

# Focus Process — Workflow Projet Standard

> Methode pour passer d'une idee a un produit deploye.
> Chaque phase produit des artifacts. Chaque gate bloque tant que les criteres ne sont pas remplis.

## Vue d'ensemble

```
PHASE 0: Discovery        → Brief produit
  ↓ GATE 0: Brief valide
PHASE 1: Planning          → PRD + UX Design
  ↓ GATE 1: Requirements complets
PHASE 2: Architecture      → Decisions techniques + Epics & Stories
  ↓ GATE 2: Implementation Readiness
PHASE 3: Implementation    → Code + Tests
  ↓ GATE 3: Code Review OK
PHASE 4: Ship & Learn      → Deploy + Retrospective
```

### Quick Flow (petits projets / features isolees)
```
QUICK-SPEC → QUICK-DEV → CODE-REVIEW → SHIP
```

## PHASE 0 — Discovery
**Qui:** ghost (strategie) + storm (recherche)
1. Brainstorming marche/concurrence
2. Product Brief: mission, probleme, cible, business model, MVP scope

**GATE 0:** Brief valide par l'utilisateur

## PHASE 1 — Planning
**Qui:** ghost (PM) + dre (UX/UI)
1. PRD avec requirements fonctionnels + non-fonctionnels
2. UX Design (wireframes, navigation flow)

**GATE 1:** PRD valide, acceptance criteria definis

## PHASE 2 — Architecture
**Qui:** tate (backend/infra) + dre (frontend) + light (review)
1. Decisions techniques (stack, DB, deploy, securite)
2. Epics & Stories avec acceptance criteria BDD

**GATE 2:** Tracabilite PRD → Stories 100%, 0 bloqueurs

## PHASE 3 — Implementation
**Qui:** dre (frontend) + tate (backend) + light (QA)
- Boucle: Dev Story → Code Review → Fix → Mark done
- JAMAIS deux agents sur le meme fichier

**GATE 3:** Tests 100%, code review OK

## PHASE 4 — Ship & Learn
**Qui:** tate (deploy) + light (validation) + ghost (retro)
1. Pre-deploy checklist (env vars, HTTPS, headers)
2. Deploy + smoke test
3. Retrospective → MEMORY.md + CHECKPOINT

## Mapping Agents → Phases

| Phase | Agent principal | Role |
|-------|----------------|------|
| 0 Discovery | ghost + storm | Vision, recherche |
| 1 Planning | ghost + dre | PRD, UX |
| 2 Architecture | tate + light | Tech, stories |
| 3 Implementation | dre + tate + light | Code, tests |
| 4 Ship | tate + ghost | Deploy, retro |
