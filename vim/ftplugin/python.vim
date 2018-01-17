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

" set up red vertical line at 101st column
set colorcolumn=101

" virtualenv support
" if has('python')
" 	py << EOF
" 	import os.path
" 	import sys
" 	import vim
" 	if 'VIRTUAL_ENV' in os.environ:
" 		project_base_dir = os.environ['VIRTUAL_ENV']
" 		sys.path.insert(0, project_base_dir)
" 		activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
" 		execfile(activate_this, dict(__file__=activate_this))
" 	EOF
" endif

" disable jedi-vim's completion, just use mappings
" if has('nvim')
"     let g:jedi#completions_enabled = 0
" endif
