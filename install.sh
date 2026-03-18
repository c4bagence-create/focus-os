#!/bin/bash
# =============================================================================
# FOCUS KIT — Install Script
# Installe Claude Code + agents + config en 1 commande
# Usage: bash install.sh
# =============================================================================

set -euo pipefail

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
INSTALLED=()
SKIPPED=()
WARNINGS=()

# =============================================================================
# FONCTIONS UTILITAIRES
# =============================================================================

print_header() {
  echo ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
  echo -e "${CYAN}${BOLD}║         FOCUS KIT — INSTALL v2.0         ║${RESET}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
  echo ""
}

print_step() {
  echo -e "${BLUE}▶ $1${RESET}"
}

print_ok() {
  echo -e "${GREEN}  ✓ $1${RESET}"
  INSTALLED+=("$1")
}

print_skip() {
  echo -e "${YELLOW}  ~ $1 (deja present, ignore)${RESET}"
  SKIPPED+=("$1")
}

print_warn() {
  echo -e "${YELLOW}  ! $1${RESET}"
  WARNINGS+=("$1")
}

print_error() {
  echo -e "${RED}  ✗ ERREUR: $1${RESET}"
}

confirm() {
  local prompt="${1:-Continuer ?} [y/N] "
  read -r -p "$(echo -e "${YELLOW}$prompt${RESET}")" response
  [[ "$response" =~ ^[Yy]$ ]]
}

# =============================================================================
# SELECTION DU PROFIL
# =============================================================================

select_profile() {
  echo -e "${BOLD}Quel est ton profil ?${RESET}"
  echo ""
  echo "  1) Dev        — Developpeur (Next.js, Supabase, APIs, deploy)"
  echo "  2) Designer   — Designer / Art Director (UI/UX, branding, visuels)"
  echo "  3) CEO        — Entrepreneur (strategie, copy, lancement produit)"
  echo "  4) Student    — Etudiant / Autodidacte (apprentissage progressif)"
  echo "  5) Marketing  — Marketeur / Growth (copywriting, ads, social media, analytics)"
  echo ""
  read -r -p "$(echo -e "${YELLOW}Choix (1-5): ${RESET}")" PROFILE_CHOICE

  case "$PROFILE_CHOICE" in
    1) PROFILE="dev" ;;
    2) PROFILE="designer" ;;
    3) PROFILE="ceo" ;;
    4) PROFILE="student" ;;
    5) PROFILE="marketing" ;;
    *)
      print_error "Choix invalide. Relance le script."
      exit 1
      ;;
  esac

  echo ""
  print_ok "Profil selectionne: ${BOLD}${PROFILE}${RESET}"
}

# =============================================================================
# VERIFICATION PREREQUIS
# =============================================================================

check_os() {
  print_step "Verification OS..."
  if [[ "$(uname)" != "Darwin" ]]; then
    print_warn "Ce script est optimise pour macOS. Certaines fonctions peuvent ne pas marcher sur $(uname)."
  else
    print_ok "macOS detecte"
  fi
}

check_homebrew() {
  print_step "Verification Homebrew..."
  if command -v brew &>/dev/null; then
    print_ok "Homebrew present: $(brew --version | head -1)"
  else
    print_warn "Homebrew absent. Installation..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_ok "Homebrew installe"
  fi
}

check_node() {
  print_step "Verification Node.js..."

  # Sourcer nvm si present pour avoir acces a node
  if [ -s "$HOME/.nvm/nvm.sh" ]; then
    # shellcheck source=/dev/null
    source "$HOME/.nvm/nvm.sh"
    print_ok "nvm detecte et charge"
  fi

  if command -v node &>/dev/null; then
    NODE_VER=$(node --version)
    print_ok "Node.js present: $NODE_VER"
  else
    print_warn "Node.js absent. Installation via Homebrew..."
    brew install node
    print_ok "Node.js installe"
  fi
}

# =============================================================================
# INSTALLATION CLAUDE CODE
# =============================================================================

install_claude_code() {
  print_step "Verification Claude Code..."
  if command -v claude &>/dev/null; then
    CLAUDE_VER=$(claude --version 2>/dev/null || echo "version inconnue")
    print_ok "Claude Code present: $CLAUDE_VER"
    return
  fi

  echo ""
  echo -e "${YELLOW}Claude Code n'est pas installe.${RESET}"
  echo "Methodes d'installation:"
  echo "  1) npm install -g @anthropic-ai/claude-code (recommande)"
  echo "  2) Telecharger sur https://claude.ai/code"
  echo ""

  if confirm "Installer via npm maintenant ?"; then
    npm install -g @anthropic-ai/claude-code
    print_ok "Claude Code installe"
  else
    print_warn "Claude Code non installe. A faire manuellement: npm install -g @anthropic-ai/claude-code"
  fi
}

# =============================================================================
# SAUVEGARDE DE L'EXISTANT
# =============================================================================

backup_existing() {
  if [ -d "$CLAUDE_DIR" ]; then
    print_step "Sauvegarde de la config existante..."
    BACKUP_DIR="${CLAUDE_DIR}-backup-$(date +%Y%m%d-%H%M%S)"
    cp -r "$CLAUDE_DIR" "$BACKUP_DIR"
    print_ok "Sauvegarde: $BACKUP_DIR"
  fi
}

# =============================================================================
# INSTALLATION DES FICHIERS
# =============================================================================

install_global_claude_md() {
  print_step "Installation CLAUDE.md global..."
  mkdir -p "$CLAUDE_DIR"

  TARGET="$CLAUDE_DIR/CLAUDE.md"
  SOURCE="$SCRIPT_DIR/global/CLAUDE.md"

  if [ -f "$TARGET" ]; then
    print_skip "CLAUDE.md (deja present — voir $BACKUP_DIR)"
  else
    cp "$SOURCE" "$TARGET"
    # Remplacer le placeholder {{PROFILE}} par le profil choisi
    if [[ -n "$PROFILE" ]]; then
      sed -i '' "s/{{PROFILE}}/${PROFILE^^}/g" "$TARGET" 2>/dev/null || \
      sed -i "s/{{PROFILE}}/${PROFILE^^}/g" "$TARGET" 2>/dev/null || true
    fi
    print_ok "CLAUDE.md installe (profil: ${PROFILE})"
  fi
}

install_profile_claude_md() {
  print_step "Installation CLAUDE.md profil ${PROFILE}..."
  SOURCE="$SCRIPT_DIR/profiles/${PROFILE}/CLAUDE.md"
  TARGET="$CLAUDE_DIR/CLAUDE.md"

  # Le profil REMPLACE le global si l'utilisateur le souhaite
  echo ""
  echo -e "${YELLOW}Le profil ${BOLD}${PROFILE}${RESET}${YELLOW} va etre merge avec le CLAUDE.md global.${RESET}"
  echo "Options:"
  echo "  1) Utiliser le global (rules generiques) — recommande"
  echo "  2) Utiliser le profil complet (specialise ${PROFILE})"
  echo ""
  read -r -p "$(echo -e "${YELLOW}Choix (1-2, defaut: 1): ${RESET}")" CLAUDE_CHOICE

  if [[ "$CLAUDE_CHOICE" == "2" ]]; then
    cp "$SOURCE" "$TARGET"
    print_ok "CLAUDE.md profil ${PROFILE} installe"
  else
    print_ok "CLAUDE.md global conserve (profil en reference dans profiles/${PROFILE}/)"
  fi
}

install_rules() {
  print_step "Installation des rules..."
  mkdir -p "$CLAUDE_DIR/rules"

  local RULES_SRC="$SCRIPT_DIR/global/rules"
  if [ ! -d "$RULES_SRC" ]; then
    print_warn "Dossier rules absent: $RULES_SRC — etape ignoree"
    return
  fi

  for rule_file in "$RULES_SRC/"*.md; do
    FILENAME=$(basename "$rule_file")
    TARGET="$CLAUDE_DIR/rules/$FILENAME"
    if [ -f "$TARGET" ]; then
      print_skip "rules/$FILENAME"
    else
      cp "$rule_file" "$TARGET"
      print_ok "rules/$FILENAME"
    fi
  done
}

install_agents() {
  print_step "Installation des agents CORE..."
  mkdir -p "$CLAUDE_DIR/agents"

  local AGENTS_SRC="$SCRIPT_DIR/global/agents"
  if [ ! -d "$AGENTS_SRC" ]; then
    print_warn "Dossier agents absent: $AGENTS_SRC — etape ignoree"
    return
  fi

  # Agents CORE toujours installes
  CORE_AGENTS=("ghost" "dre" "tate" "tasha" "light" "storm" "tommy" "forge" "lafouine" "fast-executor" "standard-executor" "deep-executor" "opus-orchestrator" "rapporteur" "clone-scout" "clone-frontend" "clone-backend" "clone-qa" "clone-security" "clone-architect" "clone-ux" "clone-perf" "clone-mobile" "clone-i18n" "clone-critic" "clone-growth" "clone-saas-analyst" "clone-linker" "clone-copy" "tac" "tic" "ninja" "spider")

  for agent in "${CORE_AGENTS[@]}"; do
    SOURCE="$AGENTS_SRC/${agent}.md"
    TARGET="$CLAUDE_DIR/agents/${agent}.md"
    if [ ! -f "$SOURCE" ]; then
      print_warn "Agent source absent: $SOURCE — ignore"
      continue
    fi
    if [ -f "$TARGET" ]; then
      print_skip "agents/${agent}.md"
    else
      cp "$SOURCE" "$TARGET"
      print_ok "agents/${agent}.md"
    fi
  done
}

install_skills() {
  print_step "Installation des skills..."
  mkdir -p "$CLAUDE_DIR/skills"

  local SKILLS_SRC="$SCRIPT_DIR/global/skills"
  if [ ! -d "$SKILLS_SRC" ]; then
    print_warn "Dossier skills absent: $SKILLS_SRC — etape ignoree"
    return
  fi

  for skill_dir in "$SKILLS_SRC/"/*/; do
    SKILL_NAME=$(basename "$skill_dir")
    TARGET_DIR="$CLAUDE_DIR/skills/$SKILL_NAME"
    if [ -d "$TARGET_DIR" ]; then
      print_skip "skills/$SKILL_NAME/"
    else
      cp -r "$skill_dir" "$TARGET_DIR"
      print_ok "skills/$SKILL_NAME/"
    fi
  done
}

install_hooks() {
  print_step "Installation des hooks..."
  mkdir -p "$CLAUDE_DIR/hooks"

  local HOOKS_SRC="$SCRIPT_DIR/global/hooks"
  if [ ! -d "$HOOKS_SRC" ]; then
    print_warn "Dossier hooks absent: $HOOKS_SRC — etape ignoree"
    return
  fi

  for hook_file in "$HOOKS_SRC/"*.sh; do
    FILENAME=$(basename "$hook_file")
    TARGET="$CLAUDE_DIR/hooks/$FILENAME"
    if [ -f "$TARGET" ]; then
      print_skip "hooks/$FILENAME"
    else
      cp "$hook_file" "$TARGET"
      chmod +x "$TARGET"
      print_ok "hooks/$FILENAME"
    fi
  done
}

# =============================================================================
# CONFIGURATION SETTINGS.JSON
# =============================================================================

configure_settings() {
  print_step "Configuration settings.json..."
  SETTINGS_FILE="$CLAUDE_DIR/settings.json"

  if [ -f "$SETTINGS_FILE" ]; then
    print_skip "settings.json (deja present)"
    return
  fi

  # Creer un settings.json de base (sans hooks du Stop sound qui est macOS-specific)
  cat > "$SETTINGS_FILE" << 'SETTINGS_EOF'
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  },
  "permissions": {
    "allow": [
      "Bash(git merge:*)",
      "Bash(tree:*)",
      "Edit(*)",
      "Write(*)",
      "Read(*)",
      "Glob(*)",
      "Grep(*)",
      "WebFetch(*)",
      "WebSearch(*)",
      "Task(*)"
    ],
    "deny": [
      "Bash(git push*)",
      "Bash(git commit*)"
    ]
  },
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/format-on-write.sh"
          },
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/no-env-guard.sh"
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/session-learnings.sh"
          }
        ]
      }
    ]
  },
  "effortLevel": "high",
  "teammateMode": "auto"
}
SETTINGS_EOF

  print_ok "settings.json configure (git push/commit bloques par defaut pour securite)"
}

# =============================================================================
# STOCKAGE SECRETS DANS KEYCHAIN
# =============================================================================

setup_keychain() {
  print_step "Configuration des secrets (Keychain macOS)..."

  if [[ "$(uname)" != "Darwin" ]]; then
    print_warn "Keychain macOS non disponible sur $(uname). Cree un fichier .env dans ton home (gitignore-le)."
    return
  fi

  echo ""
  echo -e "${YELLOW}Les secrets (API keys) ne doivent JAMAIS etre dans le code.${RESET}"
  echo "Le Focus Kit les stocke dans le Keychain macOS (chiffre, securise)."
  echo ""

  if confirm "Configurer une API key maintenant ? (optionnel, peut etre fait plus tard)"; then
    read -r -p "$(echo -e "${YELLOW}Nom du service (ex: OPENAI_API_KEY): ${RESET}")" SECRET_NAME
    read -r -s -p "$(echo -e "${YELLOW}Valeur (invisible a la frappe): ${RESET}")" SECRET_VALUE
    echo ""

    if [[ -n "$SECRET_NAME" && -n "$SECRET_VALUE" ]]; then
      security add-generic-password \
        -a "$USER" \
        -s "focus-kit-${SECRET_NAME}" \
        -w "$SECRET_VALUE" \
        -U 2>/dev/null && print_ok "Secret '${SECRET_NAME}' stocke dans Keychain" || print_warn "Keychain: secret deja present ou erreur"
    else
      print_skip "Configuration Keychain (valeurs vides)"
    fi
  else
    print_skip "Keychain (a configurer plus tard)"
    echo ""
    echo -e "${YELLOW}Pour lire un secret depuis le Keychain:${RESET}"
    echo "  security find-generic-password -a \$USER -s 'focus-kit-MON_SECRET' -w"
  fi
}

# =============================================================================
# VERIFICATION GIT / GITHUB (SECURITE)
# =============================================================================

check_git_config() {
  print_step "Verification config git..."

  if command -v git &>/dev/null; then
    GIT_USER=$(git config --global user.name 2>/dev/null || echo "")
    GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

    if [[ -z "$GIT_USER" ]]; then
      print_warn "git user.name non configure"
      read -r -p "$(echo -e "${YELLOW}Ton nom pour git (ex: Jean Dupont): ${RESET}")" GIT_NAME_INPUT
      [[ -n "$GIT_NAME_INPUT" ]] && git config --global user.name "$GIT_NAME_INPUT" && print_ok "git user.name configure"
    else
      print_ok "git user.name: $GIT_USER"
    fi

    if [[ -z "$GIT_EMAIL" ]]; then
      print_warn "git user.email non configure"
      read -r -p "$(echo -e "${YELLOW}Ton email pour git: ${RESET}")" GIT_EMAIL_INPUT
      [[ -n "$GIT_EMAIL_INPUT" ]] && git config --global user.email "$GIT_EMAIL_INPUT" && print_ok "git user.email configure"
    else
      print_ok "git user.email: $GIT_EMAIL"
    fi
  else
    print_warn "git non installe. Installe avec: brew install git"
  fi
}

# =============================================================================
# ALIASES SHELL
# =============================================================================

install_shell_aliases() {
  print_step "Ajout des aliases shell..."

  local SHELL_RC="$HOME/.zshrc"
  if [ ! -f "$SHELL_RC" ]; then
    SHELL_RC="$HOME/.bashrc"
  fi

  local ALIASES_MARKER="# Focus Kit aliases"

  if grep -q "$ALIASES_MARKER" "$SHELL_RC" 2>/dev/null; then
    print_skip "Aliases Focus Kit (deja presents dans $SHELL_RC)"
    return
  fi

  cat >> "$SHELL_RC" << 'ALIASES_EOF'

# Focus Kit aliases
alias cc="claude"
alias ccs="claude --continue"
alias focus="cd ~/Desktop/bazar && claude"
ALIASES_EOF

  print_ok "Aliases ajoutes dans $SHELL_RC (cc, ccs, focus)"
  echo -e "${YELLOW}  → Recharge ton shell: source $SHELL_RC${RESET}"
}

# =============================================================================
# RESUME FINAL
# =============================================================================

print_summary() {
  echo ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
  echo -e "${CYAN}${BOLD}║              INSTALLATION OK             ║${RESET}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
  echo ""

  echo -e "${GREEN}${BOLD}Installe (${#INSTALLED[@]} elements):${RESET}"
  for item in "${INSTALLED[@]}"; do
    echo -e "${GREEN}  ✓ $item${RESET}"
  done

  if [[ ${#SKIPPED[@]} -gt 0 ]]; then
    echo ""
    echo -e "${YELLOW}${BOLD}Ignore / deja present (${#SKIPPED[@]}):${RESET}"
    for item in "${SKIPPED[@]}"; do
      echo -e "${YELLOW}  ~ $item${RESET}"
    done
  fi

  if [[ ${#WARNINGS[@]} -gt 0 ]]; then
    echo ""
    echo -e "${YELLOW}${BOLD}Points d'attention:${RESET}"
    for item in "${WARNINGS[@]}"; do
      echo -e "${YELLOW}  ! $item${RESET}"
    done
  fi

  echo ""
  echo -e "${BOLD}Profil installe: ${CYAN}${PROFILE}${RESET}"
  echo -e "${BOLD}Config Claude:   ${CYAN}~/.claude/${RESET}"
  echo ""
  echo -e "${BOLD}Pour demarrer:${RESET}"
  echo "  cd ~/Desktop/mon-projet && claude"
  echo ""
  echo -e "${BOLD}Agents disponibles:${RESET}"
  echo "  ghost (CEO), dre (frontend), tate (backend), tasha (copy)"
  echo "  light (QA), storm (recherche), tommy (branding)"
  echo "  forge (factory agents), lafouine (bibliotheque)"
  echo ""
  echo -e "${YELLOW}IMPORTANT: git push et git commit sont bloques par defaut.${RESET}"
  echo -e "${YELLOW}Claude te demandera confirmation avant chaque action git sensible.${RESET}"
  echo ""
  echo -e "${GREEN}${BOLD}Focus Kit pret. Bonne session.${RESET}"
  echo ""
}

# =============================================================================
# MAIN
# =============================================================================

main() {
  print_header

  echo -e "${BOLD}Ce script va installer:${RESET}"
  echo "  - Les agents CORE (ghost, dre, tate, tasha, light, storm, tommy, forge, lafouine)"
  echo "  - Les rules (workflow, securite, vision360)"
  echo "  - Les skills (agent-creation, vision360, focus-process)"
  echo "  - Les hooks (format-on-write, no-env-guard, session-learnings)"
  echo "  - La configuration settings.json"
  echo ""
  echo -e "${YELLOW}Les fichiers existants ne seront PAS ecrases (backup auto).${RESET}"
  echo ""

  if ! confirm "Lancer l'installation ?"; then
    echo "Installation annulee."
    exit 0
  fi

  echo ""
  select_profile
  echo ""

  check_os
  check_homebrew
  check_node
  install_claude_code
  echo ""

  backup_existing
  echo ""

  install_global_claude_md
  install_profile_claude_md
  install_rules
  install_agents
  install_skills
  install_hooks
  configure_settings
  echo ""

  check_git_config
  echo ""

  install_shell_aliases
  echo ""

  if [[ "$(uname)" == "Darwin" ]]; then
    setup_keychain
    echo ""
  fi

  print_summary
}

main "$@"
