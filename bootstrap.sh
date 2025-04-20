#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Config
# ----------------------------
MACHINE_TYPE="${1:-personal}" # Default to 'personal' if not passed
REPO_NAME="ansible_automation"
ANSIBLE_REPO="https://github.com/saikrishnamohan7/ansible_automation.git"
PROJECTS_DIR="$HOME/projects"
CLONE_DIR="$PROJECTS_DIR/$REPO_NAME"

# ----------------------------
# Logging Helper
# ----------------------------
info() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

# ----------------------------
# Bootstrap
# ----------------------------
info "Bootstrapping '$MACHINE_TYPE' machine..."

# Install Xcode tools (if needed)
info "Installing Xcode Command Line Tools (if needed)..."
xcode-select --install 2>/dev/null || true

# Install Homebrew (if missing)
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load brew into shell session (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install git + ansible
info "Installing git and ansible..."
brew install git ansible

# Clone your Ansible repo if it doesn't exist
info "Cloning Ansible repo into $CLONE_DIR..."
mkdir -p "$PROJECTS_DIR"
cd "$PROJECTS_DIR"

if [ ! -d "$REPO_NAME" ]; then
  git clone "$ANSIBLE_REPO"
else
  info "Repo already cloned. Pulling latest changes..."
  cd "$REPO_NAME" && git pull
fi

# Run Ansible playbook
cd "$CLONE_DIR"
info "Running Ansible playbook..."
ansible-playbook -i localhost, -c local playbook.yml -e "machine_type=$MACHINE_TYPE"
