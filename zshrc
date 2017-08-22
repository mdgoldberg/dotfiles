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
export EDITOR=nvim

# Plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump python pip django virtualenvwrapper osx vagrant history sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# autojump config
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'  # to find hidden files

# enable shift+tab for going back in auto complete menu
bindkey '^[[Z' reverse-menu-complete
#
# use emacs key-bindings in shell
bindkey -e

# better settings for `less`
export LESS=-iXFR

# disable vim's r command so it doesn't interfere with R
disable r

# note: precmd is run before each command
precmd()
{
    stty sane;
}

# source my aliases
source $HOME/dotfiles/zshrc_config/aliases.zshrc
source $HOME/dotfiles/zshrc_config/school.zshrc

# side projects/employment
alias turch="cd $HOME/Dropbox/Turchin/"
alias spotifyproj="cd $HOME/Dropbox/CodeStuff/spotify2itunes/"
alias sportsref="cd $HOME/Dropbox/CodeStuff/sports_analytics/sportsref"
alias dotfiles="cd $HOME/dotfiles"

# automatically ls after cd
function chpwd() {
    emulate -L zsh
    ls
}

# set up a Framework build of Python
function fwpy2 {
	if [[ ! -z "$VIRTUAL_ENV" ]]; then
		PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python2 "$@"
	else
		python2 "$@"
	fi
}
# set up a Framework build of Python
function fwpy3 {
	if [[ ! -z "$VIRTUAL_ENV" ]]; then
		PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
	else
		python3 "$@"
	fi
}
# set up a Framework build of IPython
alias fwipy2="fwpy2 -m IPython"
alias fwipy3="fwpy3 -m IPython"

# configuring environment variables like PATH
export DOTFILES_DIR=$HOME/dotfiles
export DATA_DIR=$DOTFILES_DIR/data
export BIN_DIR=$DOTFILES_DIR/bin
export PATH=$BIN_DIR
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/opt/X11/bin:/Library/TeX/texbin
export MANPATH="/usr/local/man:$MANPATH"

# prevent Python from generating bytecode
export PYTHONDONTWRITEBYTECODE=1

# holds passwords and API tokens that shouldn't be in source control
source $DOTFILES_DIR/.secrets

# enables zsh autocomplete when using invoke (make for Python)
source $DATA_DIR/pyinvoke_completions.zsh

# virtualenvwrapper config
export VIRTUALENVWRAPPER_PYTHON=$(which python2)
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
