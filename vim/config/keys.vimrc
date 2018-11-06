" use ; instead of :
nnoremap ; :
vnoremap ; :

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <ESC>

" use jk or kj to leave insert mode and return to normal mode
imap jk <ESC>
imap kj <ESC>
imap JK <ESC>
imap KJ <ESC>
imap Jk <ESC>
imap jK <ESC> imap Kj <ESC>
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
let mapleader = "\<space>"

" shortcuts for opening/closing/navigating windows/tabs
noremap <expr> <leader>op TabIsEmpty() ? ":FZF<CR>" : ":tabnew<CR>:FZF<CR>"
noremap <expr> <leader>oz TabIsEmpty() ? ":terminal<CR>i" : ":tabnew<CR>:terminal<CR>i"
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
noremap <leader>f :ALEFix<CR>
noremap <leader>z :terminal<CR>i

" easymotion configs
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" to open tag under word in vertical split
nnoremap <C-w><C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ack.vim mappings
nnoremap <expr> <leader>a ":Ack! ''<LEFT>"
nnoremap <expr> <leader>* ":Ack! '\\b<cword>\\b'<CR>"
vnoremap <leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>

" autocomplete mappings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

" ultisnips configs
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

" LanguageClient-neovim mappings
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>u :call LanguageClient#textDocument_references()<CR>

" iron mappings
let g:iron_map_defaults=0
nmap <leader>x <Plug>(iron-send-motion)
vmap <leader>x <Plug>(iron-send-motion)
nmap <leader>X ggVG<Plug>(iron-send-motion)

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
