# Focus OS v2.0 — Ton setup IA complet

Claude Code pré-configuré avec 9 agents spécialisés, des workflows project-ready, et un système de mémoire persistante. Installe une fois, utilise à vie.

---

## Ce que tu obtiens

| Composant | Détails |
|-----------|---------|
| **9 agents** | ghost (CEO), dre (frontend), tate (backend), tasha (copy), light (QA), storm (recherche), tommy (branding), forge (factory), lafouine (bibliothèque) |
| **3 skills** | vision360 (deep research), focus-process (workflow projet A→Z), agent-creation (factory d'agents) |
| **4 hooks** | Blocage .env, format auto, session learnings, refresh rules |
| **5 profils** | dev, designer, ceo, marketing, student — CLAUDE.md adapté à chaque rôle |
| **Sécurité** | git push/commit bloqués par défaut, secrets Keychain macOS, OWASP systématique |
| **Formation** | `formation.html` — guide complet interactif de chaque fonctionnalité |

---

## Prérequis

- macOS (Apple Silicon ou Intel)
- Terminal ouvert
- Compte Anthropic avec accès Claude Code ([claude.ai/code](https://claude.ai/code))

---

## Installation

### Rapide — 5 min

```bash
git clone https://github.com/[repo]/focus-kit
cd focus-kit
bash install.sh
```

Choisit un profil, installe les agents, configure Git et Keychain. Aucune question.

### Complète — 25 min

```bash
bash onboarding.sh
```

7 phases guidées: diagnostic système, profil, installation, comptes API, config avancée, pédagogie, résumé. Recommandé pour une première installation.

---

## Plugins & MCP

Après l'installation, lance le script de plugins:
```bash
./install-plugins.sh
```

**7 plugins essentiels** installés automatiquement:
| Plugin | Usage |
|--------|-------|
| commit-commands | `/commit`, `/commit-push-pr` |
| code-review | Review auto du code |
| claude-md-management | Audit CLAUDE.md |
| playground | HTML interactif pour demos |
| hookify | Créer des hooks facilement |
| safety-net | Filet de sécurité |
| security-guidance | Détection failles en temps réel |

**6 plugins optionnels** (selon ton usage):
| Plugin | Usage |
|--------|-------|
| claude-mem | Mémoire cross-sessions |
| stripe | Intégration paiement |
| figma | Lecture fichiers Figma |
| vercel | Déploiement |
| supabase | Base de données |
| github | Issues, PR, repos |

**2 MCP servers** pré-configurés:
| MCP | Usage |
|-----|-------|
| Playwright | Browser automation, screenshots |
| Context7 | Documentation live des librairies |

---

## Après l'installation

**Deux ressources à ouvrir immédiatement:**

```bash
# 1. La formation complète
open formation.html

# 2. Le parcours guidé post-installation (1h pour être opérationnel)
# Ouvre onboarding-workflow.yaml et suis les 3 phases
```

**Premier lancement:**

```bash
cd ~/Desktop/mon-projet && claude
# Dis: "Salut, présente-toi et dis-moi ce que tu sais faire"
```

---

## Structure des fichiers installés

```
~/.claude/
├── CLAUDE.md                  ← Config globale (chargée automatiquement)
├── settings.json              ← Permissions, hooks, Agent Teams
├── agents/
│   ├── ghost.md               ← CEO / stratégie / coordination
│   ├── dre.md                 ← Frontend / UI / design system
│   ├── tate.md                ← Backend / API / deploy
│   ├── tasha.md               ← Copy / ads / emails
│   ├── light.md               ← QA / review / sécurité
│   ├── storm.md               ← Recherche / veille / OSINT
│   ├── tommy.md               ← Branding / identité visuelle
│   ├── forge.md               ← Factory d'agents spécialisés
│   └── lafouine.md            ← Indexation / bibliothèque
├── rules/
│   ├── identity.md
│   ├── workflow.md
│   ├── tools.md
│   ├── vision360.md
│   └── learnings.md
├── skills/
│   ├── agent-creation/SKILL.md
│   ├── vision360/SKILL.md
│   └── focus-process/SKILL.md
└── hooks/
    ├── no-env-guard.sh
    ├── format-on-write.sh
    ├── session-learnings.sh
    └── refresh-rules.sh
```

---

## Profils

| Profil | Pour qui | Agents prioritaires |
|--------|----------|---------------------|
| **dev** | Développeur (Next.js, Supabase, APIs) | tate, dre, light, ghost |
| **designer** | Designer / Art Director | dre, tommy, storm, ghost |
| **ceo** | Entrepreneur / Fondateur | ghost, storm, tasha, tommy |
| **marketing** | Growth / Content / Ads | tasha, storm, ghost, dre |
| **student** | Étudiant / Autodidacte | ghost, light, storm, dre |

Ton profil adapte le CLAUDE.md, le ton de Claude, et les agents suggérés en priorité.

---

## Prompts de démarrage

```bash
# Stratégie
"ghost analyse si cette idée de business est viable en 2026"
"ghost planifie [projet complexe] avec 5 agents en parallèle"

# Création
"dre crée une landing page dark premium pour [produit]"
"tasha séquence email bienvenue 3 mails pour [marque]"
"tommy identité visuelle pour [marque] — palette, typo, 10 prompts image"

# Dev
"tate API REST [feature] avec auth JWT et validation Zod"
"light review sécurité OWASP avant deploy"

# Recherche
"storm veille concurrentielle sur [marché]"
"Vision360 sur [outil / technologie / décision stratégique]"

# Personnalisation
"forge crée un agent spécialisé en [domaine métier]"
```

---

## FAQ

**Q: La différence entre `install.sh` et `onboarding.sh` ?**
`install.sh` = copie les fichiers, 5 min, aucune question. `onboarding.sh` = configure tout (Homebrew, Node, comptes API, Keychain, aliases shell), 25 min, pédagogique.

**Q: Claude ne mentionne pas mes agents après installation ?**
Vérifie que `~/.claude/CLAUDE.md` existe. Si oui, relance le terminal et retape `claude`.

**Q: Puis-je utiliser Focus OS sur un projet existant ?**
Oui. `cd ~/Desktop/ton-projet && claude`. Claude lit le CLAUDE.md global + le CLAUDE.md du projet si présent.

**Q: Comment ajouter mes clés API ?**
```bash
keychain-set OPENAI_API_KEY "sk-..."
keychain-get OPENAI_API_KEY   # pour relire
```
Jamais dans le code. Jamais dans un `.env` commité.

**Q: Comment créer un agent pour mon secteur ?**
```
forge crée un agent spécialisé en [comptabilité / juridique / immobilier / etc.]
```
Forge crée le fichier, vérifie la cohérence, et l'installe dans `~/.claude/agents/`.

---

## Désinstaller

```bash
rm -rf ~/.claude/agents ~/.claude/rules ~/.claude/skills ~/.claude/hooks
rm -f ~/.claude/CLAUDE.md ~/.claude/settings.json
# La backup reste dans ~/.claude-backup-* si créée par install.sh
```

---

## Credits

**Focus OS v2.0** — Construit pour les créateurs qui veulent aller vite sans sacrifier la qualité.

`install.sh` (rapide) · `onboarding.sh` (complet) · `onboarding-workflow.yaml` (guided tour) · `formation.html` (référence)
