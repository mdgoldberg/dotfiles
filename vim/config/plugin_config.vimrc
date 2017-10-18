" set colorscheme
set background=dark
if has('nvim')
    set termguicolors
    " set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    colorscheme solarized
else
    colorscheme slate
endif

" recognize *.tex files as tex, not plaintex
let g:tex_flavor = "latex"

" Set Ultisnips configs
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" fzf config for hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" localvimrc configs
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

" vinegar/netrw configs
let g:netrw_liststyle = 3

" Tagbar configs
let g:tagbar_sort = 0

" gitgutter configs
let g:gitgutter_realtime = 0

" python versions
let g:python_host_prog = '/Users/mgoldberg/.pyenv/versions/python2_venv/bin/python'
let g:python3_host_prog = '/Users/mgoldberg/.pyenv/versions/python3_venv/bin/python'

" deoplete configs
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" use tab to trigger deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" disable jedi-vim's completion, just use mappings
if has('nvim')
    let g:jedi#completions_enabled = 0
endif
