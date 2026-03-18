#!/bin/bash
set -uo pipefail

# ============================================================
# FOCUS OS — Installation des plugins Claude Code
# ============================================================

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'
BOLD='\033[1m'

ok()   { echo -e "  ${GREEN}✓${RESET} $1"; }
fail() { echo -e "  ${RED}✗${RESET} $1"; }
info() { echo -e "  ${CYAN}ℹ${RESET} $1"; }

if ! command -v claude &>/dev/null; then
    echo -e "${RED}Claude Code n'est pas installé.${RESET}"
    echo "Lance d'abord ./onboarding.sh ou ./install.sh"
    exit 1
fi

echo ""
echo -e "${BOLD}FOCUS OS — Installation des plugins${RESET}"
echo ""

# Plugins essentiels (core workflow)
CORE_PLUGINS=(
    "commit-commands@claude-plugins-official"
    "code-review@claude-plugins-official"
    "claude-md-management@claude-plugins-official"
    "playground@claude-plugins-official"
    "hookify@claude-plugins-official"
    "safety-net@cc-marketplace"
    "security-guidance@claude-plugins-official"
)

# Plugins optionnels (selon profil)
OPTIONAL_PLUGINS=(
    "claude-mem@thedotmack"
    "stripe@claude-plugins-official"
    "figma@claude-plugins-official"
    "vercel@claude-plugins-official"
    "supabase@claude-plugins-official"
    "github@claude-plugins-official"
)

installed=0
failed=0

echo -e "${BOLD}Plugins essentiels:${RESET}"
for plugin in "${CORE_PLUGINS[@]}"; do
    name="${plugin%%@*}"
    if claude plugin add "$plugin" 2>/dev/null; then
        ok "$name"
        ((installed++))
    else
        fail "$name (erreur — tu pourras l'installer manuellement: claude plugin add $plugin)"
        ((failed++))
    fi
done

echo ""
echo -e "${BOLD}Plugins optionnels:${RESET}"
echo -e "${YELLOW}Installe ceux qui correspondent à ton usage:${RESET}"
echo ""

for plugin in "${OPTIONAL_PLUGINS[@]}"; do
    name="${plugin%%@*}"
    echo -ne "  Installer ${BOLD}$name${RESET} ? (o/N) "
    read -r answer
    if [[ "$answer" =~ ^[oOyY]$ ]]; then
        if claude plugin add "$plugin" 2>/dev/null; then
            ok "$name installé"
            ((installed++))
        else
            fail "$name (erreur)"
            ((failed++))
        fi
    else
        info "$name ignoré"
    fi
done

echo ""
echo -e "${BOLD}Résumé:${RESET} $installed installés, $failed échoués"
echo ""

echo -e "${BOLD}Configuration des marketplaces...${RESET}"
# Les marketplaces sont auto-ajoutées par claude plugin add

echo ""
echo -e "${GREEN}Plugins installés.${RESET} Relance claude pour les activer."
echo ""
