# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.  Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# no auto-correction
unsetopt correct

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
command -v nvim > /dev/null && export EDITOR=nvim || export EDITOR=vim

# Plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump python pip history sudo)

source $ZSH/oh-my-zsh.sh

# User Configuration
# ------------------

# enable shift+tab for going back in auto complete menu
bindkey '^[[Z' reverse-menu-complete
#
# use emacs key-bindings in shell
bindkey -e

# better settings for `less`
export LESS=-iXFR

# disable vim's r command so it doesn't interfere with R
disable r

# source my aliases
source $HOME/dotfiles/zshrc_config/aliases.zshrc
source $HOME/dotfiles/zshrc_config/school.zshrc

# automatically ls after cd
function chpwd() {
    emulate -L zsh
    ls
}

# configuring some environment variables
export DOTFILES_DIR=$HOME/dotfiles
export DATA_DIR=$DOTFILES_DIR/data
export BIN_DIR=$DOTFILES_DIR/bin

# configuring PATH
export PATH=""
export PATH=$PATH:$BIN_DIR
export PATH=$PATH:~/.pyenv/bin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/opt/X11/bin:/Library/TeX/texbin
export MANPATH="/usr/local/man:$MANPATH"

# platform-specific configs
touch "$DOTFILES_DIR/zshrc_config/`uname`.zshrc"
source "$DOTFILES_DIR/zshrc_config/`uname`.zshrc"

# pyenv and pyenv-virtualenvwrapper configuration
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install -s 2.7.13
pyenv install -s 3.6.2
pyenv global 3.6.2 2.7.13

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir .git -g ""'  # to find hidden files

# prevent Python from generating bytecode
export PYTHONDONTWRITEBYTECODE=1

# holds passwords and API tokens that shouldn't be in source control
touch $DOTFILES_DIR/.secrets
source $DOTFILES_DIR/.secrets

# enables zsh autocomplete when using invoke (make for Python)
source $DATA_DIR/pyinvoke_completions.zsh
