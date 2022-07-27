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

" fix for gx in netrw (used by :GBrowse)
" from: https://github.com/vim/vim/issues/4738#issuecomment-798790444
function! OpenURLUnderCursor()
	let s:uri = expand('<cWORD>')
	let s:uri = matchstr(s:uri, "[a-z]*:\/\/[^ >,;)'\"]*")
	let s:uri = substitute(s:uri, '#', '\\#', '')
	" let s:uri = substitute(s:uri, '?', '\\?', '')
	" let s:uri = shellescape(s:uri, 1)
	if s:uri != ''
		silent exec "!xdg-open '".s:uri."' > /dev/null"
		:redraw!
	endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>

" disable annoying beep on errors
" set noerrorbells
" augroup error_bells
"     autocmd!
"     autocmd GUIEnter * set vb t_vb=
" augroup END

" better tab completion on commands
" set wildmode=list:longest

" open all folds by default
" augroup folds
"     au!
"     au BufRead * normal zR
" augroup END
