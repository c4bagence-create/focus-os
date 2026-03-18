#!/bin/bash
# Hook Stop — Sauvegarde auto des learnings en fin de session
# Extrait les decisions cles + learnings et les append a ~/.claude/rules/learnings.md

if [ -n "$CLAUDE_HOOK_SPAWNED" ]; then
    exit 0
fi
export CLAUDE_HOOK_SPAWNED=1

PAYLOAD=$(cat)
SESSION_CWD=$(echo "$PAYLOAD" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null)
TURN_COUNT=$(echo "$PAYLOAD" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('num_turns', 0))" 2>/dev/null)

# Ne rien faire si session trop courte (< 5 tours)
if [ -z "$TURN_COUNT" ] || [ "$TURN_COUNT" -lt 5 ] 2>/dev/null; then
    exit 0
fi

WORK_DIR="${SESSION_CWD:-$(pwd)}"
CWD_ESCAPED=$(echo "$WORK_DIR" | sed 's/\//-/g' | sed 's/^-//')
PROJECT_DIR="$HOME/.claude/projects/$CWD_ESCAPED"

TRANSCRIPT=""
if [ -d "$PROJECT_DIR" ]; then
    TRANSCRIPT=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | grep -v agent- | head -1)
fi

if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
    exit 0
fi

LEARNINGS_FILE="$HOME/.claude/rules/learnings.md"
mkdir -p "$(dirname "$LEARNINGS_FILE")"

PROMPT="Tu es un extracteur de learnings pour Claude Code.
Analyse les echanges JSONL ci-dessous (session de travail).
Extrais UNIQUEMENT les nouvelles regles/patterns importants.

Criteres de selection:
- Erreur corrigee avec une lecon claire
- Pattern de code qu'on va reutiliser
- Workflow qu'on a valide et qui marche
- Convention decidee explicitement

Format strict (max 3 items, format Markdown, une ligne chacun):
- [LEARNING] Description courte et actionnable

Si aucun learning pertinent: reponds exactement 'AUCUN'"

RESULT=$(tail -c 30720 "$TRANSCRIPT" | grep -E '^\{.*\}$' | claude -p "$PROMPT" --print 2>/dev/null)

if [ -z "$RESULT" ] || [ "$RESULT" = "AUCUN" ]; then
    exit 0
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
{
    echo ""
    echo "## Session $TIMESTAMP — $WORK_DIR"
    echo "$RESULT"
} >> "$LEARNINGS_FILE"

exit 0
