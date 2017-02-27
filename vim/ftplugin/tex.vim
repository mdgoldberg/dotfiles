set iskeyword+=:

set wrap
set linebreak

" Vim-Latex configs
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'
let g:Tex_CompileRule_pdf='latexmk -pdf -interaction=nonstopmode "$*"'

" Unmap random Vim-R-Plugin stuff
let g:vimrplugin_insert_mode_cmds = 0
"
" prevents auto-conversion to symbols in latex/Rnw
let g:tex_conceal = ""
