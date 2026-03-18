---
name: tools
description: Plugins, MCP servers, CLI, environnement — charger quand on configure ou debug des outils
alwaysApply: false
tags: [tools, plugins, mcp, environment, setup]
---

# Outils & Plugins

## Plugins recommandes (Focus OS)

| Plugin | Usage |
|--------|-------|
| **mgrep** | Recherche semantique code + web (PRIORITAIRE si disponible) |
| **Playground** | HTML interactif pour demos/prototypage |
| **commit-commands** | `/commit`, `/commit-push-pr` — workflow git simplifie |
| **code-review** | `/code-review` — review auto multi-agent |
| **security-guidance** | Detection failles secu en temps reel (hook) |
| **claude-md-management** | `/revise-claude-md` — audit CLAUDE.md |
| **stripe** | Best practices Stripe, debug erreurs paiement |

## MCP Servers optionnels

| MCP | Usage |
|-----|-------|
| **Playwright** | Browser automation, screenshots, tests E2E |
| **Figma** | Lecture fichiers Figma, composants, styles |
| **Notion** | Lecture/ecriture pages, databases |
| **Supabase** | Gestion base de donnees directement depuis Claude |

## Priorite recherche

```
1. mgrep (semantic) — TOUJOURS en premier si disponible
2. Si mgrep indisponible: WebSearch → Glob (pattern) → Grep (regex) → Read (fichier direct)
```

## Environnement recommande (macOS)

- **Package manager:** Homebrew (`/opt/homebrew/bin/brew`)
- **Node.js:** via nvm (gestion versions propre)
- **Git:** gh CLI pour GitHub (`gh auth login`)
- **IDE:** Cursor, Zed, ou VS Code
- **Terminal:** Ghostty, iTerm2, ou Warp

## CLI modernes (remplacements utiles)

```bash
brew install ripgrep fd bat eza jq gh
```

| CLI moderne | Remplace | Usage |
|-------------|----------|-------|
| `ripgrep` (rg) | grep | Recherche fichiers ultra-rapide |
| `fd` | find | Chercher des fichiers par nom |
| `bat` | cat | Afficher fichiers avec coloration |
| `eza` | ls | Lister fichiers avec icones |
| `jq` | — | Parser et manipuler du JSON |
| `gh` | — | GitHub CLI (PRs, repos, issues) |

## Variables d'environnement

```bash
# .env — JAMAIS committer ce fichier
# Ajouter .env au .gitignore TOUJOURS

NEXT_PUBLIC_SUPABASE_URL=
SUPABASE_SERVICE_ROLE_KEY=
OPENAI_API_KEY=
# etc.
```

## Setup rapide nouveau projet

```bash
# Cloner / init
git init mon-projet && cd mon-projet
echo ".env" >> .gitignore
echo "node_modules" >> .gitignore

# Next.js
npx create-next-app@latest . --typescript --tailwind --app

# Supabase local
npx supabase init && npx supabase start
```
