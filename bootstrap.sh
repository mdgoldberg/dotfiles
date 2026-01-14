#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES_DIR="${DOTFILES_DIR:-$SCRIPT_DIR}"

set_brew_env() {
  if command -v brew >/dev/null 2>&1; then
    eval "$(brew shellenv)"
    return 0
  fi

  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

ensure_brew() {
  if command -v brew >/dev/null 2>&1; then
    set_brew_env
    return 0
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  set_brew_env

  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew installation succeeded, but brew is not available on PATH."
    exit 1
  fi
}

ensure_just() {
  if command -v just >/dev/null 2>&1; then
    return 0
  fi

  brew install just
}

main() {
  cd "$SCRIPT_DIR"
  ensure_brew
  ensure_just
  just fresh-install
}

main "$@"
