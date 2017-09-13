" Vim-Plug Plugin Manager
" install vim-plug if not already installed and call plug#begin
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'bling/vim-airline'
Plug 'powerline/fonts'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" TODO: fix FZF :Tags command so it finds the tags file at .git/tags
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'bitc/vim-bad-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yegappan/greplace'
Plug 'embear/vim-localvimrc'
if has('nvim') || v:version >= 704
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
endif

" TODO: learn these plugins
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" TODO: install & learn easymotion/sneak/etc.

" Python plugins
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'ivanov/vim-ipython', { 'for': 'python' }

" Other language-specific plugins
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rnoweb'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }

call plug#end()
