alias lsash="ls -laSh"
alias zshrc="nvim $HOME/.zshrc"
alias reload_zshrc="source $HOME/.zshrc"
alias vimrc="nvim $HOME/.vim/vimrc"
alias htop="sudo htop"
alias gloga='git log --oneline --decorate --color --graph --all'
alias py2="python2"
alias py3="python3"
alias ipy2="python2 -m IPython"
alias ipy3="python3 -m IPython"
alias pip2="python2 -m pip"
alias pip3="python3 -m pip"
alias r="r -q"
alias lc="latexmk -c; echo ''; ls"
alias diff="colordiff"
alias register_pypi="python2 setup.py register"
alias upload_pypi="rm -rf dist && python2 setup.py sdist bdist_wheel && twine upload dist/* && rm -rf dist build *.egg_info"
alias new_data_analysis="cookiecutter https://github.com/drivendata/cookiecutter-data-science"

# side projects/employment
alias sportsref="cd $HOME/Dropbox/CodeStuff/sports_analytics/sportsref"
alias dotfiles="cd $HOME/dotfiles"

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

