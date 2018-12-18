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
Plug 'rafi/awesome-vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
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

" neovim-only plugins and their alternatives
if has('nvim')
    " autocomplete
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2'
    Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh',
      \ }

    " NCM2 Sources
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-ultisnips'

    " repl within neovim
    Plug 'hkupty/iron.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" indent and function argument text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'PeterRincker/vim-argumentative'

" language plugins
Plug 'sheerun/vim-polyglot'

" python
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

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
