# Justfile recipe names

Date: 2026-10-15

## Problem

The current `brew` and `brew-bundle` recipes do not clearly communicate whether
they install from `Brewfile` or regenerate it. The existing `generate-brewfile`
recipe also does not share a common prefix with the installer.

## Decision

Rename the Brewfile-related recipes to:

- `brewfile-install`: apply the checked-in `Brewfile` by invoking the existing
  `bin/brew-bundle` script.
- `brewfile-generate`: regenerate the `Brewfile` by invoking the existing
  `bin/generate-brewfile` script.

Remove the `brew` and `brew-bundle` recipes. Update `fresh-install` to depend on
`brewfile-install`.

Add `##` descriptions to every public recipe so `just --list` explains each
task. The descriptions for the two Brewfile recipes must explicitly distinguish
installing from and regenerating the `Brewfile`.

## Scope

Only the Justfile recipe names, recipe descriptions, and the
`fresh-install` dependency change. The shell scripts and their behavior remain
unchanged.

## Validation

Run `just --list` and confirm that it shows the renamed recipes with useful
descriptions and no `brew` or `brew-bundle` recipes. Inspect the final diff to
confirm that the underlying scripts were not changed.
