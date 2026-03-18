---
name: agent-creation
description: Knowledge base pour creer et configurer des agents Claude Code. Charge automatiquement quand on cree, modifie, ou parle d'agents. Contient les best practices, le frontmatter, les patterns avances, et les donnees 2026.
---

# Agent Creation — Knowledge Base

## Frontmatter standard
```yaml
---
name: nom-kebab-case
description: "Role. Use proactively when: [triggers precis]."
tools: [adaptés au rôle]
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
- Pas de blabla, pas de jargon
- Contexte metier integre (quel domaine, quel style)
- Reference aux skills existants si pertinent

## Model tiering (si pas de Router)
- haiku: recherche, listing, grep, taches mecaniques
- sonnet: code, implementation, copywriting, design
- opus: architecture, strategie, decisions critiques, critique

## Tools par type d'agent
- Read-only (review/audit): Read, Grep, Glob, Bash
- Execution (code/write): Read, Write, Edit, Bash, Grep, Glob
- Research (veille/search): Read, Grep, Glob, Bash, WebSearch, WebFetch
- Orchestration (coordination): Read, Grep, Glob, Bash, Task

## Patterns avances (2026)

### isolation: worktree
Ajouter dans le frontmatter pour les agents qui modifient du code.
Cree une branche git isolee. Zero conflit entre agents paralleles.

### Evaluator-Optimizer Loop
Pour les agents critiques (veille, securite): lancer un 2e agent qui verifie.
Source: platform.claude.com/cookbook/patterns-agents-evaluator-optimizer

### Hooks deterministes
Preferer des hooks PostToolUse a des instructions dans le prompt.
Un hook = du code qui s'execute. Un prompt = du texte qui peut etre ignore.
3 hooks essentiels: format-on-write, source-date-check, no-env-touch

### Vision360 integration
Tout agent de recherche doit charger le skill vision360.
Minimum 10 recherches web. Verifier les sources. Comparer alternatives.

## Architecture 3 tiers agents (reference)

### CORE (9) — Toujours disponibles
ghost (CEO), dre (frontend), tate (backend), tasha (copy), light (QA), storm (recherche), tommy (branding), forge (factory), lafouine (investigation)

### EXECUTORS (3) — Delegation technique
fast-executor (Haiku), standard-executor (Sonnet), deep-executor (Opus)

### ORCHESTRATION (1)
opus-orchestrator — coordination multi-agents

## Donnees 2026 par domaine (mise a jour mars 2026)

### Frontend
- Next.js 16: "use cache" explicite, Turbopack stable par defaut
- React 19.2: View Transitions, useEffectEvent, Activity
- React Compiler: activer en production (reduit JS + TTI)
- Design Tokens W3C spec STABLE (oct 2025)
- OKLCH obligatoire, container queries 68% adoption

### Backend
- Supabase: Branches alpha, Column Level Security, Log Drains Pro
- Server Actions stabilises: 'use server' pour forms
- Edge Functions: rate limit 5000 req/min recursif
- RLS: wrapper auth.uid() dans SELECT pour perf

### Performance
- INP < 200ms priorite #1 (43% des sites echouent)
- LCP < 2.5s (62% mobile passent)
- React Compiler + RSC = combo ROI maximal

### Testing
- Playwright reste standard
- Anthropic Code Review lance mars 2026
- CodeRabbit leader AI review (2M repos)

### Securite
- Stack: SonarQube (SAST) + ZAP (DAST) + Beagle (pentest API)
- AWS Security Agent preview

### UX Mobile
- Gesture-based + haptic feedback obligatoire
- INP < 200ms sur mobile
- Zero-UI trend: interactions predictives

## Quand creer un nouvel agent
- Mission necessite un specialiste qui n'existe pas
- Domaine non couvert par les agents existants
- Verification prealable obligatoire: un agent similaire existe-t-il deja ?

## Quand creer un nouveau skill
- Agent slim down (ex: agent 500L → agent 50L + skill domaine)
- Nouveau domaine de connaissance
- Deep search qui produit des donnees reutilisables
- Structure: ~/.claude/skills/[domaine]/SKILL.md

## Validation d'un nouvel agent (checklist)
- [ ] Frontmatter complet (name, description, tools, model, memory)
- [ ] "Use proactively when..." dans la description
- [ ] 40-60 lignes max
- [ ] Pas de doublon avec un agent existant
- [ ] Section "Before Returning" presente
- [ ] Reference INDEX.md dans section Ressources si pertinent
