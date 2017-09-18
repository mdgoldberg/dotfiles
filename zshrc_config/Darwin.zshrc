# OSX-Specific .zshrc configurations
# ----------------------------------

# Plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins+=(osx)

# autojump config
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Framework python build for OS X
export PYTHON_CONFIGURE_OPTS="--enable-framework"
