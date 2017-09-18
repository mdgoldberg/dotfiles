# OSX-Specific .zshrc configurations
# ----------------------------------

# Plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins+=(osx)

# autojump config
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# pyenv and pyenv-virtualenvwrapper configuration
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
pyenv install -s 2.7.13
pyenv install -s 3.6.2
pyenv global 3.6.2 2.7.13
