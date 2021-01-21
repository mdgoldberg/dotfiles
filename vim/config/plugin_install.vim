" Vim-Plug Plugin Manager
" install vim-plug if not already installed and call plug#begin
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'rafi/awesome-vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/matchit.zip'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'easymotion/vim-easymotion'

" neovim-only plugins
if has('nvim')
    " LSP, autocomplete, etc.
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tjdevries/lsp_extensions.nvim'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'ojroques/nvim-lspfuzzy'
endif

" indent and function argument text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'PeterRincker/vim-argumentative'

" language plugins
Plug 'sheerun/vim-polyglot'

" javascript / typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install prettier',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rnoweb'] }

" terraform
Plug 'hashivim/vim-terraform'

call plug#end()
