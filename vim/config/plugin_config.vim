" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" lightline configs
" set noshowmode
" let g:lightline = {
"     \ 'colorscheme': 'gruvbox',
"     \ 'active': {
"     \       'left': [
"     \           [ 'mode', 'paste' ],
"     \           [ 'gitbranch', 'readonly' ],
"     \           [ 'filename', 'modified', 'method' ],
"     \       ],
"     \       'right': [
"     \           [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
"     \           [ 'lineinfo', 'percent' ],
"     \           [ 'fileencoding', 'filetype' ],
"     \       ],
"     \ },
"     \ 'component_function': {
"     \       'gitbranch': 'fugitive#head',
"     \       'filename': 'LightlineFilename',
"     \       'method': 'NearestMethodOrFunction',
"     \ },
"     \ 'component_expand': {
"     \       'linter_errors': 'lightline#ale#errors',
"     \       'linter_warnings': 'lightline#ale#warnings',
"     \       'linter_ok': 'lightline#ale#ok',
"     \ },
"     \ 'component_type': {
"     \       'linter_errors': 'error',
"     \       'linter_warnings': 'warning',
"     \ },
" \ }

" function! LightlineFilename()
"     return fnamemodify(expand("%"), ":~:.")
" endfunction

" tmuxline configs
let g:tmuxline_powerline_separators = 1

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

let g:ale_linters['rust'] = ['analyzer']
let g:ale_fixers['rust'] = ['remove_trailing_lines', 'trim_whitespace', 'rustfmt']

let g:ale_linters['typescript'] = ['tslint']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']

augroup jsonc
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup end

" Avoid showing extra message when using completion
set shortmess+=c

" fzf config for hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --follow --line-number --no-heading --color=always --smart-case ".<q-args>, 1, <bang>0)
let $FZF_DEFAULT_COMMAND = "fd --follow --type file --hidden -E .git"
let $FZF_DEFAULT_OPTS .= ' --no-height'

" easymotion configs
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" ranger configs
let g:ranger_replace_netrw = 1

" bclose configs (dependency of ranger.vim, but don't need mapping)
let g:bclose_no_plugin_maps = 1

" gitgutter configs
set updatetime=200
let g:gitgutter_map_keys = 0

" python versions
let pyver = system('pyenv global | head -n 1 | tr -d "\n"')
let g:python3_host_prog = $HOME . '/.pyenv/versions/' . pyver . '/bin/python'

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_commentsring='//%s'
