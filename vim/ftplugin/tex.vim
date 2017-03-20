set iskeyword+=:

set wrap
set linebreak
set fo+=t
set tw=84

" tabs as spaces
set tabstop=4 shiftwidth=4 expandtab

" Unmap random Vim-R-Plugin stuff
let g:vimrplugin_insert_mode_cmds = 0

" prevents auto-conversion to symbols in latex/Rnw
let g:tex_conceal = ""

" map to view PDF
nnoremap <leader>v :w<CR>:Dispatch! open "%:r.pdf"<CR>
