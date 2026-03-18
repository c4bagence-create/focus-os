---
name: claude-features
description: Features avancees de Claude Code que tout utilisateur devrait connaitre — /loop, /effort, worktrees, /batch, hooks, sessions, et commandes utiles.
triggers:
  - "comment utiliser Claude Code"
  - "features Claude"
  - "fonctionnalites avancees"
  - "worktree"
  - "hooks Claude"
---

# Claude Code — Features Essentielles

> Reference: Claude Code v2.1.77+
> Derniere MaJ: mars 2026

---

## 1. /loop — Prompts recurrents en session

**Quoi:** Lance un prompt automatiquement sur un intervalle, comme un cron job dans ta session.

**Syntaxe:**
```
/loop 5m check if the deploy finished
/loop 30s run npm test
/loop check the build                    ← defaut: toutes les 10 min
/loop 20m /review-pr 1234                ← peut lancer un autre skill
```

**Intervalles:** `s` (secondes), `m` (minutes), `h` (heures), `d` (jours)

**Gerer les jobs:**
- "what scheduled tasks do I have?" → liste les jobs
- "cancel the deploy check job" → supprime un job
- Max 50 jobs par session

**Limites:**
- Session-scoped: quitter Claude = tous les jobs disparaissent
- Ne tourne QUE quand Claude est idle
- Expiration auto: 3 jours max

**Cas d'usage:**
- Surveiller un deploy: `/loop 3m check if vercel deploy is done`
- Babysit une PR: `/loop 20m /review-pr 123`

---

## 2. /effort — Controle profondeur de reflexion

**Quoi:** Ajuste combien Claude reflechit avant de repondre.

**4 niveaux:**

| Niveau | Usage |
|--------|-------|
| `low` | Taches simples, renommage, formatage |
| `medium` | Usage quotidien (defaut Opus Max) |
| `high` | Architecture, debug complexe |
| `max` | Decisions critiques, Opus 4.6 only, session uniquement |

**Syntaxe:**
```
/effort low        ← rapide, economique
/effort high       ← reflexion profonde
/effort max        ← Opus only
/effort auto       ← reset au defaut
```

**Keyword magique:** Ecrire "ultrathink" dans un prompt = force high pour ce tour seul.

---

## 3. Worktrees — Isolation git par agent

**Quoi:** Cree une copie isolee du repo pour que plusieurs sessions Claude travaillent en parallele sans se marcher dessus.

**Au lancement:**
```bash
claude --worktree feature-auth          # Cree .claude/worktrees/feature-auth/
claude --worktree                       # Nom auto-genere
claude --worktree feature-auth --tmux   # Lance dans un pane tmux separe
```

**Pour les subagents:**
```yaml
# Dans .claude/agents/monagent.md
---
model: sonnet
isolation: worktree
allowed-tools: Bash, Edit, Read, Write, Grep, Glob
---
```

**Nettoyage auto:** Si pas de changements → worktree supprime automatiquement.

**Cas d'usage:**
- Multi-agents sur le meme projet: un agent frontend, un agent backend
- Tester une feature sans toucher a la branche principale

---

## 4. /color — Distinguer les sessions paralleles

**Quoi:** Change la couleur de la barre de prompt.

```
/color red      ← production / deploy
/color blue     ← dev / feature
/color green    ← test / review
/color cyan     ← autre
/color default  ← reset
```

Parfait quand tu as 3 terminaux Claude ouverts en meme temps.

---

## 5. /batch — Changements massifs en parallele

**Quoi:** Orchestre des modifications a grande echelle sur tout un codebase.

```
/batch migrate src/ from Solid to React
/batch add TypeScript types to all files in lib/
/batch update all API endpoints to use the new auth middleware
```

**Comment ca marche:**
1. Recherche dans le codebase
2. Decompose en 5-30 unites independantes
3. Presente un plan → attend ton OK
4. Lance 1 agent par unite dans un worktree isole
5. Chaque agent: implemente + teste + ouvre une PR

**Prerequis:** Doit etre dans un repo git.

---

## 6. --resume vs --continue — Reprendre une session

```bash
claude -c                              # Reprend la derniere session du dossier courant
claude --resume                        # Ouvre le picker interactif
claude --resume auth-refactor          # Reprend par nom
claude -n "auth-refactor"              # Nomme la session au lancement
/rename auth-refactor                  # Renomme pendant la session
```

**Best practice:** Toujours nommer ses sessions (`claude -n "nom-du-projet"`).

---

## 7. Hooks HTTP — Webhooks vers des services

**Quoi:** Envoie un POST HTTP a une URL quand un evenement se produit.

**4 types de hooks:**
| Type | Description |
|------|-------------|
| `command` | Execute une commande shell |
| `http` | POST HTTP vers une URL |
| `prompt` | Envoie un prompt a un modele Claude |
| `agent` | Lance un subagent avec acces aux outils |

**Evenements:**
- `Stop` — Claude a fini de repondre
- `PreToolUse` — Avant d'utiliser un outil (peut bloquer)
- `PostToolUse` — Apres avoir utilise un outil
- `UserPromptSubmit` — A chaque message

**Exemple — Notifier via n8n:**
```json
{
  "hooks": {
    "Stop": [{
      "matcher": "",
      "hooks": [{
        "type": "http",
        "url": "https://ton-n8n.cloud/webhook/claude-done",
        "timeout": 10
      }]
    }]
  }
}
```

---

## 8. Commandes slash utiles

### /btw — Question rapide sans polluer le contexte
```
/btw c'etait quoi le nom du fichier config deja?
```
Reponse ephemere, n'entre pas dans l'historique. Fonctionne pendant que Claude travaille.

### /rewind — Revenir en arriere
```
/rewind
```
Restaure le code ET la conversation a un point precedent. Double-tap `Esc Esc` pour acces rapide.

### /diff — Viewer de diff interactif
```
/diff
```
Fleches gauche/droite: switch entre git diff et diffs par tour Claude.

### /context — Visualiser l'utilisation du contexte
```
/context
```
Grille coloree montrant l'occupation du contexte. Suggestions d'optimisation.

### ! prefix — Mode bash direct
```
! npm test
! git status
```
Execute la commande SANS passer par Claude. Output ajoute au contexte.

---

## 9. Agent Teams

**Configuration:**
```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  },
  "teammateMode": "auto"
}
```

**Principe:** Leader (Opus) coordonne. Specialistes (Sonnet) implementent. JAMAIS deux teammates sur le meme fichier.

---

## 10. Memoire et CLAUDE.md

| Fichier | Charge automatiquement | Usage |
|---------|----------------------|-------|
| `CLAUDE.md` (racine projet) | Oui | Cerveau du projet |
| `CLAUDE.md` (~/.claude/) | Oui | Config globale |
| `MEMORY.md` | Oui | Etat courant (200 lignes max) |
| `CHECKPOINT-*.md` | Non (lecture manuelle) | Reprise entre sessions |

**Hooks deterministes:**
- PreToolUse: avant un outil (ex: bloquer ecriture .env)
- PostToolUse: apres un outil (ex: formatter le code)
- Stop: quand Claude finit (ex: sauvegarder les learnings)
- UserPromptSubmit: a chaque message (ex: recharger les regles)

---

## Resume priorites

| Feature | Priorite | Quand utiliser |
|---------|----------|---------------|
| `/loop` | HAUTE | Monitorer deploys et PR |
| `/batch` | HAUTE | Gros refactors multi-fichiers |
| `--worktree` | HAUTE | Agent Swarms en parallele |
| `--name` + `/resume` | HAUTE | Toujours nommer ses sessions |
| Hooks HTTP | MOYENNE | Connecter a n8n/Telegram |
| `/effort` | MOYENNE | Switcher selon la complexite |
| `/color` | MOYENNE | Multi-sessions |
| `/btw` `/diff` `/context` | BASSE | Diagnostic et questions rapides |
