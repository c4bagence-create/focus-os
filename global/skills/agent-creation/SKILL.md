---
name: agent-creation
description: Knowledge base pour creer et configurer des agents Claude Code. Charge automatiquement quand on cree, modifie, ou parle d'agents. Contient les best practices, le frontmatter, les patterns avances.
---

# Agent Creation — Knowledge Base

## Frontmatter standard
```yaml
---
name: nom-kebab-case
description: "Role. Use proactively when: [triggers precis]."
tools: [adaptes au role]
model: sonnet  # OU ne pas mettre → Router decide
memory: user   # TOUJOURS
---
```

## Regles de creation
- 40-60 lignes max par agent
- description = LE champ le plus important (c'est ce que Claude lit pour deleguer)
- "Use proactively when..." OBLIGATOIRE dans la description
- memory: user TOUJOURS (l'agent apprend entre sessions)
- 1 agent = 1 responsabilite unique
- Contexte metier integre (quel domaine, quel style)
- Reference aux skills existants si pertinent

## Model tiering
- haiku: recherche, listing, grep, taches mecaniques
- sonnet: code, implementation, copywriting, design
- opus: architecture, strategie, decisions critiques

## Tools par type d'agent
- Read-only (review/audit): Read, Grep, Glob, Bash
- Execution (code/write): Read, Write, Edit, Bash, Grep, Glob
- Research (veille/search): Read, Grep, Glob, Bash, WebSearch, WebFetch
- Orchestration (coordination): Read, Grep, Glob, Bash, Task

## Patterns avances

### isolation: worktree
Ajouter dans le frontmatter pour les agents qui modifient du code.
Cree une branche git isolee. Zero conflit entre agents paralleles.

### Evaluator-Optimizer Loop
Pour les agents critiques (veille, securite): lancer un 2e agent qui verifie.

### Hooks deterministes
Preferer des hooks PostToolUse a des instructions dans le prompt.
Un hook = du code qui s'execute. Un prompt = du texte qui peut etre ignore.

## Quand creer un nouvel agent
- Mission necessite un specialiste qui n'existe pas
- Domaine non couvert par les agents existants
- TOUJOURS verifier d'abord qu'un agent similaire n'existe pas deja

## Quand creer un nouveau skill
- Agent slim down (connaissances → skill separe)
- Nouveau domaine de connaissance
- Deep search qui produit des donnees reutilisables
- Structure: ~/.claude/skills/[domaine]/SKILL.md
