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
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
vnoremap 0 g0
vnoremap ^ g^
vnoremap $ g$

" use leader-c and leader-p to copy/paste to/from system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" function to check whether there is an open file in the current tab
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction

" shortcuts for opening/closing/navigating windows/tabs
noremap <expr> <leader>op TabIsEmpty() ? ":Files<CR>" : ":tabnew<CR>:Files<CR>"
noremap <expr> <leader>oz TabIsEmpty() ? ":terminal<CR>i" : ":tabnew<CR>:terminal<CR>i"
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
nnoremap <leader>e :Files<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
noremap <leader>tl :Vista<CR>
noremap <leader>tf :Vista finder<CR>
nnoremap <leader>b :Buffers<CR>
noremap <leader>f :ALEFix<CR>
noremap <leader>z :terminal<CR>i

" code search commands
noremap <expr> <leader>a ":Rg ''<LEFT>"
nnoremap <expr> <leader>* ":Rg '<C-R><C-W>'"

" git
nnoremap <leader>gs :Gstatus<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" easymotion configs
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" nvim-lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>

" to open tag under word in vertical split
nnoremap <C-w><C-[> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" trigger completion with C-space or tab
imap <silent> <c-space> <Plug>(completion_trigger)
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" if I switch formatting from ale to nvim-lsp
nmap <leader>g  <cmd>lua vim.lsp.buf.formatting()<CR>

" ranger.vim mapping
let g:ranger_map_keys = 0
nmap - :Ranger<CR>

" TODO: read the maximum-awesome vimrc for key mappings
" TODO: add mappings for useful plugins I've added but don't use much
