#!/bin/bash
# Hook PreCompact — sauvegarde un bref recovery context avant la compaction
echo "=== PRE-COMPACT RECOVERY BRIEF ==="
echo "Date: $(date)"
echo "CWD: $(pwd)"
echo "Dernier git log:"
git log --oneline -3 2>/dev/null || echo "(pas un repo git)"
echo "=================================="
