# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.  Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="geoffgarside"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=vim

# Plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump python pip django virtualenvwrapper brew osx vagrant history sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# autojump config
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# My Aliases
alias lsash="ls -laSh"
alias zshrc="vim $HOME/.zshrc"
alias reload_zshrc="source $HOME/.zshrc"
alias vimrc="vim $HOME/.vim/vimrc"
alias htop="sudo htop"
alias gloga='git log --oneline --decorate --color --graph --all'
alias py="python"
alias py3="python3"
alias ipy="python -m IPython"
alias ipy3="python3 -m IPython"
alias pip="python -m pip"
alias pip3="python3 -m pip"
alias r="r -q"
alias lc="latexmk -c; echo ''; ls"
alias diff="colordiff"
alias pip_upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U"
alias register_pypi="python setup.py register"
alias upload_pypi="rm -rf dist && python setup.py sdist bdist_wheel && twine upload dist/* && rm -rf dist build *.egg_info"
alias new_data_analysis="cookiecutter https://github.com/drivendata/cookiecutter-data-science"

# frosh
alias frosh="cd $HOME/Dropbox/Frosh"
alias cs51="cd $HOME/Dropbox/Frosh/CS51/"
alias cs61="cd $HOME/Dropbox/Frosh/CS61/"
# soph
alias soph="cd $HOME/Dropbox/Soph"
alias cs121="cd $HOME/Dropbox/Soph/CS121/cs121_psets/"
alias am121="cd $HOME/Dropbox/Soph/AM121/am121_psets/"
alias stat110="cd $HOME/Dropbox/Soph/'Stat 110'/stat110_psets/"
alias stat111="cd $HOME/Dropbox/Soph/'Stat 111'/stat111_psets/"
alias cs124="cd $HOME/Dropbox/Soph/CS124/cs124_psets"
alias cs181="cd $HOME/Dropbox/Soph/CS181/"
# jr
alias jr="cd $HOME/Dropbox/Junior"
alias cs134="cd $HOME/Dropbox/Junior/CS134"
alias cs109="cd $HOME/Dropbox/Junior/CS109"
alias stat131="cd $HOME/Dropbox/Junior/Stat131"
alias cs182="cd $HOME/Dropbox/Junior/CS182"
alias cs136="cd $HOME/Dropbox/Junior/CS136"
# sr
alias sr="cd $HOME/Dropbox/Senior"
alias mcb112="cd $HOME/Dropbox/Senior/mcb112 && workon mcb112"
alias psy1401="cd $HOME/Dropbox/Senior/psy1401"
alias stat120="cd $HOME/Dropbox/Senior/stat120"
alias tf_cs182="cd $HOME/Dropbox/Senior/cs182"

# jr - cs161
export CS161_DIR="$HOME/Dropbox/Junior/CS161"
alias cs161="cd $CS161_DIR"
alias os161="cd $CS161_DIR/os161"
alias root161="cd $CS161_DIR/root"
alias debug161="cd $CS161_DIR/root > /dev/null; sys161 -w kernel"
alias gdb161="cd $CS161_DIR/root > /dev/null; mips-harvard-os161-gdb kernel"

# auto-build os161 kernel
function fullbuild161() {
    if [[ -z "$1" ]]; then
        echo "usage: build161 asst_num";
        return;
    fi

    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/kern/conf" > /dev/null
    ./config "ASST$1"
    cd "$CS161_DIR/os161/kern/compile/ASST$1" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null;
}

# auto-build os161 kernel (doesn't run ./config ASST#)
function build161() {
    if [[ -z "$1" ]]; then
        echo "usage: build161 asst_num";
        return;
    fi

    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/kern/compile/ASST$1" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null;
}

# auto-build userland for 161
function ubuild161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/os161/userland" > /dev/null
    bmake depend
    bmake
    bmake install
    cd "$orig_cwd" > /dev/null
}

# run sys161, mounting an SFS volume immediately
function run161() {
  cd $CS161_DIR/root > /dev/null;
  sys161 "$@" kernel "mount sfs lhd1";
}

# dump the SFS journal
function dumpsfs161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-dumpsfs "$@" LHD1.img;
    cd "$orig_cwd" > /dev/null;
}

# check the SFS volume's consistency
function sfsck161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-sfsck LHD1.img;
    cd "$orig_cwd" > /dev/null;
}

# clean the SFS volume
function wipesfs161() {
    orig_cwd=$(pwd);
    cd "$CS161_DIR/root" > /dev/null;
    hostbin/host-mksfs LHD1.img mydisk;
    cd "$orig_cwd" > /dev/null;
}

# side projects/employment
alias turch="cd $HOME/Dropbox/Turchin/"
alias spotifyproj="workon s2i; cd $HOME/Dropbox/CodeStuff/spotify2itunes/"
alias sportsref="workon sportsref; cd $HOME/Dropbox/CodeStuff/sports_analytics/sportsref"
alias dotfiles="cd $HOME/dotfiles"
alias crim="workon crim; cd $HOME/Dropbox/Crimson/crimsononline"
alias crim_clearcache="vagrant ssh -c 'rm -rf /srv/crimson/static/CACHE' && ./vagrant_manage.sh collectstatic --noinput"

# automatically ls after cd
function chpwd() {
    emulate -L zsh
    ls
}

# set up a Framework build of Python
function fwpy {
	if [[ ! -z "$VIRTUAL_ENV" ]]; then
		PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
	else
		python "$@"
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
alias fwipy="fwpy -m IPython"
alias fwipy3="fwpy3 -m IPython"

# prevent Python from generating bytecode
export PYTHONDONTWRITEBYTECODE=1

# holds passwords and API tokens that shouldn't be in source control
source .secrets

# configuring environment variables like PATH
export DOTFILES_DIR=$HOME/dotfiles
export DATA_DIR=$DOTFILES_DIR/data
export BIN_DIR=$DOTFILES_DIR/bin
export PATH=$BIN_DIR
export PATH=$PATH:$HOME/.vim/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/opt/X11/bin:/Library/TeX/texbin
export MANPATH="/usr/local/man:$MANPATH"

# virtualenvwrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/local/bin/virtualenvwrapper.sh
