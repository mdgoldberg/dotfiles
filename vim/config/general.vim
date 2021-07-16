" configs to use rg for :grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" quickfix configs
" au FileType qf wincmd J
" augroup quickfix
"     autocmd!
"     autocmd QuickFixCmdPost [^l]* cwindow
"     autocmd QuickFixCmdPost l*    lwindow
" augroup END

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
