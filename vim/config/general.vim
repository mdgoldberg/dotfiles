" not using GUI vim
let did_install_default_menus = 1
let did_install_syntax_menu = 1

" vim > vi
set nocompatible

" syntax highlighting and auto-indentation
syntax enable
filetype indent on
filetype plugin on
set autoindent
set smartindent

" enable the mouse
set mouse=a

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2
augroup vim_resized
    autocmd!
    autocmd VimResized * wincmd =
augroup END

" line numbers
set number
highlight LineNr ctermfg=gray ctermbg=black

" wrap and linebreak
set wrap
set linebreak

" searching options
set incsearch
set showcmd
set ignorecase
set smartcase
set nohlsearch  " see keys.vim for mapping to clear highlighting

if has('nvim')
    " incremental feedback on substitute commands
    set inccommand=split
endif

" disable backups
set nobackup
set nowritebackup
set noswapfile

" autoreload
set autoread

" configure cursor
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
endif

" configs to use rg for :grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" quickfix configs
au FileType qf wincmd J
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

" disable annoying beep on errors
set noerrorbells
augroup error_bells
    autocmd!
    autocmd GUIEnter * set vb t_vb=
augroup END

" keep at least 5 lines on either side of cursor
set scrolloff=5

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" keep buffer open when tab is closed
set hidden

" open all folds by default
augroup folds
    au!
    au BufRead * normal zR
augroup END

set fileformat=unix
set encoding=utf-8

" default tab settings - expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" always show tab line to avoid annoying resize
set showtabline=2