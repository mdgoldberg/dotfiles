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

" set colorscheme
if has('nvim')
    set termguicolors
else
    let g:solarized_termcolors=256
endif
set background=dark
colorscheme solarized

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" line numbers
set number
highlight LineNr ctermfg=gray ctermbg=black

" wrap and linebreak
set wrap
set linebreak

" searching options
set incsearch
set nohlsearch
set showcmd
set ignorecase
set smartcase

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" keep at least 5 lines on either side of cursor
set scrolloff=5

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" close buffer when tab is closed
set nohidden

" open all folds by default
au BufRead * normal zR

" shortcut to close mini windows
nnoremap <leader>qq :cclose<CR>:pclose<CR>:lclose<CR>

" default tab settings - expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" always show tab line to avoid annoying resize
set showtabline=2