set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

default:
    @just --list

fresh-install: brew-bundle symlinks tmux

brew: brew-bundle

brew-bundle:
    ./bin/brew-bundle

symlinks:
    ./bin/link-dotfiles

tmux:
    ./bin/install-tmux-plugins

cargo:
    ./bin/install-cargo-packages

vscode:
    ./bin/install-vscode-extensions

generate-brewfile:
    ./bin/generate-brewfile
