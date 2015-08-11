#!/usr/bin/env zsh

which curl >/dev/null || {
  echo "curl not found in path..."
  exit 1
}
which git >/dev/null || {
  echo "git not found in path..."
  exit 1
}

PATHOGEN_DIR="${HOME}/.vim/autoload"
BUNDLES_DIR="${HOME}/.vim/bundle"

if [[ -d "${PATHOGEN_DIR}" ]]; then
  echo "Updating pathogen..."
  curl -Sso "${PATHOGEN_DIR}/pathogen.vim" \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  echo "Done updating pathogen."
fi

if [[ -d "${BUNDLES_DIR}" ]]; then
  echo "Updating bundles..."
  git submodule update --init --recursive;
  echo "Done updating bundles."
fi
