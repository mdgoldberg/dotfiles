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
noremap <leader>cbc "+y
noremap <leader>cbp "+p

" function to check whether there is an open file in the current tab
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction

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

" coc.nvim mappings
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>r <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" if I switch formatting from ale to coc.nvim
" vmap <leader>g  <Plug>(coc-format-selected)
" nmap <leader>g  <Plug>(coc-format)

augroup coc
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" iron mappings
let g:iron_map_defaults=0
nmap <leader>x <Plug>(iron-send-motion)
vmap <leader>x <Plug>(iron-send-motion)
nmap <leader>X ggVG<Plug>(iron-send-motion)

" ranger.vim mapping
let g:ranger_map_keys = 0
nmap - :Ranger<CR>

" TODO: read the maximum-awesome vimrc for key mappings
" TODO: add mappings for useful plugins I've added but don't use much
