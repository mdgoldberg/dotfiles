" recognize *.tex files as tex, not plaintex
let g:tex_flavor = "latex"

" Set Ultisnips configs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Supertab configs
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
            \ ["&completefunc:<c-p>", "&omnifunc:<c-x><c-o>"]

" Dispatch mappings
nnoremap <leader>c :w<CR>:Make!<CR>

" localvimrc configs
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1