" set colorscheme
set background=dark
if has('nvim')
    set termguicolors
    colorscheme gruvbox
else
    colorscheme slate
endif

" lightline configs
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
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
    \       'gitbranch': 'fugitive#head',
    \       'filename': 'LightlineFilename',
    \ },
    \ 'component_expand': {
    \       'linter_errors': 'lightline#ale#errors',
    \       'linter_warnings': 'lightline#ale#warnings',
    \       'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \       'linter_errors': 'error',
    \       'linter_warnings': 'warning',
    \ },
\ }

function! LightlineFilename()
    return fnamemodify(expand("%"), ":~:.")
endfunction

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
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_echo_msg_format = '[%linter%] %s% [code]%'

" Ale language settings
let g:ale_linters = {}
let g:ale_fixers = {}

let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']

let g:ale_linters['python'] = ['flake8']
let g:ale_fixers['python'] = ['remove_trailing_lines', 'trim_whitespace', 'isort', 'black']

let g:ale_linters['typescript'] = ['tslint']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']

" coc.nvim configs
let g:coc_global_extensions = ['coc-python', 'coc-tsserver', 'coc-rust-analyzer', 'coc-snippets', 'coc-json', 'coc-docker', 'coc-yaml', 'coc-highlight']

inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-Tab>'

" fzf config for hidden files
let $FZF_DEFAULT_COMMAND = "rg --hidden -g '!.git' -l ''"
let $FZF_DEFAULT_OPTS .= ' --no-height'

" localvimrc configs
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

" easymotion configs
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" ranger configs
let g:ranger_replace_netrw = 1

" bclose configs (dependency of ranger.vim, but don't need mapping)
let g:bclose_no_plugin_maps = 1

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
let g:python3_host_prog = $HOME . '/.pyenv/versions/3.6.7/bin/python'

" iron.nvim configs
let g:iron_repl_open_cmd = 'botright vertical split'

" hook up ripgrep to ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_commentsring='//%s'
