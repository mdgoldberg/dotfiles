" Dispatch configs
nnoremap <leader>dv :w<CR>:silent execute "Dispatch! open '%:r.pdf'"<CR>
let b:dispatch = 'R CMD Sweave "%" && latexmk -pdf "%:r.tex"'

" Unmap Vim-R-Plugin mappings
let g:vimrplugin_insert_mode_cmds = 0
