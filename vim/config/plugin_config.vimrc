" set colorscheme
set background=dark
if has('nvim')
    set termguicolors
    " set Vim-specific sequences for RGB colors
    colorscheme solarized
else
    colorscheme slate
endif

" lightline configs
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \       'left': [
    \           [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly' ],
    \           [ 'filename', 'modified' ]
    \       ],
    \       'right': [
    \           [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \           [ 'lineinfo', 'percent' ],
    \           [ 'fileencoding', 'filetype' ],
    \       ],
    \ },
    \ 'component_function': {
    \       'gitbranch': 'fugitive#head'
    \ },
    \ 'component_expand': {
    \       'linter_warnings': 'lightline#ale#warnings',
    \       'linter_errors': 'lightline#ale#errors',
    \       'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \       'linter_warnings': 'warning',
    \       'linter_errors': 'error',
    \ },
\ }

" tmuxline configs
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
            \ 'left' : '',
            \ 'left_alt': '>',
            \ 'right' : '',
            \ 'right_alt' : '<',
            \ 'space' : ' '}

" recognize *.tex files as tex, not plaintex
let g:tex_flavor = "latex"

" Ale configs (lang-specific configs are in in ftplugin/*.vim)
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s% [code]%'

" Set Ultisnips configs
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" fzf config for hidden files
let $FZF_DEFAULT_COMMAND = "rg --hidden -g '!.git' -l ''"
let $FZF_DEFAULT_OPTS .= ' --no-height'

" localvimrc configs
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

" vinegar/netrw configs
let g:netrw_liststyle = 3

" easymotion configs
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" Tagbar configs
let g:tagbar_sort = 0

" gitgutter configs
let g:gitgutter_realtime = 0

" python versions
let g:python_host_prog = $HOME . '/.pyenv/versions/python2_venv/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/python3_venv/bin/python'

" iron.nvim configs
let g:iron_repl_open_cmd = 'botright vertical split'

" deoplete configs - last two map auto-complete to tab
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

" hook up ripgrep to ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif
