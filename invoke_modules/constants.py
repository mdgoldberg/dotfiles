import os

HOME_DIR = os.environ["HOME"]
DOTFILES_DIR = os.path.join(HOME_DIR, "dotfiles")

PACKAGES_DIR = os.path.join(DOTFILES_DIR, "data", "packages")
os.makedirs(PACKAGES_DIR, exist_ok=True)
BREW_PACKAGES_FILE = os.path.join(PACKAGES_DIR, "brew_packages.txt")
BREW_CASK_PACKAGES_FILE = os.path.join(PACKAGES_DIR, "brew_cask_packages.txt")
LINUXBREW_PACKAGES_FILE = os.path.join(PACKAGES_DIR, "linuxbrew_packages.txt")
PYTHON2_PACKAGES_FILE = os.path.join(PACKAGES_DIR, "python2_packages.txt")
PYTHON3_PACKAGES_FILE = os.path.join(PACKAGES_DIR, "python3_packages.txt")

PYTHON_VERSIONS = ["3.6.7", "2.7.14"]

NVIM_CONFIG_DIR = os.path.join(".config", "nvim")

SRC_DST_MAP = {
    os.path.join("zsh", "zshrc"): [".zshrc"],
    "vim": [".vim"],
    os.path.join("vim", "init.lua"): [os.path.join(NVIM_CONFIG_DIR, "init.lua")],
    os.path.join("vim", "lua"): [os.path.join(NVIM_CONFIG_DIR, "lua")],
    "tmux.conf": [".tmux.conf"],
    "gitconfig": [".gitconfig"],
    "pypirc": [".pypirc"],
    "git_template": [".git_template"],
    "gitignore_global": [".gitignore_global"],
    "isort.cfg": [".isort.cfg"],
    "flake8": [".flake8"],
    "psqlrc": [".psqlrc"],
}
