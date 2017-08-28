" use ; instead of :
nnoremap ; :

" use jk or kj to leave insert mode and return to normal mode
imap jk <ESC>
imap kj <ESC>
imap JK <ESC>
imap KJ <ESC>
imap Jk <ESC>
imap jK <ESC>
imap Kj <ESC>
imap kJ <ESC>

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

" function to check whether there is an open file in the current tab
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction

" shortcuts to common commands re: tabs, windows, and navigation
let mapleader = ","
nnoremap <leader>n :tabnew<CR>
nnoremap <expr> <leader>w winnr('$') > 1 ? ":q<CR>" : ":tabclose<CR>"
nnoremap <leader>q :q<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <leader>e :FZF<CR>
nnoremap <expr> <leader>o TabIsEmpty() ? ":FZF<CR>" : ":tabnew<CR>:FZF<CR>"
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
noremap <leader>f :TagbarToggle<CR>
nnoremap <leader>pl :NERDTreeFocus<CR>

" TODO: read the maximum-awesome vimrc for key mappings
" TODO: add mappings for useful plugins I've added above
