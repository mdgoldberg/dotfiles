import os
import subprocess

HOME_DIR = os.getenv('HOME')
DOTFILES_DIR = os.path.join(HOME_DIR, 'dotfiles')

PACKAGES_DIR = os.path.join(DOTFILES_DIR, 'data', 'packages')
os.makedirs(PACKAGES_DIR, exist_ok=True)
BREW_PACKAGES_FILE = os.path.join(PACKAGES_DIR, 'brew_packages.txt')
BREW_CASK_PACKAGES_FILE = os.path.join(PACKAGES_DIR, 'brew_cask_packages.txt')
LINUXBREW_PACKAGES_FILE = os.path.join(PACKAGES_DIR, 'linuxbrew_packages.txt')
PYTHON2_PACKAGES_FILE = os.path.join(PACKAGES_DIR, 'python2_packages.txt')
PYTHON3_PACKAGES_FILE = os.path.join(PACKAGES_DIR, 'python3_packages.txt')

PYENV_ROOT = os.path.relpath(
    subprocess.run(['pyenv', 'root'], stdout=subprocess.PIPE).stdout.strip().decode('utf-8'),
    HOME_DIR)

PYTHON_VERSIONS = ['3.6.7', '2.7.14']

NVIM_CONFIG_DIR = os.path.join('.config', 'nvim')

SRC_DST_MAP = {
    os.path.join('zsh', 'zshrc'): ['.zshrc'],
    'vim': ['.vim'],
    os.path.join('vim', 'vimrc'): ['.vimrc'],
    os.path.join('vim', 'init.vim'): [os.path.join(NVIM_CONFIG_DIR, 'init.vim')],
    os.path.join('vim', 'coc-settings.json'): [os.path.join(NVIM_CONFIG_DIR, 'coc-settings.json')],
    'tmux.conf': ['.tmux.conf'],
    'gitconfig': ['.gitconfig'],
    'pypirc': ['.pypirc'],
    'git_template': ['.git_template'],
    'gitignore_global': ['.gitignore_global'],
    'style.yapf': [os.path.join('.config', 'yapf', 'style')],
    'isort.cfg': ['.isort.cfg'],
    'flake8': ['.flake8'],
    'psqlrc': ['.psqlrc']
}