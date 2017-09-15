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
Plug 'powerline/fonts'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" TODO: fix FZF :Tags command so it finds the tags file at .git/tags
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/argtextobj.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bitc/vim-bad-whitespace'
Plug 'embear/vim-localvimrc'
Plug 'bling/vim-airline'
Plug 'yegappan/greplace'
Plug 'vim-scripts/matchit.zip'
if has('nvim') || v:version >= 704
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
endif

" indent and function argument text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'

" TODO: learn these plugins
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
" TODO: install & learn easymotion/sneak/etc.

" Python plugins
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

" Other language-specific plugins
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rnoweb'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }

call plug#end()
