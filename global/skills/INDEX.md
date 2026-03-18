# SKILLS INDEX — Focus OS

> Index de tous les skills disponibles. Consulter avant de lancer un projet ou une tache.
> Claude charge ce fichier pour savoir quels skills sont disponibles.

---

## PROJECT-TYPE — Workflows complets de A a Z

| Skill | Description | Trigger | Duree |
|-------|-------------|---------|-------|
| `project-landing-page` | Landing page: brief → design → dev → copy → deploy → analytics | `/project landing page` | 1-3h / 1 jour |
| `project-ecommerce` | E-commerce: produit → shop → copy → visuels → ads → launch | `/project ecommerce` | 3-5j / 2-3 semaines |
| `project-marketing-strategy` | Strategie marketing: brainstorm → audit → positionnement → plan → KPIs | `/project marketing strategy` | 2-4h / 1-2 jours |
| `project-branding` | Identite de marque: ADN → moodboard → palette → logo → charte → declinaisons | `/project branding` | 1-2h / 2-4 jours |
| `project-presentation` | Presentation premium: brief → structure → contenu → design → animations → export | `/project presentation` | 1-2h / 1 jour |
| `project-formation` | Formation multi-page: objectifs → structure → contenu expert → composants → nav → deploy | `/project formation` | 2-4h par module |

---

## KNOWLEDGE — Expertises et references

| Skill | Description | Quand charger |
|-------|-------------|---------------|
| `copywriting` | Frameworks (AIDA/PAS/BAB), hooks haute conversion, sequences email SaaS, CTAs 2026 | Avant d'ecrire tout texte de vente, pub, email |

---

## SYSTEM — Claude Code et workflows

| Skill | Description | Quand charger |
|-------|-------------|---------------|
| `claude-features` | Features Claude Code avancees: /loop, /effort, worktrees, /batch, hooks HTTP, sessions | Quand on cherche une feature Claude ou qu'on configure l'environnement |
| `agent-creation` | Creer et configurer des agents Claude Code: frontmatter, best practices, patterns | Quand on cree ou modifie un agent |
| `focus-process` | Workflow standard pour tout nouveau projet. 5 phases avec gates de validation | `/focus-process` — debut de chaque nouveau projet |
| `vision360` | Mindset Vision360: deep search, alternatives, anticiper, autocritique | Decisions importantes, exploration d'un sujet, alternatives |
| `plan-review` | Review strategique avant execution: 4 modes de scope + 10 sections d'audit. GO/NO-GO. | `/plan-review` — avant tout gros projet ou decision critique |
| `create-new` | Creer un nouvel agent, skill, type de projet ou rule quand il n'existe pas encore | "creer un nouvel agent", "nouveau skill", "ca n'existe pas encore" |

---

## Comment utiliser ces skills

```
Commande: /project landing page
→ Claude charge le skill project-landing-page et suit le workflow

Commande: /project ecommerce
→ Claude charge le skill project-ecommerce et suit le workflow

Charger manuellement: "charge le skill copywriting"
→ Claude lit le SKILL.md et applique les techniques

Charger automatiquement (triggers):
→ Le skill se charge si les mots-cles du trigger sont detectes
```

---

## Ajouter un skill

1. Creer `global/skills/{nom-du-skill}/SKILL.md` avec le frontmatter:
```yaml
---
name: nom-du-skill
description: Ce que le skill fait en 1 ligne
triggers:
  - "mot-cle 1"
  - "mot-cle 2"
---
```
2. Ajouter une ligne dans ce fichier INDEX.md

---

*Total: 13 skills | Derniere mise a jour: 2026-03-18*
