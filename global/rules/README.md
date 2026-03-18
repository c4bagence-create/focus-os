# Rules — Focus OS

## Comment ca marche

Chaque rule a un frontmatter YAML avec:
- `alwaysApply: true` → chargee a CHAQUE session
- `alwaysApply: false` → chargee quand pertinent (selon globs/tags)
- `globs` → patterns de fichiers qui declenchent le chargement
- `tags` → mots-cles pour recherche

## Rules disponibles

| Rule | Always | Tags |
|------|--------|------|
| identity | oui | core, persona |
| workflow | oui | core, agents, git |
| learnings | oui | core, rules |
| vision360 | non | research, decision |
| tools | non | tools, plugins, mcp |

## Ajouter une rule

1. Creer `rules/ma-rule.md` avec le frontmatter
2. Le contenu suit: regles claires, exemples concrets, max 100 lignes
