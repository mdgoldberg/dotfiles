" use ; instead of :
nnoremap ; :
vnoremap ; :

" use jk or kj to leave insert mode and return to normal mode
imap jk <ESC>
imap kj <ESC>
imap JK <ESC>
imap KJ <ESC>
imap Jk <ESC>
imap jK <ESC>
imap Kj <ESC>
imap kJ <ESC>

" zoom in on a vim window/split (use "<C-w> =" to reset)
nnoremap <C-w>z <C-w>_ <bar> <C-w>\|

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

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>n :tabnew<CR>
nnoremap <expr> <leader>w winnr('$') > 1 ? ":q<CR>" : ":tabclose<CR>"
nnoremap <leader>q :qall<CR>
nnoremap <leader>c :cclose<CR>:pclose<CR>:lclose<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <leader>e :FZF<CR>
nnoremap <expr> <leader>o TabIsEmpty() ? ":FZF<CR>" : ":tabnew<CR>:FZF<CR>"
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
noremap <leader>f :TagbarToggle<CR>

" fugitive mappings (TODO)
nnoremap <leader>gb :Gblame<CR>

" iron mappings
let g:iron_map_defaults=0
nnoremap <leader>r <Plug>(iron-send-motion)
vnoremap <leader>r <Plug>(iron-send-motion)

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
