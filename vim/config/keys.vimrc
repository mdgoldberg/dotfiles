" use ; instead of :
nnoremap ; :
vnoremap ; :

" use jk or kj to leave insert mode and return to normal mode
imap jk <ESC>
imap kj <ESC>
imap JK <ESC>
imap KJ <ESC>
imap Jk <ESC>
imap jK <ESC> imap Kj <ESC>
imap kJ <ESC>

" tmux-style zoom in on a vim window/split in a new tab (use wq/q to reset)
nnoremap <leader>z :tabnew % <CR>

" use ESC to leave insert mode in nvim terminal buffers
" and activate other ways I leave insert mode
if has('nvim')
    tnoremap <ESC> <C-\><C-n>
    tmap jk <ESC>
    tmap kj <ESC>
    tmap JK <ESC>
    tmap KJ <ESC>
    tmap Jk <ESC>
    tmap jK <ESC>
    tmap Kj <ESC>
    tmap kJ <ESC>
endif

" make movements visual lines instead of actual lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
vnoremap 0 g0
vnoremap ^ g^
vnoremap $ g$

" move through windows using CTRL+ h, j, k, l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" function to check whether there is an open file in the current tab
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction

" set leader key to comma
let mapleader = ","

" shortcuts for opening/closing/navigating windows/tabs
noremap <expr> <leader>op TabIsEmpty() ? ":FZF<CR>" : ":tabnew<CR>:FZF<CR>"
nnoremap <expr> <leader>w winnr('$') > 1 ? ":q<CR>" : ":tabclose<CR>"
nnoremap <leader>q :qall<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <leader>oq :copen<CR>
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>oc :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>ol :lopen<CR>
nnoremap <leader>cl :lclose<CR>
nnoremap <leader>cp :pclose<CR>

" shortcuts to other common commands
nnoremap <leader>e :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
noremap <leader>p :TagbarToggle<CR>
noremap <leader>l :ALELint<CR>
noremap <leader>f :ALEFix<CR>

" ack.vim mappings
nnoremap <expr> <Leader>a ":Ack! ''<LEFT>"
nnoremap <Leader>* :Ack<CR>
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>

" iron mappings
let g:iron_map_defaults=0
nmap <leader>x <Plug>(iron-send-motion)
vmap <leader>x <Plug>(iron-send-motion)
nmap <leader>X ggVG<Plug>(iron-send-motion)

" use tab to cycle through deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" netrw mappings
augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END
function! NetrwMappings()
    nnoremap <buffer> <leader>w <C-^>
    nnoremap <buffer> <leader>q <C-^>
endfunction

" TODO: read the maximum-awesome vimrc for key mappings
" TODO: add mappings for useful plugins I've added but don't use much
