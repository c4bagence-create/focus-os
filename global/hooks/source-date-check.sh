#!/bin/bash
# Hook PostToolUse (WebSearch) — alerte si les sources sont vieilles
# Vérifie la présence de dates < 2024 dans les résultats
RESULT=$(cat)
if echo "$RESULT" | grep -qE '202[0-3]|201[0-9]' 2>/dev/null; then
    echo "⚠️  Attention: certaines sources semblent datées (avant 2024). Privilégie les sources récentes."
fi
