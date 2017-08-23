#!/usr/bin/python

from __future__ import print_function
import os
import shutil

import invoke

HOME_DIR = os.getenv('HOME')
DOTFILES_DIR = '{}/dotfiles'.format(HOME_DIR)

SRC_DST_MAP = {
    'zshrc': ['.zshrc'],
    'vim': ['.vim'], 'vim/vimrc': ['.vimrc'],
    'init.vim': ['.config/nvim/init.vim'],
    'tmux.conf': ['.tmux.conf'],
    'gitconfig': ['.gitconfig'],
    'pypirc': ['.pypirc'],
    'git_template': ['.git_template'],
    'gitignore_global': ['.gitignore_global']
}


def create_symlink(src, dst):
    # remove old file/dir if it exists
    if os.path.isfile(dst) or os.path.islink(dst):
        os.remove(dst)
    elif os.path.isdir(dst):
        shutil.rmtree(dst)
    # make sure necessary directories exist
    base_dir = os.path.dirname(dst)
    if not os.path.exists(base_dir):
        os.makedirs(base_dir)
    # make a symlink
    os.symlink(src, dst)


@invoke.task
def create_symlinks(ctx):
    """Installs dotfiles into home folder and necessary locations."""
    print("Installing dotfile symlinks...")
    for src, dsts in SRC_DST_MAP.items():
        for dst in dsts:
            try:
                print('{} -> {}'.format(src, dst))
                create_symlink(
                    '{}/{}'.format(DOTFILES_DIR, src),
                    '{}/{}'.format(HOME_DIR, dst)
                )
                print('Symlink complete!')
            except OSError as e:
                print(str(e))


@invoke.task
def homebrew(ctx):
    """Installs homebrew."""
    print("Installing homebrew...")
    ctx.run(
        '/usr/bin/ruby -e "$(curl -fsSL '
        'https://raw.githubusercontent.com/Homebrew/install/master/install)"',
        echo=True
    )


@invoke.task
def brew_packages(ctx):
    """Installs homebrew packages."""
    print("Installing homebrew packages...")
    with open('brew_cask_packages.txt', 'r') as f:
        cask_packages = [p.strip() for p in f.readlines()]
    ctx.run(
        'brew cask install {}'.format(' '.join(cask_packages)),
        echo=True, warn=True
    )
    with open('brew_packages.txt', 'r') as f:
        packages = [p.strip() for p in f.readlines()]
    ctx.run(
        'brew install {}'.format(' '.join(packages)), echo=True
    )


@invoke.task
def oh_my_zsh(ctx):
    """Installs oh-my-zsh for zsh shell."""
    print("Installing oh-my-zsh...")
    ctx.run(
        'curl -fsSLo oh-my-zsh-install.sh https://raw.github.com/'
        'robbyrussell/oh-my-zsh/master/tools/install.sh', echo=True
    )
    ctx.run(
        'sh oh-my-zsh-install.sh', echo=True, warn=True
    )
    os.remove('oh-my-zsh-install.sh')


@invoke.task
def tmux_packages(ctx):
    """Installs tpm and tmux plugins."""
    print("Installing tpm and tmux plugins...")
    ctx.run(
        'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm',
        echo=True, warn=True
    )
    ctx.run(
        '~/.tmux/plugins/tpm/bin/install_plugins', echo=True
    )


@invoke.task
def pip_packages(ctx):
    """Installs python2 and python3 packages."""
    print("Installing pip2 and pip3 packages...")
    ctx.run(
        'python2 -m pip install -r pip2_packages.txt',
        echo=True, warn=True
    )
    ctx.run(
        'python3 -m pip install -r pip3_packages.txt', echo=True, warn=True
    )


@invoke.task
def vim_plugins(ctx):
    """Installs vim-plug and all vim plugins specified in config/init.vim."""
    print("Installing vim plugins...")
    ctx.run('nvim +PlugInstall +qall', echo=True)


@invoke.task(pre=[create_symlinks, homebrew, brew_packages, oh_my_zsh,
                  tmux_packages, vim_plugins])
def fresh_install(ctx, python_packages=False):
    """Installs all tools (brew, zsh, tmux, vim) from scratch, and installs
    symlinks.

    NOTE: DOES NOT INSTALL PYTHON PACKAGES BY DEFAULT. USE FLAG IF NEEDED.
    """
    if python_packages:
        pip_packages(ctx)


@invoke.task
def update_brew(ctx):
    """Updates all brew packages."""
    print("Updating brew and brew packages...")
    ctx.run('brew update', echo=True, warn=True)
    ctx.run('brew upgrade', echo=True, warn=True)
    ctx.run('brew list > brew_packages.txt', echo=True)
    ctx.run('brew cask list > brew_cask_packages.txt', echo=True)


@invoke.task
def update_tmux(ctx):
    """Updates all tmux packages."""
    print("Updating tmux packages...")
    ctx.run('~/.tmux/plugins/tpm/bin/clean_plugins', echo=True, warn=True)
    ctx.run('~/.tmux/plugins/tpm/bin/update_plugins all', echo=True)


@invoke.task
def update_pip(ctx):
    """Updates all pip packages."""
    print("Updating pip packages...")
    ctx.run(
        'pip2 freeze --local | grep -v "^\-e" | cut -d = -f 1  | '
        'xargs -n1 pip2 install -U', echo=True, warn=True
    )
    ctx.run('pip2 freeze > pip2_packages.txt', echo=True)
    ctx.run(
        'pip3 freeze --local | grep -v "^\-e" | cut -d = -f 1  | '
        'xargs -n1 pip3 install -U', echo=True, warn=True
    )
    ctx.run('pip3 freeze > pip3_packages.txt', echo=True)


@invoke.task
def update_vim(ctx):
    """Updates all vim plugins."""
    print("Updating vim plugins...")
    ctx.run('nvim +PlugClean +PlugInstall +PlugUpdate +qall', echo=True)


@invoke.task(pre=[update_brew, update_tmux, update_pip, update_vim])
def update_packages(ctx):
    """Updates all brew, pip, and vim packages."""
    pass

# TODO: fonts from https://github.com/google/fonts/archive/master.zip
