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
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/argtextobj.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/matchit.zip'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" neovim-only plugins and their alternatives
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'hkupty/iron.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" indent and function argument text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'

" TODO: install & learn easymotion/sneak/etc.

" Python plugins
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

" Other language-specific plugins
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rnoweb'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install prettier',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

call plug#end()
