# Guide d'installation complet

## Après onboarding.sh ou install.sh

### 1. Installer les plugins
```bash
./install-plugins.sh
```

### 2. Configurer les MCP (optionnel)
Les MCP (Model Context Protocol) connectent Claude à des services externes.

**Playwright** (browser automation) — installé par défaut
**Context7** (documentation live) — installé par défaut

Pour ajouter d'autres MCP, copie les configs depuis `mcp-servers-optional.json` dans ton `~/.claude/settings.json` section `mcpServers`.

### 3. Configurer Notion (optionnel)
Va sur https://www.notion.so/my-integrations, crée une intégration, et ajoute la clé dans `mcp-servers-optional.json` → `NOTION_API_KEY`.

### 4. Configurer Figma (optionnel)
```bash
claude plugin add figma@claude-plugins-official
```
Puis configure ta clé API Figma depuis https://www.figma.com/developers/api#access-tokens.

---

## MCP disponibles

| MCP | Clé requise | Source |
|-----|-------------|--------|
| Playwright | Non | Default |
| Context7 | Non | Default |
| Supabase | Oui | mcp-servers-optional.json |
| Brave Search | Oui | mcp-servers-optional.json |
| Notion | Oui | mcp-servers-optional.json |
| Figma | Oui | mcp-servers-optional.json |
| Chrome DevTools | Non | mcp-servers-optional.json |

---

## Hooks actifs

| Hook | Déclencheur | Action |
|------|-------------|--------|
| `no-env-guard.sh` | PreToolUse → Write | Bloque l'écriture de secrets |
| `format-on-write.sh` | PostToolUse → Write | Formate après chaque écriture |
| `source-date-check.sh` | PostToolUse → WebSearch | Alerte si sources < 2024 |
| `pre-compact.sh` | PreCompact | Recovery brief avant compaction |
| `refresh-rules.sh` | UserPromptSubmit | Recharge les règles globales |

---

## Vérification

```bash
# Vérifier que les hooks sont valides
bash -n ~/.claude/hooks/no-env-guard.sh
bash -n ~/.claude/hooks/pre-compact.sh
bash -n ~/.claude/hooks/source-date-check.sh

# Vérifier le settings.json
python3 -c "import json; json.load(open('~/.claude/settings.json'))"
```
