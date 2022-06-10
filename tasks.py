import os
import shutil

import invoke

from invoke_modules.constants import HOME_DIR
from invoke_modules.constants import DOTFILES_DIR, SRC_DST_MAP
from invoke_modules.homebrew import install_homebrew
from invoke_modules.homebrew import brew_packages
from invoke_modules.tmux import tmux_packages, update_tmux  # flake8: ignore


def create_symlink(src, dst):
    # remove old file/dir if it exists
    if os.path.isfile(dst) or os.path.islink(dst):
        os.remove(dst)
    elif os.path.isdir(dst):
        shutil.rmtree(dst)

    # make sure necessary directories exist
    base_dir = os.path.dirname(dst)
    os.makedirs(base_dir, exist_ok=True)

    # make a symlink
    os.symlink(src, dst)


@invoke.task
def create_symlinks(ctx):
    """Installs dotfiles into home folder and necessary locations."""
    print("Installing dotfile symlinks...")
    for src, dsts in SRC_DST_MAP.items():
        for dst in dsts:
            try:
                src_filename = os.path.join(DOTFILES_DIR, src)
                dst_filename = os.path.join(HOME_DIR, dst)
                print(f'{src_filename} -> {dst_filename}...')
                create_symlink(src_filename, dst_filename)
                print('Symlink complete!')
            except OSError as e:
                print(str(e))


@invoke.task
def remove_symlinks(ctx):
    print('Removing dotfile symlinks...')
    for dsts in SRC_DST_MAP.values():
        for dst in dsts:
            os.unlink(dst)
            print(f'Unlinked {dst}')


@invoke.task(pre=[
    install_homebrew, brew_packages, create_symlinks, tmux_packages
])
def fresh_install(ctx):
    """Installs all tools (brew, zsh, tmux, vim) from scratch, and installs
    symlinks.

    NOTE: DOES NOT INSTALL PYTHON PACKAGES BY DEFAULT. USE FLAG IF NEEDED.
    """
    pass
