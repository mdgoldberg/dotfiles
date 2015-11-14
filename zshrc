# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump python pip django virtualenvwrapper brew osx vagrant history sudo)

# autojump fix
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# User configuration

source $ZSH/oh-my-zsh.sh

# enable shift+tab for going back in auto complete menu
bindkey '^[[Z' reverse-menu-complete
# use emacs key-bindings in shell
bindkey -e

# better settings for `less`
export LESS=-iXFR

# disable vim's r command
disable r

# My Aliases
alias lsash="ls -laSh"
alias zshrc="vim ~/.zshrc"
alias reload_zshrc="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias lc="latexmk -c; echo ''; ls"
alias py="python"
alias ipy="ipython"
alias r="r -q"
alias pipupgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U"
# frosh
alias frosh="cd ~/Dropbox/Frosh"
alias cs51="cd ~/Dropbox/Frosh/CS51/"
alias cs61="cd ~/Dropbox/Frosh/CS61/"
# soph
alias soph="cd ~/Dropbox/Soph"
alias cs121="cd ~/Dropbox/Soph/CS121/cs121_psets/"
alias am121="cd ~/Dropbox/Soph/AM121/am121_psets/"
alias stat110="cd ~/Dropbox/Soph/'Stat 110'/stat110_psets/"
alias stat111="cd ~/Dropbox/Soph/'Stat 111'/stat111_psets/"
alias cs124="cd ~/Dropbox/Soph/CS124/cs124_psets"
alias cs181="cd ~/Dropbox/Soph/CS181/"
# jr
alias jr="cd ~/Dropbox/Junior"
alias cs134="cd ~/Dropbox/Junior/CS134"
alias cs109="cd ~/Dropbox/Junior/CS109"
alias stat131="cd ~/Dropbox/Junior/Stat131"
alias cs182="cd ~/Dropbox/Junior/CS182"
alias sw25="cd ~/Dropbox/Junior/SW25"

# side projects/employment
alias turch="cd ~/Dropbox/Turchin/"
alias spotifyproj="workon s2i; cd ~/Dropbox/CodeStuff/spotify2itunes/"
alias pfr="workon pfr; cd ~/Dropbox/CodeStuff/HSACPosts/NFLPosts/pfr"
alias dotfiles="cd ~/dotfiles"
alias crim="workon crim; cd ~/Dropbox/Crimson/crimsononline"
alias crim_clearcache="vagrant ssh -c 'rm -rf /srv/crimson/static/CACHE' && ./vagrant_manage.sh collectstatic --noinput"

function chpwd() {
    emulate -L zsh
    ls
}

export MANPATH="/usr/local/man:$MANPATH"

export ECHO_NEST_API_KEY=MULF5TURMBIG5WPTW

# configuring environment variables and PATH
export DATADIR=$HOME/dotfiles/data
export BINDIR=$HOME/dotfiles/bin
export PATH=$BINDIR
export PATH=$PATH:$HOME/.vim/bin
export PATH=$PATH:/usr/local/bin:/usr/local
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/opt/X11/bin:/usr/texbin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:$HOME/.opam/4.01.0/bin
export PATH=$PATH:$HOME/Dropbox/Soph/AM121/AMPL
export PATH=$PATH:/usr/local/share/pypy

PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# virtualenvwrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/local/bin/virtualenvwrapper.sh
