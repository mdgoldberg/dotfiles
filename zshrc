# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python pip django virtualenvwrapper brew osx autojump web-search vagrant)

# User configuration

source $ZSH/oh-my-zsh.sh

# enable shift+tab for going back in auto complete menu
bindkey '^[[Z' reverse-menu-complete
# use emacs key-bindings in shell
bindkey -e

# My Aliases
alias lsaSh="ls -laSh"
alias lsash="ls -laSh"
alias zshrc="vim ~/.zshrc"
alias reload_zshrc="source ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias vimupgrade="~/.vim/test.sh"
alias emacs="/usr/local/emacs"
alias lc="latexmk -c; echo ''; ls"
alias py="python"
disable r
alias r="r -q"
alias pipupgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U"
alias frosh="cd ~/Dropbox/Frosh"
alias cs51="cd ~/Dropbox/Frosh/CS51/"
alias cs61="cd ~/Dropbox/Frosh/CS61/"
alias cs121="cd ~/Dropbox/Soph/CS121/cs121_psets/"
alias am121="cd ~/Dropbox/Soph/AM121/am121_psets/"
alias stat110="cd ~/Dropbox/Soph/'Stat 110'/stat110_psets/"
alias stat111="cd ~/Dropbox/Soph/'Stat 111'/stat111_psets/"
alias cs124="cd ~/Dropbox/Soph/CS124/cs124_psets"
alias cs181="cd ~/Dropbox/Soph/CS181/"
alias turch="cd ~/Dropbox/Turchin/"
alias soph="cd ~/Dropbox/Soph"
alias spotifyproj="workon s2i; cd ~/Dropbox/CodeStuff/spotify2itunes/"
alias crim="workon crim; cd ~/Dropbox/Crimson/crimsononline"
alias crim_clearcache="vagrant ssh -c 'rm -rf /srv/crimson/static/CACHE' && ./vagrant_manage.sh collectstatic --noinput"

function chpwd() {
    emulate -L zsh
    ls
}

# OPAM configuration
. /Users/mgoldberg/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

# virtualenvwrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# export MANPATH="/usr/local/man:$MANPATH"

export ECHO_NEST_API_KEY=MULF5TURMBIG5WPTW

# configuring PATH
export PATH=/usr/local/bin:/usr/local:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Users/mgoldberg/anaconda/bin
export PATH=$PATH:/opt/X11/bin:/usr/texbin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/Users/mgoldberg/.opam/4.01.0/bin
export PATH=$PATH:/Users/mgoldberg/Dropbox/Soph/AM121/AMPL
export PATH=$PATH:/usr/local/share/pypy

PERL_MB_OPT="--install_base \"/Users/mgoldberg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mgoldberg/perl5"; export PERL_MM_OPT;
