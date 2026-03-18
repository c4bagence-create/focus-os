#!/bin/bash
set -uo pipefail

# ============================================================
# FOCUS OS — Installation COMPLETE des plugins Claude Code
# Tout s'installe. Pas de questions. L'élève arrive, c'est prêt.
# ============================================================

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

ok()   { echo -e "  ${GREEN}✓${RESET} $1"; }
fail() { echo -e "  ${RED}✗${RESET} $1"; }
info() { echo -e "  ${CYAN}ℹ${RESET} $1"; }

if ! command -v claude &>/dev/null; then
    echo -e "${RED}Claude Code n'est pas installé.${RESET}"
    echo "Lance d'abord ./onboarding.sh ou ./install.sh"
    exit 1
fi

echo ""
echo -e "${BOLD}══════════════════════════════════════${RESET}"
echo -e "${BOLD}  FOCUS OS — Installation des plugins ${RESET}"
echo -e "${BOLD}══════════════════════════════════════${RESET}"
echo ""

# TOUS les plugins — on installe TOUT
ALL_PLUGINS=(
    "commit-commands@claude-plugins-official"
    "code-review@claude-plugins-official"
    "claude-md-management@claude-plugins-official"
    "playground@claude-plugins-official"
    "hookify@claude-plugins-official"
    "safety-net@cc-marketplace"
    "security-guidance@claude-plugins-official"
    "claude-mem@thedotmack"
    "stripe@claude-plugins-official"
    "figma@claude-plugins-official"
    "vercel@claude-plugins-official"
    "supabase@claude-plugins-official"
    "github@claude-plugins-official"
    "adversarial-spec@adversarial-spec"
)

# Descriptions pour que l'élève comprenne ce qui s'installe
declare -A DESCRIPTIONS
DESCRIPTIONS=(
    ["commit-commands"]="Git workflow — /commit, /commit-push-pr"
    ["code-review"]="Review automatique du code"
    ["claude-md-management"]="Audit et maintenance CLAUDE.md"
    ["playground"]="Création de démos HTML interactives"
    ["hookify"]="Création facile de hooks"
    ["safety-net"]="Filet de sécurité automatique"
    ["security-guidance"]="Détection failles OWASP en temps réel"
    ["claude-mem"]="Mémoire persistante cross-sessions"
    ["stripe"]="Intégration paiement Stripe"
    ["figma"]="Lecture fichiers et composants Figma"
    ["vercel"]="Déploiement et logs Vercel"
    ["supabase"]="Base de données et auth Supabase"
    ["github"]="Issues, PR, repos GitHub"
    ["adversarial-spec"]="Spec collaborative multi-LLM"
)

installed=0
failed=0
total=${#ALL_PLUGINS[@]}

echo -e "${BOLD}Installation de $total plugins...${RESET}"
echo ""

for plugin in "${ALL_PLUGINS[@]}"; do
    name="${plugin%%@*}"
    desc="${DESCRIPTIONS[$name]:-}"
    if claude plugin add "$plugin" 2>/dev/null; then
        ok "$name ${DIM}— $desc${RESET}"
        ((installed++))
    else
        fail "$name ${DIM}(claude plugin add $plugin)${RESET}"
        ((failed++))
    fi
done

echo ""
echo -e "${BOLD}═══════════════════════════════════${RESET}"
echo -e "  ${GREEN}$installed${RESET}/$total plugins installés"
if (( failed > 0 )); then
    echo -e "  ${RED}$failed${RESET} échoués — relance le script pour réessayer"
fi
echo -e "${BOLD}═══════════════════════════════════${RESET}"
echo ""
echo -e "${CYAN}Relance ${BOLD}claude${RESET}${CYAN} pour activer les plugins.${RESET}"
echo ""
