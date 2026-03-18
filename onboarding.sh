#!/usr/bin/env bash
# =============================================================================
# FOCUS OS — Onboarding v2.0
# Configure un Mac de A à Z pour travailler avec Claude Code
# Usage: bash onboarding.sh
# =============================================================================

set -uo pipefail

# =============================================================================
# COULEURS & STYLES
# =============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# =============================================================================
# ÉTAT GLOBAL
# =============================================================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR=""

# Profil utilisateur
PROFILE=""
AI_LEVEL=""
TOOLS_USED=()

# Suivi des phases
declare -A PHASE_STATUS
ISSUES=()       # Problèmes non-bloquants à résoudre manuellement
INSTALLED=()    # Ce qui a été installé
SKIPPED=()      # Ce qui était déjà présent

# Compteur progression global
TOTAL_PHASES=7
CURRENT_PHASE=0

# Timer global
START_TIME=$(date +%s)

# Fichier d'état pour crash recovery
STATE_FILE="$HOME/.focus-onboarding-state"

# =============================================================================
# UTILITAIRES DE BASE
# =============================================================================

nl() { echo ""; }

print_banner() {
  echo ""
  echo ""
  echo -e "${DIM}  ─────────────────────────────────────────────────────${RESET}"
  echo -e "${CYAN}${BOLD}"
  echo "  ███████╗ ██████╗  ██████╗██╗   ██╗███████╗      ██████╗ ███████╗"
  echo "  ██╔════╝██╔═══██╗██╔════╝██║   ██║██╔════╝     ██╔═══██╗██╔════╝"
  echo "  █████╗  ██║   ██║██║     ██║   ██║███████╗     ██║   ██║███████╗"
  echo "  ██╔══╝  ██║   ██║██║     ██║   ██║╚════██║     ██║   ██║╚════██║"
  echo "  ██║     ╚██████╔╝╚██████╗╚██████╔╝███████║     ╚██████╔╝███████║"
  echo "  ╚═╝      ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝      ╚═════╝ ╚══════╝"
  echo -e "${RESET}"
  echo -e "${DIM}  Onboarding v2.0 — Configuration complète de A à Z${RESET}"
  echo ""
}

print_phase_header() {
  local num="$1"
  local title="$2"
  local duration="$3"
  CURRENT_PHASE=$num
  local pct=$(( (num - 1) * 100 / TOTAL_PHASES ))
  nl
  echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  echo -e "${CYAN}${BOLD}  PHASE ${num}/${TOTAL_PHASES}  ·  ${title}  ${DIM}(~${duration})${RESET}"
  echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  print_progress $pct
  nl
}

print_progress() {
  local pct="$1"
  local filled=$(( pct / 4 ))
  local empty=$(( 25 - filled ))
  local bar=""
  for ((i=0; i<filled; i++)); do bar+="█"; done
  for ((i=0; i<empty; i++)); do bar+="░"; done
  echo -e "  ${DIM}Progression: ${CYAN}[${bar}] ${pct}%${RESET}"
}

print_step() {
  echo -e "${BLUE}  ▶ $1${RESET}"
}

print_ok() {
  echo -e "${GREEN}  ✓ $1${RESET}"
  INSTALLED+=("$1")
}

print_skip() {
  echo -e "${YELLOW}  ~ $1${RESET}"
  SKIPPED+=("$1")
}

print_warn() {
  echo -e "${YELLOW}  ! $1${RESET}"
  ISSUES+=("$1")
}

print_error() {
  echo -e "${RED}  ✗ $1${RESET}"
  ISSUES+=("ERREUR: $1")
}

print_info() {
  echo -e "${DIM}    → $1${RESET}"
}

print_teach() {
  echo -e "${MAGENTA}  💡 $1${RESET}"
}

confirm() {
  local prompt="${1:-Continuer ?}"
  local default="${2:-n}"
  local hint
  if [[ "$default" == "y" ]]; then hint="[Y/n]"; else hint="[y/N]"; fi
  echo -ne "${YELLOW}  ${prompt} ${DIM}${hint}${RESET} "
  read -r response
  if [[ "$default" == "y" ]]; then
    [[ ! "$response" =~ ^[Nn]$ ]]
  else
    [[ "$response" =~ ^[Yy]$ ]]
  fi
}

ask() {
  local prompt="$1"
  echo -ne "${YELLOW}  ${prompt}: ${RESET}"
  read -r REPLY
  echo "$REPLY"
}

pause_if_needed() {
  echo ""
  echo -ne "${DIM}  [Appuie sur Entrée pour continuer...]${RESET}"
  read -r
}

run_safe() {
  local desc="$1"
  shift
  if "$@" 2>/dev/null; then
    print_ok "$desc"
    return 0
  else
    print_warn "$desc — échec (non bloquant, à vérifier manuellement)"
    return 1
  fi
}

# =============================================================================
# CRASH RECOVERY
# =============================================================================

checkpoint_start() {
  local phase="$1"
  echo "PHASE_${phase}=started" >> "$STATE_FILE"
}

checkpoint_done() {
  local phase="$1"
  # Remplace la ligne started par done
  if [[ -f "$STATE_FILE" ]]; then
    local tmp
    tmp=$(mktemp)
    grep -v "^PHASE_${phase}=" "$STATE_FILE" > "$tmp" && mv "$tmp" "$STATE_FILE"
  fi
  echo "PHASE_${phase}=done" >> "$STATE_FILE"
}

checkpoint_is_done() {
  local phase="$1"
  [[ -f "$STATE_FILE" ]] && grep -q "^PHASE_${phase}=done" "$STATE_FILE"
}

cleanup() {
  echo ""
  echo -e "${YELLOW}  Installation interrompue à la phase ${CURRENT_PHASE}/7${RESET}"
  echo -e "${DIM}  Relance ./onboarding.sh pour reprendre automatiquement.${RESET}"
  echo ""
  exit 1
}
trap cleanup SIGINT SIGTERM ERR

# =============================================================================
# PHASE 1 — DIAGNOSTIC
# =============================================================================

phase1_diagnostic() {
  checkpoint_start 1
  print_phase_header 1 "DIAGNOSTIC SYSTÈME" "5 min"

  echo -e "${BOLD}  Bienvenue dans le setup Focus OS.${RESET}"
  echo ""
  echo "  Ce script va analyser ton Mac, poser quelques questions,"
  echo "  installer les outils nécessaires, et configurer Claude Code"
  echo "  pour que tu puisses travailler comme un pro dès aujourd'hui."
  echo ""
  echo "  Durée totale estimée : 25-30 minutes"
  echo "  Aucune connaissance technique requise."
  nl

  if ! confirm "Lancer le diagnostic ?" "y"; then
    echo "  Annulé."
    exit 0
  fi

  nl
  print_step "Analyse du système en cours..."
  nl

  # --- macOS ---
  local macos_version
  macos_version=$(sw_vers -productVersion 2>/dev/null || echo "inconnu")
  local macos_name
  macos_name=$(sw_vers -productName 2>/dev/null || echo "macOS")
  local arch
  arch=$(uname -m)
  if [[ "$arch" == "arm64" ]]; then
    print_ok "macOS ${macos_version} (${macos_name}) — Apple Silicon M-series"
    print_teach "Apple Silicon = performances maximales avec Claude Code. Bonne base."
  elif [[ "$arch" == "x86_64" ]]; then
    print_ok "macOS ${macos_version} (${macos_name}) — Intel"
    print_teach "Intel fonctionne bien. Si tu upgrades un jour → Apple Silicon est 2-3x plus rapide."
  else
    print_warn "Architecture inconnue: $arch"
  fi

  # --- RAM ---
  local ram_bytes ram_gb
  ram_bytes=$(sysctl -n hw.memsize 2>/dev/null || echo 0)
  ram_gb=$(( ram_bytes / 1024 / 1024 / 1024 ))
  if (( ram_gb >= 16 )); then
    print_ok "RAM: ${ram_gb} GB — parfait pour les agents parallèles"
  elif (( ram_gb >= 8 )); then
    print_ok "RAM: ${ram_gb} GB — suffisant"
    print_teach "Avec 8 GB tu peux faire tourner 2-3 agents en parallèle. Évite d'en lancer 5+."
  else
    print_warn "RAM: ${ram_gb} GB — limite les agents parallèles à 2 max"
  fi

  # --- Disque ---
  local disk_free
  disk_free=$(df -g "$HOME" 2>/dev/null | awk 'NR==2{print $4}')
  # Validation: si la valeur n'est pas un entier, on neutralise le crash sous set -u
  if [[ ! "$disk_free" =~ ^[0-9]+$ ]]; then
    print_warn "Espace disque: lecture impossible (format inattendu)"
  elif (( disk_free >= 20 )); then
    print_ok "Espace disque: ${disk_free} GB libres"
  elif (( disk_free >= 5 )); then
    print_ok "Espace disque: ${disk_free} GB libres — suffisant"
  else
    print_warn "Espace disque: ${disk_free} GB libres — libère de l'espace avant de continuer"
  fi

  nl
  print_step "Vérification des outils..."
  nl

  # --- Homebrew ---
  if command -v brew &>/dev/null; then
    local brew_ver
    brew_ver=$(brew --version 2>/dev/null | head -1 | awk '{print $2}')
    print_ok "Homebrew ${brew_ver} — gestionnaire de paquets"
    DIAG_HOMEBREW="ok"
  else
    print_warn "Homebrew absent — sera installé en Phase 3"
    print_teach "Homebrew = le magasin d'apps pour développeurs sur Mac. Essentiel."
    DIAG_HOMEBREW="missing"
  fi

  # --- Node.js ---
  if command -v node &>/dev/null; then
    local node_ver node_major
    node_ver=$(node --version 2>/dev/null)
    # Extraire le numéro majeur (v18.x.x → 18)
    node_major=$(echo "$node_ver" | grep -oE '[0-9]+' | head -1)
    if [[ "$node_major" =~ ^[0-9]+$ ]] && (( node_major >= 18 )); then
      print_ok "Node.js ${node_ver}"
      DIAG_NODE="ok"
    else
      print_warn "Node.js ${node_ver} — version trop ancienne (Claude Code requiert Node 18+)"
      print_teach "Met à jour Node.js : brew upgrade node  ou  nvm install 18 && nvm use 18"
      DIAG_NODE="outdated"
    fi
  else
    print_warn "Node.js absent — sera installé en Phase 3"
    print_teach "Node.js est requis pour Claude Code. Sans lui, impossible de démarrer."
    DIAG_NODE="missing"
  fi

  # --- npm ---
  if command -v npm &>/dev/null; then
    local npm_ver
    npm_ver=$(npm --version 2>/dev/null)
    print_ok "npm ${npm_ver}"
    DIAG_NPM="ok"
  else
    DIAG_NPM="missing"
  fi

  # --- Git ---
  if command -v git &>/dev/null; then
    local git_name git_email
    git_name=$(git config --global user.name 2>/dev/null || echo "")
    git_email=$(git config --global user.email 2>/dev/null || echo "")
    local git_ver
    git_ver=$(git --version | awk '{print $3}')
    if [[ -n "$git_name" && -n "$git_email" ]]; then
      print_ok "Git ${git_ver} — configuré (${git_name} / ${git_email})"
      DIAG_GIT="ok"
    else
      print_warn "Git ${git_ver} — présent mais nom/email non configurés"
      DIAG_GIT="partial"
    fi
  else
    print_warn "Git absent — sera installé avec Homebrew"
    DIAG_GIT="missing"
  fi

  # --- gh CLI ---
  if command -v gh &>/dev/null; then
    local gh_ver
    gh_ver=$(gh --version 2>/dev/null | head -1 | awk '{print $3}')
    print_ok "GitHub CLI ${gh_ver}"
    DIAG_GH="ok"
  else
    print_warn "GitHub CLI absent (optionnel mais recommandé)"
    DIAG_GH="missing"
  fi

  # --- Claude Code ---
  nl
  print_step "Vérification Claude Code..."
  nl

  if command -v claude &>/dev/null; then
    local claude_ver
    claude_ver=$(claude --version 2>/dev/null || echo "version inconnue")
    print_ok "Claude Code installé — ${claude_ver}"
    print_teach "Claude Code est le cerveau du système. Tous les agents passent par lui."
    DIAG_CLAUDE="ok"
  else
    print_warn "Claude Code absent — sera installé en Phase 3"
    print_teach "Claude Code est le cerveau de tout le système. On va l'installer juste après."
    DIAG_CLAUDE="missing"
  fi

  # --- Config Claude existante ---
  nl
  print_step "Analyse de la config Claude existante..."
  nl

  if [ -d "$CLAUDE_DIR" ]; then
    local agents_count rules_count skills_count
    agents_count=$(find "$CLAUDE_DIR/agents" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    rules_count=$(find "$CLAUDE_DIR/rules" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    skills_count=$(find "$CLAUDE_DIR/skills" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

    echo -e "  ${BOLD}Config existante détectée dans ~/.claude/${RESET}"
    echo ""
    echo -e "    Agents :  ${CYAN}${agents_count}${RESET} fichiers"
    echo -e "    Rules  :  ${CYAN}${rules_count}${RESET} fichiers"
    echo -e "    Skills :  ${CYAN}${skills_count}${RESET} fichiers"
    nl

    if (( agents_count > 0 || rules_count > 0 )); then
      print_teach "Une config Claude existante sera sauvegardée avant toute modification."
      if confirm "Faire une sauvegarde de la config existante avant de continuer ?" "y"; then
        BACKUP_DIR="${CLAUDE_DIR}-backup-$(date +%Y%m%d-%H%M%S)"
        if cp -r "$CLAUDE_DIR" "$BACKUP_DIR" 2>/dev/null; then
          print_ok "Sauvegarde créée : ${BACKUP_DIR}"
        else
          print_warn "Impossible de créer la sauvegarde — on continue quand même"
        fi
      fi
    fi
    DIAG_CLAUDE_CONFIG="exists"
  else
    print_ok "Pas de config existante — installation propre"
    DIAG_CLAUDE_CONFIG="fresh"
  fi

  nl
  echo -e "  ${GREEN}${BOLD}Diagnostic terminé.${RESET}"
  PHASE_STATUS[1]="done"
  checkpoint_done 1
  pause_if_needed
}

# =============================================================================
# PHASE 2 — PROFIL
# =============================================================================

phase2_profil() {
  checkpoint_start 2
  print_phase_header 2 "TON PROFIL" "2 min"

  print_teach "Le profil adapte les agents, les règles et les raccourcis à ton métier."
  nl

  # --- Rôle ---
  echo -e "  ${BOLD}Quel est ton rôle principal ?${RESET}"
  nl
  echo "    1) Développeur      — Tu codes (Next.js, APIs, bases de données)"
  echo "    2) Designer         — UI/UX, branding, direction artistique"
  echo "    3) CEO / Stratège   — Tu pilotes, tu décides, tu scales"
  echo "    4) Marketing        — Ads, content, SEO, growth"
  echo "    5) Étudiant         — Tu apprends et explores"
  nl

  local choice
  while true; do
    choice=$(ask "Choix (1-5)")
    case "$choice" in
      1) PROFILE="dev"      ; break ;;
      2) PROFILE="designer" ; break ;;
      3) PROFILE="ceo"      ; break ;;
      4) PROFILE="marketing"; break ;;
      5) PROFILE="student"  ; break ;;
      *) echo -e "  ${RED}Choix invalide. Tape 1, 2, 3, 4 ou 5.${RESET}" ;;
    esac
  done

  nl
  print_ok "Profil sélectionné : ${BOLD}${PROFILE}${RESET}"
  nl

  # --- Niveau IA ---
  echo -e "  ${BOLD}Ton niveau avec les outils IA ?${RESET}"
  nl
  echo "    1) Débutant       — Je commence, j'ai besoin d'explications"
  echo "    2) Intermédiaire  — Je connais les bases, je veux optimiser"
  echo "    3) Avancé         — Je maîtrise, donne-moi juste les outils"
  nl

  while true; do
    choice=$(ask "Choix (1-3)")
    case "$choice" in
      1) AI_LEVEL="beginner"      ; break ;;
      2) AI_LEVEL="intermediate"  ; break ;;
      3) AI_LEVEL="advanced"      ; break ;;
      *) echo -e "  ${RED}Choix invalide. Tape 1, 2 ou 3.${RESET}" ;;
    esac
  done

  nl
  print_ok "Niveau IA : ${BOLD}${AI_LEVEL}${RESET}"
  nl

  # --- Outils existants ---
  echo -e "  ${BOLD}Quels outils tu utilises déjà ? (plusieurs choix possibles)${RESET}"
  nl
  echo "    a) Figma          b) Notion         c) Slack"
  echo "    d) Shopify        e) Supabase       f) Vercel"
  echo "    g) GitHub         h) n8n            i) Stripe"
  echo "    j) Aucun de ces outils"
  nl

  local tools_input
  tools_input=$(ask "Tape les lettres sans espace (ex: abcf) ou j pour aucun")
  TOOLS_USED=()
  [[ "$tools_input" == *"a"* ]] && TOOLS_USED+=("figma")
  [[ "$tools_input" == *"b"* ]] && TOOLS_USED+=("notion")
  [[ "$tools_input" == *"c"* ]] && TOOLS_USED+=("slack")
  [[ "$tools_input" == *"d"* ]] && TOOLS_USED+=("shopify")
  [[ "$tools_input" == *"e"* ]] && TOOLS_USED+=("supabase")
  [[ "$tools_input" == *"f"* ]] && TOOLS_USED+=("vercel")
  [[ "$tools_input" == *"g"* ]] && TOOLS_USED+=("github")
  [[ "$tools_input" == *"h"* ]] && TOOLS_USED+=("n8n")
  [[ "$tools_input" == *"i"* ]] && TOOLS_USED+=("stripe")

  nl
  if (( ${#TOOLS_USED[@]} > 0 )); then
    print_ok "Outils détectés : ${TOOLS_USED[*]}"
  else
    print_ok "Pas d'outils existants — on part de zéro, c'est parfait"
  fi

  nl
  echo -e "  ${BOLD}Résumé du profil :${RESET}"
  echo ""
  echo -e "    Rôle   : ${CYAN}${BOLD}${PROFILE}${RESET}"
  echo -e "    Niveau : ${CYAN}${BOLD}${AI_LEVEL}${RESET}"
  if (( ${#TOOLS_USED[@]} > 0 )); then
    echo -e "    Outils : ${CYAN}${TOOLS_USED[*]}${RESET}"
  fi
  nl

  PHASE_STATUS[2]="done"
  checkpoint_done 2
  pause_if_needed
}

# =============================================================================
# PHASE 3 — INSTALLATION
# =============================================================================

phase3_installation() {
  checkpoint_start 3
  print_phase_header 3 "INSTALLATION" "10 min"

  # --- Xcode Command Line Tools (requis par Homebrew) ---
  print_step "Xcode Command Line Tools"
  print_teach "Xcode CLT fournit git, make et les compilateurs de base. Homebrew en a besoin."
  nl

  if xcode-select -p &>/dev/null; then
    print_skip "Xcode CLT déjà installé ($(xcode-select -p))"
  else
    print_warn "Xcode CLT absent — lancement de l'installation..."
    print_info "Une fenêtre macOS va s'ouvrir pour confirmer l'installation. Suis les instructions."
    xcode-select --install 2>/dev/null || true
    echo ""
    echo -ne "${YELLOW}  Appuie sur Entrée une fois que Xcode CLT est installé...${RESET}"
    read -r
    if xcode-select -p &>/dev/null; then
      print_ok "Xcode CLT installé"
    else
      print_warn "Xcode CLT non détecté — Homebrew pourrait échouer"
    fi
  fi
  nl

  # --- Homebrew ---
  print_step "Homebrew — gestionnaire de paquets"
  print_teach "Homebrew installe des outils de dev comme un App Store en ligne de commande."
  nl

  if [[ "${DIAG_HOMEBREW:-missing}" == "ok" ]]; then
    print_skip "Homebrew déjà installé"
  else
    echo -e "  ${YELLOW}Installation en cours... (peut prendre 2-3 minutes)${RESET}"
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>&1 | tail -5; then
      # Charger Homebrew dans la session courante (Apple Silicon path)
      if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
      print_ok "Homebrew installé"
    else
      print_error "Homebrew — échec installation. Installe manuellement: https://brew.sh"
    fi
  fi

  nl

  # --- Node.js ---
  print_step "Node.js — requis pour Claude Code"
  print_teach "Node.js est le moteur qui fait tourner Claude Code. Sans lui, rien ne marche."
  nl

  if [[ "${DIAG_NODE:-missing}" == "ok" ]]; then
    print_skip "Node.js déjà installé (18+)"
  elif [[ "${DIAG_NODE:-missing}" == "outdated" ]]; then
    print_warn "Node.js trop ancien — mise à jour nécessaire"
    if command -v brew &>/dev/null; then
      echo -e "  ${YELLOW}Mise à jour Node.js via Homebrew...${RESET}"
      if brew upgrade node 2>/dev/null || brew install node 2>/dev/null; then
        print_ok "Node.js mis à jour"
      else
        print_warn "Mise à jour échouée. Commande manuelle : brew upgrade node"
      fi
    else
      print_warn "Homebrew non disponible — mets à jour Node.js manuellement: https://nodejs.org"
    fi
  else
    if command -v brew &>/dev/null; then
      if brew install node 2>/dev/null; then
        print_ok "Node.js installé via Homebrew"
      else
        print_error "Node.js — échec. Installe manuellement: https://nodejs.org"
      fi
    else
      print_warn "Homebrew non disponible — installe Node.js manuellement: https://nodejs.org"
    fi
  fi

  # Pin Node version with .nvmrc
  if command -v nvm &>/dev/null; then
    echo "20" > ~/.nvmrc
    print_ok ".nvmrc créé (Node 20 LTS)"
    print_teach ".nvmrc dit à nvm quelle version de Node utiliser automatiquement"
  fi

  nl

  # --- Git ---
  if [[ "${DIAG_GIT:-missing}" != "ok" ]]; then
    print_step "Git — versioning de code"
    print_teach "Git garde un historique de tout ce que tu crées. C'est ton filet de sécurité."
    nl
    if command -v brew &>/dev/null; then
      run_safe "Git installé" brew install git
    fi
    nl
  fi

  # --- Config Git ---
  if [[ "${DIAG_GIT:-missing}" == "partial" ]] || [[ "${DIAG_GIT:-missing}" == "missing" ]]; then
    print_step "Configuration Git (identité)"
    print_teach "Git a besoin de ton nom et email pour signer chaque modification que tu fais."
    nl

    local git_name_val
    git_name_val=$(git config --global user.name 2>/dev/null || echo "")
    if [[ -z "$git_name_val" ]]; then
      local input_name
      input_name=$(ask "Ton nom complet pour git (ex: Jean Dupont)")
      [[ -n "$input_name" ]] && git config --global user.name "$input_name" && print_ok "git user.name configuré"
    fi

    local git_email_val
    git_email_val=$(git config --global user.email 2>/dev/null || echo "")
    if [[ -z "$git_email_val" ]]; then
      local input_email
      input_email=$(ask "Ton email pour git")
      [[ -n "$input_email" ]] && git config --global user.email "$input_email" && print_ok "git user.email configuré"
    fi
    nl
  fi

  # --- Claude Code ---
  print_step "Claude Code — l'outil principal"
  print_teach "Claude Code = une IA avec accès à ton code, tes fichiers, et Internet. Ça pense ET ça code."
  nl

  if [[ "${DIAG_CLAUDE:-missing}" == "ok" ]]; then
    print_skip "Claude Code déjà installé"
  else
    if command -v npm &>/dev/null; then
      echo -e "  ${YELLOW}Installation en cours...${RESET}"
      if npm install -g @anthropic-ai/claude-code 2>/dev/null; then
        print_ok "Claude Code installé"
      else
        print_warn "Claude Code — échec npm. Essaie: sudo npm install -g @anthropic-ai/claude-code"
        print_info "Ou télécharge sur: https://claude.ai/code"
      fi
    else
      print_error "npm non disponible — installe Node.js d'abord"
    fi
  fi

  nl

  # --- Copie des fichiers de config ---
  print_step "Installation des agents et de la configuration"
  print_teach "Les agents sont des IA spécialisées : ghost (stratégie), dre (frontend), tate (backend), etc."
  nl

  mkdir -p "$CLAUDE_DIR"/{agents,rules,skills,hooks}

  # CLAUDE.md global
  local claude_md_src="$SCRIPT_DIR/global/CLAUDE.md"
  local claude_md_dst="$CLAUDE_DIR/CLAUDE.md"
  if [ -f "$claude_md_src" ]; then
    if [ -f "$claude_md_dst" ]; then
      print_skip "CLAUDE.md (déjà présent — voir backup si créé)"
    else
      cp "$claude_md_src" "$claude_md_dst"
      # Remplacer {{PROFILE}} par le profil choisi
      if [[ -n "$PROFILE" ]]; then
        sed -i '' "s/{{PROFILE}}/${PROFILE^^}/g" "$claude_md_dst" 2>/dev/null || \
        sed -i "s/{{PROFILE}}/${PROFILE^^}/g" "$claude_md_dst" 2>/dev/null || true
      fi
      print_ok "CLAUDE.md global installé (profil: ${PROFILE})"
    fi
  else
    print_warn "CLAUDE.md source introuvable dans $SCRIPT_DIR/global/"
  fi

  # Agents CORE
  local core_agents=("ghost" "dre" "tate" "tasha" "light" "storm" "tommy" "forge" "lafouine" "fast-executor" "standard-executor" "deep-executor" "opus-orchestrator" "rapporteur")
  local agents_installed=0
  for agent in "${core_agents[@]}"; do
    local src="$SCRIPT_DIR/global/agents/${agent}.md"
    local dst="$CLAUDE_DIR/agents/${agent}.md"
    if [ -f "$src" ]; then
      if [ -f "$dst" ]; then
        (( agents_installed++ ))
      else
        cp "$src" "$dst" && (( agents_installed++ ))
      fi
    fi
  done
  if (( agents_installed > 0 )); then
    print_ok "${agents_installed} agents installés (ghost, dre, tate, tasha, light, storm, tommy, forge, lafouine)"
  fi

  # Rules
  local rules_installed=0
  for rule_file in "$SCRIPT_DIR/global/rules/"*.md; do
    [ -f "$rule_file" ] || continue
    local fname
    fname=$(basename "$rule_file")
    local dst="$CLAUDE_DIR/rules/$fname"
    if [ ! -f "$dst" ]; then
      cp "$rule_file" "$dst" && (( rules_installed++ ))
    else
      (( rules_installed++ ))
    fi
  done
  (( rules_installed > 0 )) && print_ok "${rules_installed} rules installées"

  # Skills
  local skills_installed=0
  for skill_dir in "$SCRIPT_DIR/global/skills/"/*/; do
    [ -d "$skill_dir" ] || continue
    local sname
    sname=$(basename "$skill_dir")
    local dst="$CLAUDE_DIR/skills/$sname"
    if [ ! -d "$dst" ]; then
      cp -r "$skill_dir" "$dst" && (( skills_installed++ ))
    else
      (( skills_installed++ ))
    fi
  done
  (( skills_installed > 0 )) && print_ok "${skills_installed} skills installés"

  # Hooks
  local hooks_installed=0
  for hook_file in "$SCRIPT_DIR/global/hooks/"*.sh; do
    [ -f "$hook_file" ] || continue
    local fname
    fname=$(basename "$hook_file")
    local dst="$CLAUDE_DIR/hooks/$fname"
    if [ ! -f "$dst" ]; then
      cp "$hook_file" "$dst" && chmod +x "$dst" && (( hooks_installed++ ))
    else
      (( hooks_installed++ ))
    fi
  done
  (( hooks_installed > 0 )) && print_ok "${hooks_installed} hooks installés"

  nl

  # --- Profil spécifique ---
  local profile_src="$SCRIPT_DIR/profiles/${PROFILE}/CLAUDE.md"
  if [ -f "$profile_src" ]; then
    print_step "Application du profil ${PROFILE}"
    print_info "Le profil ajoute des instructions spécifiques à ton rôle dans CLAUDE.md"
    nl
    echo -e "  ${BOLD}Options pour ton profil ${PROFILE} :${RESET}"
    echo ""
    echo "    1) Config globale uniquement (recommandé pour démarrer)"
    echo "    2) Appliquer le profil ${PROFILE} complet (remplace le global)"
    nl
    local pchoice
    pchoice=$(ask "Choix (1-2, défaut: 1)")
    if [[ "$pchoice" == "2" ]]; then
      cp "$profile_src" "$CLAUDE_DIR/CLAUDE.md"
      if [[ -n "$PROFILE" ]]; then
        sed -i '' "s/{{PROFILE}}/${PROFILE^^}/g" "$CLAUDE_DIR/CLAUDE.md" 2>/dev/null || \
        sed -i "s/{{PROFILE}}/${PROFILE^^}/g" "$CLAUDE_DIR/CLAUDE.md" 2>/dev/null || true
      fi
      print_ok "Profil ${PROFILE} appliqué à CLAUDE.md"
    else
      print_ok "Config globale conservée (profil ${PROFILE} disponible dans ${SCRIPT_DIR}/profiles/${PROFILE}/)"
    fi
    nl
  fi

  # --- settings.json ---
  print_step "Configuration settings.json"
  print_teach "settings.json contrôle les permissions de Claude : ce qu'il peut faire seul vs ce qui demande ta validation."
  nl

  local settings_file="$CLAUDE_DIR/settings.json"
  if [ -f "$settings_file" ]; then
    print_skip "settings.json déjà présent"
  else
    cat > "$settings_file" << 'SETTINGS_EOF'
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
    print_ok "settings.json créé"
    print_info "git push et git commit sont bloqués par défaut — Claude te demandera confirmation"
  fi

  nl
  PHASE_STATUS[3]="done"
  checkpoint_done 3
  pause_if_needed
}

# =============================================================================
# PHASE 4 — COMPTES & CLÉS API
# =============================================================================

phase4_comptes() {
  checkpoint_start 4
  print_phase_header 4 "COMPTES & CLÉS API" "5 min"

  print_teach "Les clés API donnent à Claude accès à tes services. On les stocke dans le Keychain macOS — chiffré, sécurisé, jamais dans le code."
  nl

  # Fonction interne pour stocker une clé dans Keychain
  store_keychain() {
    local service_name="$1"
    local display_name="$2"
    local value="$3"
    if [[ -n "$value" ]]; then
      security add-generic-password \
        -a "$USER" \
        -s "focus-kit-${service_name}" \
        -w "$value" \
        -U 2>/dev/null && print_ok "${display_name} stockée dans Keychain" || print_warn "${display_name} — Keychain: déjà présente ou erreur"
    fi
  }

  # --- Clé API Anthropic (Claude) ---
  print_step "Clé API Anthropic (obligatoire pour Claude Code)"
  print_info "Pour créer une clé : https://console.anthropic.com → API Keys → Create Key"
  nl

  local existing_anthropic
  existing_anthropic=$(security find-generic-password -a "$USER" -s "focus-kit-ANTHROPIC_API_KEY" -w 2>/dev/null || echo "")
  if [[ -n "$existing_anthropic" ]]; then
    print_skip "Clé Anthropic déjà dans Keychain"
  else
    if confirm "Tu as une clé API Anthropic ?" "y"; then
      echo -n "  Colle ta clé API (invisible) : "
      local anthropic_key
      read -r -s anthropic_key
      echo ""
      if [[ "$anthropic_key" =~ ^sk-ant- ]]; then
        store_keychain "ANTHROPIC_API_KEY" "Clé Anthropic" "$anthropic_key"
        print_info "Pour l'utiliser dans tes projets : export ANTHROPIC_API_KEY=\$(security find-generic-password -a \$USER -s focus-kit-ANTHROPIC_API_KEY -w)"
      else
        print_warn "Format inattendu (les clés Anthropic commencent par 'sk-ant-') — stockée quand même"
        [[ -n "$anthropic_key" ]] && store_keychain "ANTHROPIC_API_KEY" "Clé Anthropic" "$anthropic_key"
      fi
    else
      print_warn "Clé Anthropic manquante — Claude Code ne pourra pas s'authentifier"
      print_info "Crée une clé sur: https://console.anthropic.com"
    fi
  fi

  nl

  # --- GitHub ---
  print_step "GitHub — versioning et collaboration"
  print_teach "GitHub stocke ton code en ligne. 'gh' CLI permet à Claude de créer des repos, des PRs sans quitter le terminal."
  nl

  if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
    local gh_user
    gh_user=$(gh api user --jq '.login' 2>/dev/null || echo "inconnu")
    print_skip "GitHub CLI déjà authentifié (${gh_user})"
  else
    if confirm "Tu as un compte GitHub ?" "y"; then
      if ! command -v gh &>/dev/null; then
        echo -e "  ${YELLOW}Installation GitHub CLI...${RESET}"
        brew install gh 2>/dev/null && print_ok "GitHub CLI installé" || print_warn "Installe manuellement: brew install gh"
      fi
      if command -v gh &>/dev/null; then
        echo ""
        echo -e "  ${YELLOW}Une fenêtre va s'ouvrir pour t'authentifier sur GitHub.${RESET}"
        echo -e "  ${YELLOW}Appuie sur Entrée pour démarrer l'authentification...${RESET}"
        read -r
        if gh auth login --hostname github.com --web 2>/dev/null; then
          print_ok "GitHub — authentifié"
        else
          print_warn "GitHub — authentification manuelle : gh auth login"
        fi
      fi
    else
      print_skip "GitHub (pas de compte)"
      print_info "Crée un compte gratuit sur: https://github.com"
    fi
  fi

  nl

  # --- Vercel ---
  if [[ " ${TOOLS_USED[*]} " == *" vercel "* ]] || confirm "Tu déploies sur Vercel ?"; then
    print_step "Vercel — déploiement frontend"
    print_teach "Vercel déploie ton site en 30 secondes depuis le terminal. Zéro config."
    nl

    if command -v vercel &>/dev/null; then
      print_skip "Vercel CLI déjà installé"
    else
      if confirm "Installer Vercel CLI ?" "y"; then
        npm install -g vercel 2>/dev/null && print_ok "Vercel CLI installé" || print_warn "Vercel CLI — échec : npm install -g vercel"
      fi
    fi
    nl
  fi

  # --- Supabase ---
  if [[ " ${TOOLS_USED[*]} " == *" supabase "* ]] || confirm "Tu utilises Supabase (base de données) ?"; then
    print_step "Supabase — base de données"
    print_teach "Supabase = PostgreSQL managé + authentification + storage. La stack moderne."
    nl

    local supa_url supa_anon
    supa_url=$(ask "URL de ton projet Supabase (ex: https://xxx.supabase.co) ou Entrée pour passer")
    supa_anon=$(ask "Clé anon publique ou Entrée pour passer")

    if [[ -n "$supa_url" ]]; then
      store_keychain "SUPABASE_URL" "Supabase URL" "$supa_url"
    fi
    if [[ -n "$supa_anon" ]]; then
      store_keychain "SUPABASE_ANON_KEY" "Supabase Anon Key" "$supa_anon"
    fi
    nl
  fi

  # --- Clés optionnelles ---
  if confirm "Configurer d'autres clés API maintenant (optionnel) ?"; then
    nl
    echo -e "  ${BOLD}Clés disponibles :${RESET}"
    echo ""
    echo "    1) OpenAI / GPT"
    echo "    2) Stripe (paiements)"
    echo "    3) Telegram Bot"
    echo "    4) Personnalisée (nom libre)"
    echo "    5) Terminer"
    echo ""
    local opt_choice
    while true; do
      opt_choice=$(ask "Choix (1-5)")
      case "$opt_choice" in
        1)
          echo -n "  Colle ta clé OpenAI (invisible) : "
          local oai_key; read -r -s oai_key; echo ""
          store_keychain "OPENAI_API_KEY" "Clé OpenAI" "$oai_key"
          ;;
        2)
          echo -n "  Colle ta clé Stripe secret (invisible) : "
          local stripe_key; read -r -s stripe_key; echo ""
          store_keychain "STRIPE_SECRET_KEY" "Clé Stripe" "$stripe_key"
          ;;
        3)
          echo -n "  Colle ton token Bot Telegram (invisible) : "
          local tg_key; read -r -s tg_key; echo ""
          store_keychain "TELEGRAM_BOT_TOKEN" "Token Telegram" "$tg_key"
          print_info "Si tu n'as pas de bot Telegram : ouvre @BotFather sur Telegram → /newbot"
          ;;
        4)
          local custom_name custom_val
          custom_name=$(ask "Nom de la clé (ex: MON_API_KEY)")
          echo -n "  Valeur (invisible) : "
          read -r -s custom_val; echo ""
          [[ -n "$custom_name" && -n "$custom_val" ]] && store_keychain "$custom_name" "$custom_name" "$custom_val"
          ;;
        5) break ;;
        *) echo -e "  ${RED}Tape 1 à 5.${RESET}" ;;
      esac
      nl
    done
  fi

  nl
  print_ok "Clés API — configuration terminée"
  print_info "Pour récupérer une clé plus tard : security find-generic-password -a \$USER -s focus-kit-NOM_CLÉ -w"

  nl
  PHASE_STATUS[4]="done"
  checkpoint_done 4
  pause_if_needed
}

# =============================================================================
# PHASE 5 — CONFIGURATION AVANCÉE
# =============================================================================

phase5_avance() {
  checkpoint_start 5
  print_phase_header 5 "CONFIGURATION AVANCÉE" "5 min"

  print_teach "On configure maintenant les outils qui font gagner 1h par jour : terminal, automatisations, monitoring."
  nl

  # --- Ghostty ---
  print_step "Terminal Ghostty"
  if command -v ghostty &>/dev/null || [ -d "/Applications/Ghostty.app" ]; then
    print_teach "Ghostty est déjà installé. On peut configurer les raccourcis et le thème."
    nl
    if confirm "Appliquer la configuration Focus OS à Ghostty ?"; then
      local ghostty_config_dir="$HOME/.config/ghostty"
      mkdir -p "$ghostty_config_dir"
      local ghostty_config="$ghostty_config_dir/config"
      if [ -f "$ghostty_config" ]; then
        cp "$ghostty_config" "${ghostty_config}.backup-$(date +%Y%m%d)" && print_info "Config Ghostty sauvegardée"
      fi
      cat > "$ghostty_config" << 'GHOSTTY_EOF'
# Focus OS — Ghostty config
theme = tokyonight_storm
font-size = 14
background-opacity = 0.92
cursor-style = bar
cursor-style-blink = true
window-decoration = false
confirm-close-surface = false
copy-on-select = clipboard
shell-integration = detect
GHOSTTY_EOF
      print_ok "Ghostty configuré (TokyoNight Storm, taille 14, opacité 92%)"
    else
      print_skip "Ghostty — config non modifiée"
    fi
  else
    print_info "Ghostty non installé. Installe-le depuis: https://ghostty.org"
    print_info "C'est le terminal le plus rapide de 2026. GPU-accelerated, open-source."
    SKIPPED+=("Ghostty (non installé)")
  fi

  nl

  # --- n8n ---
  print_step "n8n — automatisations (Zapier open-source)"
  print_teach "n8n connecte tous tes services entre eux. Ex: un lead Stripe → alerte Telegram → création Notion. 0 code."
  nl

  if command -v n8n &>/dev/null; then
    print_skip "n8n déjà installé"
    print_info "Lance-le avec: n8n start (puis ouvre http://localhost:5678)"
  else
    if confirm "Installer n8n ?"; then
      if command -v npm &>/dev/null; then
        echo -e "  ${YELLOW}Installation n8n... (peut prendre 2 minutes)${RESET}"
        if npm install -g n8n 2>/dev/null; then
          print_ok "n8n installé"
          print_info "Lance-le avec: n8n start"
          print_info "Interface: http://localhost:5678"
        else
          print_warn "n8n — échec npm. Alternative: npx n8n start (sans installation)"
        fi
      else
        print_warn "npm requis pour n8n. Installe Node.js d'abord."
      fi
    else
      print_skip "n8n (à installer plus tard)"
    fi
  fi

  nl

  # --- .zshrc / PATH ---
  print_step "Configuration shell (.zshrc)"
  print_teach "On ajoute des alias et des raccourcis à ton terminal pour aller plus vite."
  nl

  local zshrc="$HOME/.zshrc"
  local focus_marker="# FOCUS OS ALIASES"

  if grep -q "$focus_marker" "$zshrc" 2>/dev/null; then
    print_skip "Aliases Focus OS déjà dans .zshrc"
  else
    if confirm "Ajouter les alias Focus OS à .zshrc ?" "y"; then
      cat >> "$zshrc" << 'ZSHRC_EOF'

# FOCUS OS ALIASES — ajouté par onboarding.sh
alias cc="claude"
alias focus="cd ~/Desktop/bazar"
alias claude-reset="rm -rf ~/.claude/projects && echo 'Projets Claude réinitialisés'"
alias keychain-get='f(){ security find-generic-password -a $USER -s "focus-kit-$1" -w 2>/dev/null; }; f'
alias keychain-set='f(){ security add-generic-password -a $USER -s "focus-kit-$1" -w "$2" -U && echo "Stocké: $1"; }; f'
ZSHRC_EOF
      print_ok "Aliases ajoutés : cc (alias claude), focus (cd bazar), keychain-get/set"
      print_info "Redémarre le terminal ou tape: source ~/.zshrc"
    fi
  fi

  nl

  # --- Homebrew PATH Apple Silicon ---
  if [[ "$(uname -m)" == "arm64" ]]; then
    local homebrew_eval='eval "$(/opt/homebrew/bin/brew shellenv)"'
    if ! grep -q "brew shellenv" "$zshrc" 2>/dev/null; then
      if confirm "Ajouter Homebrew au PATH (Apple Silicon) ?" "y"; then
        echo "" >> "$zshrc"
        echo "$homebrew_eval" >> "$zshrc"
        eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null
        print_ok "Homebrew PATH configuré pour Apple Silicon"
      fi
    else
      print_skip "Homebrew PATH déjà dans .zshrc"
    fi
    nl
  fi

  nl
  PHASE_STATUS[5]="done"
  checkpoint_done 5
  pause_if_needed
}

# =============================================================================
# PHASE 6 — PÉDAGOGIE
# =============================================================================

phase6_pedagogie() {
  checkpoint_start 6
  print_phase_header 6 "COMMENT ÇA MARCHE" "3 min"

  if [[ "$AI_LEVEL" == "advanced" ]]; then
    print_info "Mode avancé détecté — section condensée"
    nl
  fi

  # --- Comment Claude pense ---
  print_step "Comment Claude Code fonctionne"
  nl
  print_teach "Claude lit ton CLAUDE.md à chaque session → c'est son 'cerveau' du projet."
  print_teach "Les agents (ghost, dre, tate...) sont des personnalités spécialisées qu'il peut incarner."
  print_teach "Les rules lui disent QUOI faire. Les skills lui montrent COMMENT faire."
  nl

  if [[ "$AI_LEVEL" == "beginner" ]]; then
    echo -e "  ${BOLD}Analogie simple :${RESET}"
    echo ""
    echo "    Claude = un chef cuisinier ultra-compétent"
    echo "    CLAUDE.md = la fiche de poste et les recettes"
    echo "    Agents = les spécialités (pâtissier, saucier, sommelier)"
    echo "    Rules = le règlement de la cuisine"
    echo ""
    pause_if_needed
  fi

  # --- Commandes essentielles ---
  print_step "Les commandes à connaître"
  nl
  echo -e "  ${BOLD}Au quotidien :${RESET}"
  echo ""
  echo -e "    ${CYAN}claude${RESET}                → Démarrer Claude dans le projet courant"
  echo -e "    ${CYAN}claude --continue${RESET}     → Reprendre la dernière session"
  echo -e "    ${CYAN}claude \"ma question\"${RESET}  → Poser une question directe"
  echo ""
  echo -e "  ${BOLD}Avec les agents :${RESET}"
  echo ""
  echo -e "    ${CYAN}\"ghost, analyse si cette idée est viable\"${RESET}"
  echo -e "    ${CYAN}\"dre, crée une landing page dark premium\"${RESET}"
  echo -e "    ${CYAN}\"tate, génère une API avec auth JWT\"${RESET}"
  echo -e "    ${CYAN}\"light, review mon code avant commit\"${RESET}"
  echo -e "    ${CYAN}\"storm, cherche les alternatives à Stripe en 2026\"${RESET}"
  echo ""

  if [[ "$AI_LEVEL" != "beginner" ]]; then
    echo -e "  ${BOLD}Agent Teams (parallèle) :${RESET}"
    echo ""
    echo -e "    ${CYAN}Shift+Tab${RESET}   → Mode délégation (passe la main à un teammate)"
    echo -e "    ${CYAN}Ctrl+T${RESET}      → Toggle liste des tâches en cours"
    echo ""
  fi
  nl

  # --- Vision360 ---
  print_step "Vision360 — le protocole de décision"
  nl
  print_teach "Avant de coder, Claude utilise Vision360 : analyse le problème sous 3 angles (utilisateur, business, technique)."
  print_teach "Quand tu veux une analyse approfondie → dis 'vision360 sur [sujet]'"
  nl

  # --- Focus Process ---
  print_step "Focus Process — le workflow projet"
  nl
  print_teach "Discovery → Architecture → Build → Review → Ship. Claude suit ce workflow sur chaque projet."
  print_teach "À n'importe quelle étape, tu peux demander 'où en est-on ?' et il te donne le status."
  nl

  # --- Exemples selon le profil (pas seulement AI_LEVEL) ---
  print_step "Exemples pour ton profil : ${BOLD}${PROFILE}${RESET}"
  nl
  case "$PROFILE" in
    ceo)
      echo -e "  ${BOLD}Cas d'usage CEO / Stratège :${RESET}"
      echo ""
      echo -e "    ${CYAN}\"ghost, analyse la viabilité de [mon idée] en 5 min\"${RESET}"
      echo -e "    ${CYAN}\"ghost, crée un dashboard de suivi pour [mes KPIs]\"${RESET}"
      echo -e "    ${CYAN}\"ghost, délègue la création de landing page à dre\"${RESET}"
      echo ""
      ;;
    dev)
      echo -e "  ${BOLD}Cas d'usage Développeur :${RESET}"
      echo ""
      echo -e "    ${CYAN}\"tate, génère une API REST avec auth JWT et rate limiting\"${RESET}"
      echo -e "    ${CYAN}\"light, review ce fichier et cherche les failles OWASP\"${RESET}"
      echo -e "    ${CYAN}\"tate, écris les tests unitaires pour ce module\"${RESET}"
      echo ""
      ;;
    designer)
      echo -e "  ${BOLD}Cas d'usage Designer :${RESET}"
      echo ""
      echo -e "    ${CYAN}\"dre, crée une landing page dark avec glassmorphism\"${RESET}"
      echo -e "    ${CYAN}\"tommy, génère un système de couleurs pour [ma marque]\"${RESET}"
      echo -e "    ${CYAN}\"dre, transforme ce moodboard en composants Tailwind\"${RESET}"
      echo ""
      ;;
    student)
      echo -e "  ${BOLD}Cas d'usage Étudiant :${RESET}"
      echo ""
      echo -e "    ${CYAN}\"ghost, explique-moi [concept] avec un exemple concret\"${RESET}"
      echo -e "    ${CYAN}\"dre, aide-moi à construire mon premier projet Next.js\"${RESET}"
      echo -e "    ${CYAN}\"light, analyse mon code et explique ce que je peux améliorer\"${RESET}"
      echo ""
      ;;
    marketing)
      echo -e "  ${BOLD}Cas d'usage Marketing :${RESET}"
      echo ""
      echo -e "    ${CYAN}\"tasha, rédige 5 accroches pour une pub Facebook [produit]\"${RESET}"
      echo -e "    ${CYAN}\"storm, analyse les stratégies SEO des concurrents de [niche]\"${RESET}"
      echo -e "    ${CYAN}\"ghost, crée un plan de contenu pour 30 jours\"${RESET}"
      echo ""
      ;;
    *)
      echo -e "  ${BOLD}Test rapide :${RESET}"
      echo ""
      echo "    cd ~/Desktop && claude"
      echo "    \"Utilise Vision360 pour analyser [ton projet actuel]\""
      echo ""
      ;;
  esac

  if [[ "$AI_LEVEL" == "beginner" ]]; then
    echo -e "  ${BOLD}Pour commencer maintenant :${RESET}"
    echo ""
    echo "    1. Ouvre un nouveau terminal"
    echo "    2. Tape: cd ~/Desktop && claude"
    echo "    3. Copie-colle l'une des commandes ci-dessus"
    echo ""
    echo "    Le système répond en quelques secondes."
    nl
  fi

  PHASE_STATUS[6]="done"
  checkpoint_done 6
  pause_if_needed
}

# =============================================================================
# PHASE 7 — RÉSUMÉ FINAL
# =============================================================================

phase7_resume() {
  print_phase_header 7 "RÉSUMÉ FINAL" "1 min"
  print_progress 100

  nl
  echo -e "${GREEN}${BOLD}  ✓ FOCUS OS — CONFIGURATION TERMINÉE${RESET}"
  nl

  # --- Ce qui a été installé ---
  echo -e "  ${BOLD}Installé (${#INSTALLED[@]} éléments) :${RESET}"
  for item in "${INSTALLED[@]}"; do
    echo -e "    ${GREEN}✓${RESET} $item"
  done

  # --- Ce qui était déjà présent ---
  if (( ${#SKIPPED[@]} > 0 )); then
    nl
    echo -e "  ${BOLD}Déjà présent (${#SKIPPED[@]}) :${RESET}"
    for item in "${SKIPPED[@]}"; do
      echo -e "    ${YELLOW}~${RESET} $item"
    done
  fi

  # --- Problèmes à résoudre manuellement ---
  if (( ${#ISSUES[@]} > 0 )); then
    nl
    echo -e "  ${YELLOW}${BOLD}Points à résoudre manuellement :${RESET}"
    for issue in "${ISSUES[@]}"; do
      echo -e "    ${YELLOW}!${RESET} $issue"
    done
  fi

  nl
  echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

  # --- Raccourcis clés ---
  echo ""
  echo -e "  ${BOLD}Raccourcis essentiels :${RESET}"
  echo ""
  echo -e "    ${CYAN}cc${RESET}           → lance Claude (alias)"
  echo -e "    ${CYAN}focus${RESET}        → cd ~/Desktop/bazar"
  echo -e "    ${CYAN}keychain-get NOM${RESET} → lire une clé API"
  echo ""

  # --- Fichiers installés ---
  echo -e "  ${BOLD}Structure ~/.claude :${RESET}"
  echo ""
  echo "    ~/.claude/"
  echo "    ├── CLAUDE.md        ← cerveau global (chargé auto)"
  echo "    ├── settings.json    ← permissions + sécurité"
  echo "    ├── agents/          ← ghost, dre, tate, tasha, light, storm, tommy..."
  echo "    ├── rules/           ← règles de travail"
  echo "    ├── skills/          ← base de connaissances"
  echo "    └── hooks/           ← automatisations post-écriture"
  echo ""

  # --- Profil ---
  echo -e "  ${BOLD}Ton setup :${RESET}"
  echo ""
  echo -e "    Profil  : ${CYAN}${PROFILE}${RESET}"
  echo -e "    Niveau  : ${CYAN}${AI_LEVEL}${RESET}"
  if (( ${#TOOLS_USED[@]} > 0 )); then
    echo -e "    Outils  : ${CYAN}${TOOLS_USED[*]}${RESET}"
  fi
  if [[ -n "$BACKUP_DIR" ]]; then
    echo -e "    Backup  : ${DIM}${BACKUP_DIR}${RESET}"
  fi
  echo ""

  # --- Liens utiles ---
  echo -e "  ${BOLD}Liens utiles :${RESET}"
  echo ""
  echo "    Console Anthropic  → https://console.anthropic.com"
  echo "    Claude Code docs   → https://docs.anthropic.com/claude-code"
  echo "    GitHub             → https://github.com"
  echo "    Vercel             → https://vercel.com"
  echo ""

  echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
  nl
  echo -e "  ${GREEN}${BOLD}Tu es prêt.${RESET}"
  echo ""
  echo -e "  Lance ${CYAN}${BOLD}claude${RESET} dans n'importe quel dossier et commence à travailler."
  echo ""
  # --- Timer ---
  local end_time elapsed elapsed_min elapsed_sec
  end_time=$(date +%s)
  elapsed=$(( end_time - START_TIME ))
  elapsed_min=$(( elapsed / 60 ))
  elapsed_sec=$(( elapsed % 60 ))
  echo -e "  ${DIM}Installation terminée en ${elapsed_min}m ${elapsed_sec}s${RESET}"
  echo -e "  ${DIM}Focus OS v2.0 — \"Build fast, ship right.\"${RESET}"
  nl

  echo -e "${BOLD}PROCHAINE ÉTAPE:${RESET}"
  echo "  ./install-plugins.sh  — installe les plugins Claude Code"
  echo "  open formation.html   — guide complet interactif"
  echo ""

  PHASE_STATUS[7]="done"
}

# =============================================================================
# POINT D'ENTRÉE
# =============================================================================

main() {
  # Vérification macOS
  if [[ "$(uname)" != "Darwin" ]]; then
    echo -e "${RED}ERREUR: Ce script est conçu pour macOS uniquement.${RESET}"
    exit 1
  fi

  # --- Crash recovery : détection d'une installation interrompue ---
  RESUME_FROM=0
  if [[ -f "$STATE_FILE" ]]; then
    # Trouver la dernière phase "started" (interrompue)
    local last_started
    last_started=$(grep "=started" "$STATE_FILE" 2>/dev/null | tail -1 | grep -oE '[0-9]+' | head -1)
    if [[ -n "$last_started" ]]; then
      echo ""
      echo -e "${YELLOW}${BOLD}  Installation précédente interrompue détectée à la phase ${last_started}/7.${RESET}"
      echo -ne "${YELLOW}  Reprendre depuis la phase ${last_started} ? [Y/n] ${RESET}"
      read -r resume_choice
      if [[ ! "$resume_choice" =~ ^[Nn]$ ]]; then
        RESUME_FROM=$last_started
        echo -e "${GREEN}  Reprise depuis la phase ${RESUME_FROM}.${RESET}"
        echo ""
      else
        rm -f "$STATE_FILE"
        RESUME_FROM=0
      fi
    fi
  fi

  print_banner

  echo -e "  ${BOLD}Ce script va :${RESET}"
  echo ""
  echo "    1. Analyser ton Mac (système, outils existants)"
  echo "    2. Définir ton profil et niveau"
  echo "    3. Installer les outils manquants"
  echo "    4. Configurer tes comptes et clés API (dans Keychain)"
  echo "    5. Paramétrer le terminal et les automatisations"
  echo "    6. T'expliquer comment utiliser le système"
  echo "    7. Résumé complet de ce qui a été fait"
  echo ""
  echo -e "  ${YELLOW}Aucun secret ne sera stocké en clair. Tout passe par le Keychain macOS.${RESET}"
  echo -e "  ${YELLOW}Les fichiers existants sont sauvegardés avant toute modification.${RESET}"
  nl

  if ! confirm "Démarrer l'onboarding Focus OS v2 ?" "y"; then
    echo ""
    echo "  Annulé. Relance quand tu veux : bash onboarding.sh"
    exit 0
  fi

  [[ $RESUME_FROM -le 1 ]] && phase1_diagnostic || { print_skip "Phase 1 — déjà complétée"; CURRENT_PHASE=1; }
  [[ $RESUME_FROM -le 2 ]] && phase2_profil   || { print_skip "Phase 2 — déjà complétée"; CURRENT_PHASE=2; }
  [[ $RESUME_FROM -le 3 ]] && phase3_installation || { print_skip "Phase 3 — déjà complétée"; CURRENT_PHASE=3; }
  [[ $RESUME_FROM -le 4 ]] && phase4_comptes  || { print_skip "Phase 4 — déjà complétée"; CURRENT_PHASE=4; }
  [[ $RESUME_FROM -le 5 ]] && phase5_avance   || { print_skip "Phase 5 — déjà complétée"; CURRENT_PHASE=5; }
  [[ $RESUME_FROM -le 6 ]] && phase6_pedagogie || { print_skip "Phase 6 — déjà complétée"; CURRENT_PHASE=6; }
  phase7_resume

  # Nettoyage état après succès complet
  rm -f "$STATE_FILE"
}

main "$@"
