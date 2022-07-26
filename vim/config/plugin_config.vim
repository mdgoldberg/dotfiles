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
set updatetime=100
let g:gitgutter_map_keys = 0

" python versions
let g:python3_host_prog = $HOME . '/.asdf/shims/python3'

" terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_commentsring='//%s'
