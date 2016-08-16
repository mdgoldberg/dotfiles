" indentation settings for PEP8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
retab

" Flag unnecessary whitespace
match BadWhitespace /\s\+$/

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

" Dispatch command
autocmd filetype python let b:dispatch = 'python "%"'

" SimpylFold options
let g:SimpylFold_docstring_preview=1

" Jedi overrides
let g:jedi#popup_on_dot = 0
