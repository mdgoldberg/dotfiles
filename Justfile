set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

## List available recipes.
default:
    @just --list

## Set up dotfiles on a fresh machine.
fresh-install: brewfile-install symlinks tmux

## Install packages and tools from the checked-in Brewfile.
brewfile-install:
    ./bin/brew-bundle

## Link dotfiles into the home directory.
symlinks:
    ./bin/link-dotfiles

## Install tmux plugins.
tmux:
    ./bin/install-tmux-plugins

## Install configured Cargo packages.
cargo:
    ./bin/install-cargo-packages

## Install configured VS Code extensions.
vscode:
    ./bin/install-vscode-extensions

## Regenerate the Brewfile from installed Homebrew packages, overwriting it after making a backup.
brewfile-generate:
    ./bin/generate-brewfile
