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
let g:lightline = { 'colorscheme': 'solarized' }

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

" Ale configs + integration with lightline (lang-specific configs are in in ftplugin/*.vim)
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %s% [code]%'
let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }
let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

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

" Tagbar configs
let g:tagbar_sort = 0

" gitgutter configs
let g:gitgutter_realtime = 0

" python versions
let g:python_host_prog = $HOME . '/.pyenv/versions/python2_venv/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/python3_venv/bin/python'

" iron.nvim configs
let g:iron_repl_open_cmd = 'botright vertical split'

" deoplete configs
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" hook up ripgrep to ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" fugitive-gitlab config
let g:fugitive_gitlab_domains = ['http://git.2nd.io']
