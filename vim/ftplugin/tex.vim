set sw=2
set iskeyword+=:

" Latex-Box Tweaks
imap <buffer> [[ \begin{
imap <buffer> ]] <Plug>LatexCloseCurEnv
vmap <buffer> ,, <Plug>LatexWrapSelection
vmap <buffer> .. <Plug>LatexEnvWrapSelection

" Sweave compilation
autocmd BufWritePost *.Rnw silent exec "!R CMD Sweave %" | redraw!

set fo+=t
set tw=79
