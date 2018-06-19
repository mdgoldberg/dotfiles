" indentation settings for PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set autoindent
set fileformat=unix
set nosmartindent
retab

" UTF-8
set encoding=utf-8

" Make it pretty
let python_highlight_all=1

" configure ALE for python
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'isort', 'yapf']
let b:ale_linters = ['flake8', 'pylint']

" set up red vertical line at 101st column
set colorcolumn=101
