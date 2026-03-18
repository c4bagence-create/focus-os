#!/bin/bash
# Format automatique apres chaque Write sur fichiers JS/TS/CSS/HTML
# OPTIONNEL: n'agit QUE si prettier est deja installe

FILE=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('file_path',''))" 2>/dev/null)

# Ne rien faire si le fichier n'est pas un type formattable
[[ ! "$FILE" =~ \.(js|ts|jsx|tsx|css|html|json)$ ]] && exit 0

# Verifier que prettier est installe AVANT de l'appeler
if command -v prettier &>/dev/null; then
  prettier --write "$FILE" 2>/dev/null || true
elif [ -f ./node_modules/.bin/prettier ]; then
  ./node_modules/.bin/prettier --write "$FILE" 2>/dev/null || true
fi
# Si prettier n'existe nulle part: on ne fait rien, pas de npx qui download
