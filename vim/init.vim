set runtimepath+=~/.vim
set packpath+=~/.vim

source $HOME/dotfiles/vim/config/general.vim

lua require('keys')
lua require('general')
lua require('plugins')
lua require('lsp')
lua require('completion')
lua require('codenav')
lua require('formatting_config')
lua require('secrets')
