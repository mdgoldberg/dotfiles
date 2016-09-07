" Dispatch configs
let b:dispatch = 'pandoc "%" -r markdown+raw_tex+latex_macros -o "%:r.pdf" -V geometry:margin=0.5in'
nnoremap <leader>dv :w<CR>:silent execute "Dispatch! open '%:r.pdf'"<CR>
