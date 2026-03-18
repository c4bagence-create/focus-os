---
name: create-new
description: Comment créer un nouveau skill, agent, ou type de projet quand il n'existe pas encore
triggers:
  - "créer un nouveau skill"
  - "créer un nouvel agent"
  - "nouveau type de projet"
  - "ça n'existe pas encore"
  - "create new"
---

# Create New — Créer ce qui n'existe pas

Quand tu veux faire quelque chose et que le skill/agent/projet n'existe pas → tu le CRÉES.

## Créer un nouvel AGENT

1. Dis à Claude: "Forge, crée un agent spécialisé en [DOMAINE]"
2. Forge va:
   - Vérifier qu'un agent similaire n'existe pas déjà (anti-doublon)
   - Créer le frontmatter (name, description, tools)
   - Écrire les instructions (responsabilités, workflow, conventions)
   - Sauvegarder dans ~/.claude/agents/[nom].md
3. L'agent est immédiatement disponible

**Exemple:**
"Forge, crée un agent spécialisé en droit des sociétés français"
→ Forge crée `juriste.md` avec les bonnes instructions

## Créer un nouveau SKILL

1. Dis à Claude: "Crée un skill pour [DOMAINE/PROCESS]"
2. Lafouine va:
   - Créer le fichier SKILL.md avec frontmatter (name, description, triggers)
   - Écrire le contenu (étapes, conventions, templates)
   - L'ajouter dans INDEX.md
3. Le skill est immédiatement chargeable par les agents

**Exemple:**
"Crée un skill pour gérer les campagnes TikTok Ads"
→ Lafouine crée `tiktok-ads/SKILL.md` avec le workflow complet

## Créer un nouveau TYPE DE PROJET

1. Dis à Claude: "Je veux lancer un projet [TYPE] pour [BUSINESS]"
2. Si le type existe (landing-page, ecommerce, branding, etc.) → Claude suit le chemin pré-tracé
3. Si le type N'EXISTE PAS:
   - Ghost analyse le besoin
   - Forge crée les agents nécessaires
   - Lafouine crée le skill project-type
   - Ghost orchestre le projet avec le nouveau chemin
4. Le nouveau type est sauvegardé pour la prochaine fois

**Exemple:**
"Je veux lancer un podcast"
→ Ghost planifie, Forge crée un agent `podcast-producer`, Lafouine crée `project-podcast/SKILL.md`

## Créer une nouvelle RULE

1. Dis à Claude: "Ajoute une règle: [DESCRIPTION]"
2. Claude crée un fichier dans ~/.claude/rules/ avec frontmatter
3. La règle est active à la prochaine session

**Exemple:**
"Ajoute une règle: toujours utiliser TypeScript strict, jamais de any"
→ Crée `rules/typescript.md` avec `alwaysApply: true`

## Principe

Le système grandit AVEC toi. Plus tu crées, plus il est puissant. Chaque agent, skill, et rule que tu ajoutes reste disponible pour toujours.
