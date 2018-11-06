" indentation settings for PEP8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal nosmartindent
retab

" Make it pretty
let python_highlight_all=1

" set up red vertical line at 101st column
setlocal textwidth=100
set colorcolumn=101

" configure ALE for python
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'isort', 'yapf']
let b:ale_linters = ['flake8']
