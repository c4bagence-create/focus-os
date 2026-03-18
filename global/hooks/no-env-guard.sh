#!/bin/bash
# Bloque toute tentative d'ecrire dans un fichier .env
# Protection contre les secrets en clair dans le code

FILE=$(echo "$CLAUDE_TOOL_INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('file_path',''))" 2>/dev/null)
if [[ "$FILE" =~ \.env$ ]] && [[ "$FILE" != *".env.example"* ]]; then
  echo "BLOQUE: Tentative d'ecriture dans $FILE — les secrets vont dans un .env gitignore ou dans le Keychain" >&2
  exit 1
fi
