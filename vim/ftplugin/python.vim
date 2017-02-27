" indentation settings for PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set nosmartindent
retab

" UTF-8
set encoding=utf-8

" Make it pretty
let python_highlight_all=1

" virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" SimpylFold options
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import=0

" set up red vertical line at 80th column
set colorcolumn=80

" jedi-vim configs
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0

" set flake8 to be the checker for Syntastic
let g:syntastic_python_checkers = ['flake8']
