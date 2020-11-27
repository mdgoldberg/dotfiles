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
    \           [ 'filename', 'modified', 'method' ],
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
    \       'method': 'NearestMethodOrFunction',
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

augroup jsonc
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup end

" nvim-lsp
lua <<EOF

local nvim_lsp = require'nvim_lsp'

nvim_lsp.jedi_language_server.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.terraformls.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.yamlls.setup{}

EOF

augroup formatting
    autocmd!
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
augroup end


" completion-nvim
let g:completion_enable_snippet = 'vim-vsnip'
augroup completion
    autocmd!
    autocmd BufEnter * lua require'completion'.on_attach()
augroup end

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


" diagnostic-nvim
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)
EOF
set signcolumn=yes

augroup diagnostics
    autocmd!
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
augroup end


" lsp extensions
augroup lsp_extensions
    autocmd!
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = ' ', highlight = "Comment" }
augroup end


" " coc.nvim configs
" let g:coc_global_extensions = ['coc-python', 'coc-tsserver', 'coc-rust-analyzer', 'coc-snippets', 'coc-json', 'coc-docker', 'coc-yaml', 'coc-highlight']

" fzf config for hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, 1, <bang>0)
let $FZF_DEFAULT_COMMAND = "fd --type file --hidden -E .git"
let $FZF_DEFAULT_OPTS .= ' --no-height'

" context.vim configs
let g:context_nvim_no_redraw = 0

" vista configs
let g:vista_default_executive = "nvim_lsp"
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

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
