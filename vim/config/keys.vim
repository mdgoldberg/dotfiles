" set leader key to comma
let mapleader = "\<space>"

" use ; instead of :
nnoremap ; :
vnoremap ; :

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <ESC>

" use ESC to leave insert mode in nvim terminal buffers
if has('nvim')
    tnoremap <ESC> <C-\><C-n>
endif

" make movements visual lines instead of actual lines
" nnoremap j gj
" nnoremap k gk
" nnoremap 0 g0
" nnoremap ^ g^
" nnoremap $ g$
" vnoremap 0 g0
" vnoremap ^ g^
" vnoremap $ g$

" use leader-c and leader-p to copy/paste to/from system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" shortcuts for opening/closing/navigating windows/tabs
" noremap <expr> <leader>oz TabIsEmpty() ? ":terminal<CR>i" : ":tabnew<CR>:terminal<CR>i"
nnoremap <expr> <leader>w winnr('$') > 1 ? ":q<CR>" : ":tabclose<CR>"
nnoremap <leader>q :qall<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <leader>oq :copen<CR>
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>ol :lopen<CR>
nnoremap <leader>cl :lclose<CR>
nnoremap <leader>cp :pclose<CR>

" shortcuts to other common commands
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
noremap <leader>z :terminal<CR>i

" code search commands
" noremap <expr> <leader>a ":Rg ''<LEFT>"
" nnoremap <expr> <leader>* ":Rg '<C-R><C-W>'"

" git
" nnoremap <leader>gs :Gstatus<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" easymotion configs
" map  <leader>/ <Plug>(easymotion-sn)
" omap <leader>/ <Plug>(easymotion-tn)
" map  <leader>n <Plug>(easymotion-next)
" map  <leader>N <Plug>(easymotion-prev)
" map <leader>l <Plug>(easymotion-lineforward)
" map <leader>j <Plug>(easymotion-j)
" map <leader>k <Plug>(easymotion-k)
" map <leader>h <Plug>(easymotion-linebackward)

" to open tag under word in vertical split
nnoremap <C-w><C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ranger.vim mapping
let g:ranger_map_keys = 0
nmap - :Ranger<CR>
