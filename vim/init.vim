set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

source $HOME/dotfiles/vim/config/general.vim
source $HOME/dotfiles/vim/config/plugin_config.vim
source $HOME/dotfiles/vim/config/keys.vim
source $HOME/dotfiles/vim/config/secrets.vim

lua require('general')
lua require('plugins')
lua require('lsp')
lua require('completion')
lua require('codenav')
lua require('formatting_config')
