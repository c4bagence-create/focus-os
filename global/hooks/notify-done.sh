#!/bin/bash
# Hook Stop — notification sonore et visuelle quand Claude termine
# macOS uniquement (utilise les sons système et osascript)

if [[ "$(uname)" == "Darwin" ]]; then
    # Son système
    afplay /System/Library/Sounds/Hero.aiff &
    # Notification macOS
    osascript -e 'display notification "Claude a terminé" with title "Focus OS" sound name "Hero"' 2>/dev/null || true
fi
