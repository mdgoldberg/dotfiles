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
nnoremap <leader>w :tabclose<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <leader>e :FZF<CR>
nnoremap <expr> <leader>o TabIsEmpty() ? ":FZF<CR>" : ":tabnew<CR>:FZF<CR>"
nnoremap <leader>t :Tags<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :hsplit<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
noremap <leader>b :TagbarToggle<CR>

" TODO: read the maximum-awesome vimrc for key mappings
" TODO: add mappings for useful plugins I've added above
