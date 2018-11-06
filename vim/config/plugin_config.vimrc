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

" ncm2 configs
augroup ncm2
    au!
    autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
set completeopt=menuone,noselect,noinsert

" LanguageClient-neovim configs
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.python = ['pyls']
let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
let g:LanguageClient_settingsPath = $HOME . '/.vim/settings.json'
let g:LanguageClient_diagnosticsList = "Disabled"  " let ALE linting populate loclist

" Ultisnips configs
let g:UltiSnipsRemoveSelectModeMappings = 0

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
set updatetime=200

" disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

" python versions
let g:python_host_prog = $HOME . '/.pyenv/shims/python2'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'

" iron.nvim configs
let g:iron_repl_open_cmd = 'botright vertical split'

" hook up ripgrep to ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
