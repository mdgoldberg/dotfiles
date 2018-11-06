setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal nosmartindent
retab

" set up red vertical line at 101st column
setlocal textwidth=110
set colorcolumn=111

" configure ALE for typescript
let b:ale_fixers = ['prettier']
let b:ale_linters = ['tslint']
