#!/bin/bash
# Refresh rules at each prompt — recharge learnings dans le contexte
# GARDE COMPACT: ne cat que les 50 premieres lignes pour eviter l'inflation tokens

if [ -f ~/.claude/rules/learnings.md ]; then
    head -50 ~/.claude/rules/learnings.md
fi
