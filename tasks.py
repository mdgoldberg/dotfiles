from __future__ import print_function
import os
import shutil
import subprocess

import invoke

HOME_DIR = os.getenv('HOME')
DOTFILES_DIR = '{}/dotfiles'.format(HOME_DIR)

PYENV_ROOT = os.path.relpath(
    subprocess.run(['pyenv', 'root'], stdout=subprocess.PIPE).stdout.strip().decode('utf-8'),
    HOME_DIR)


SRC_DST_MAP = {
    'zshrc': ['.zshrc'],
    'vim': ['.vim'],
    'vim/vimrc': ['.vimrc'],
    'vim/init.vim': ['.config/nvim/init.vim'],
    'tmux.conf': ['.tmux.conf'],
    'gitconfig': ['.gitconfig'],
    'pypirc': ['.pypirc'],
    'git_template': ['.git_template'],
    'gitignore_global': ['.gitignore_global'],
    'ctags': ['.ctags'],
    'style.yapf': ['.config/yapf/style'],
    'virtualenv_hooks.bash': [f'{PYENV_ROOT}/pyenv.d/virtualenv/after.bash']
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
                create_symlink('{}/{}'.format(DOTFILES_DIR, src),
                               '{}/{}'.format(HOME_DIR, dst))
                print('Symlink complete!')
            except OSError as e:
                print(str(e))


@invoke.task
def install_homebrew(ctx):
    """Installs homebrew."""
    if 'DARWIN' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on OS X, so not installing homebrew!')
        return
    print("Installing homebrew...")
    ctx.run(
        '/usr/bin/ruby -e "$(curl -fsSL '
        'https://raw.githubusercontent.com/Homebrew/install/master/install)"',
        echo=True)


@invoke.task
def install_linuxbrew(ctx):
    """Installs linuxbrew."""
    if 'LINUX' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on Linux, so not installing linuxbrew!')
        return
    print("Installing linuxbrew...")
    ctx.run(
        '/usr/bin/ruby -e "$(curl -fsSL '
        'https://raw.githubusercontent.com/Linuxbrew/install/master/install)"',
        echo=True)


@invoke.task
def brew_packages(ctx):
    """Installs homebrew packages."""
    if 'DARWIN' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on OS X, so not installing brew packages!')
        return
    print("Installing homebrew packages...")
    with open('brew_cask_packages.txt', 'r') as f:
        cask_packages = [p.strip() for p in f.readlines()]
    ctx.run(
        'brew cask install {}'.format(' '.join(cask_packages)),
        echo=True,
        warn=True)
    with open('brew_packages.txt', 'r') as f:
        packages = [p.strip() for p in f.readlines()]
    ctx.run('brew install {}'.format(' '.join(packages)), echo=True)


@invoke.task
def linuxbrew_packages(ctx):
    """Installs linuxbrew packages."""
    if 'LINUX' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on Linux, so not installing linuxbrew packages!')
        return
    print("Installing linuxbrew packages...")
    # with open('brew_cask_packages.txt', 'r') as f:
    #     cask_packages = [p.strip() for p in f.readlines()]
    # ctx.run(
    #     'brew cask install {}'.format(' '.join(cask_packages)),
    #     echo=True, warn=True
    # )
    with open('linuxbrew_packages.txt', 'r') as f:
        packages = [p.strip() for p in f.readlines()]
    ctx.run('linuxbrew install {}'.format(' '.join(packages)), echo=True)


@invoke.task
def pyenv_install(ctx):
    """Installs python versions from pyenv and configures virtualenvs."""
    py2_ver = '2.7.14'
    py3_ver = '3.6.3'
    ctx.run('eval "$(pyenv init -)"')
    ctx.run('eval "$(pyenv virtualenv-init -)"')
    for py_ver in (py2_ver, py3_ver):
        print('Installing python version {}'.format(py_ver))
        ctx.run('pyenv install -s {}'.format(py_ver))
        print('Configuring a virtualenv for {} and installing CLI tools'.format(py_ver))
        venv_name = 'python{}_venv'.format(py_ver[0])
        ctx.run('pyenv virtualenv {} {}'.format(py_ver, venv_name), echo=True)
        ctx.run('pyenv activate {}'.format(venv_name))
        ctx.run('pip install neovim jedi ipython jupyter yapf', echo=True)
        ctx.run('pyenv deactivate')
    print('Making {} the primary version, {} the secondary version'.format(py2_ver, py3_ver))
    ctx.run('pyenv global {} {}'.format(py3_ver, py2_ver))


@invoke.task
def install_oh_my_zsh(ctx):
    """Installs oh-my-zsh for zsh shell."""
    print("Installing oh-my-zsh...")
    ctx.run(
        'curl -fsSLo oh-my-zsh-install.sh https://raw.github.com/'
        'robbyrussell/oh-my-zsh/master/tools/install.sh',
        echo=True)
    ctx.run('sh oh-my-zsh-install.sh', echo=True, warn=True)
    os.remove('oh-my-zsh-install.sh')

    # also install honukai theme
    print("Installing honukai zsh theme and colors...")
    THEME_URL = ('https://raw.githubusercontent.com/'
                 'oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme')
    ctx.run(
        'curl {} -o ~/.oh-my-zsh/themes/honukai.zsh-theme'.format(THEME_URL),
        echo=True)
    # also notify user for iTerm2 colors
    COLORS_URL = ('https://raw.githubusercontent.com/'
                  'oskarkrawczyk/honukai-iterm/master/honukai.itermcolors')
    print('\n\nNOTE: Also install the honukai iTerm2 colorscheme '
          'from {}'.format(COLORS_URL))


@invoke.task
def tmux_packages(ctx):
    """Installs tpm and tmux plugins."""
    print("Installing tpm and tmux plugins...")
    ctx.run(
        'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm',
        echo=True,
        warn=True)
    ctx.run('~/.tmux/plugins/tpm/bin/install_plugins', echo=True)


@invoke.task
def pip_packages(ctx):
    """Installs python2 and python3 packages."""
    print("Installing pip2 and pip3 packages...")
    ctx.run(
        'python2 -m pip install -r pip2_packages.txt', echo=True, warn=True)
    ctx.run(
        'python3 -m pip install -r pip3_packages.txt', echo=True, warn=True)


@invoke.task
def vim_plugins(ctx):
    """Installs vim-plug and all vim plugins specified in config/init.vim."""
    print("Installing vim plugins...")
    ctx.run('vim +PlugInstall +qall', echo=True)
    ctx.run('nvim +PlugInstall +qall', echo=True)


@invoke.task(pre=[
    install_homebrew, brew_packages, create_symlinks, pyenv_install, install_oh_my_zsh,
    tmux_packages, vim_plugins
])
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
        'xargs -n1 pip2 install -U',
        echo=True,
        warn=True)
    ctx.run('pip2 freeze > pip2_packages.txt', echo=True)
    ctx.run(
        'pip3 freeze --local | grep -v "^\-e" | cut -d = -f 1  | '
        'xargs -n1 pip3 install -U',
        echo=True,
        warn=True)
    ctx.run('pip3 freeze > pip3_packages.txt', echo=True)


@invoke.task
def update_vim(ctx):
    """Updates all vim plugins."""
    print("Updating vim plugins...")
    ctx.run('vim +PlugClean +PlugInstall +PlugUpdate +qall', echo=True)
    ctx.run('nvim +PlugClean +PlugInstall +PlugUpdate +qall', echo=True)


@invoke.task(pre=[update_brew, update_tmux, update_pip, update_vim])
def update_packages(ctx):
    """Updates all brew, pip, and vim packages."""
    pass


# TODO: fonts from https://github.com/google/fonts/archive/master.zip
