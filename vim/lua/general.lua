vim.api.nvim_set_option("signcolumn", "yes")

vim.api.nvim_set_option("mouse", "a")

-- keep at least 3 lines on either side of cursor in window
vim.api.nvim_set_option("scrolloff", 3)

vim.api.nvim_set_option("smartindent", true)

vim.api.nvim_win_set_option(0, 'number', true)

vim.api.nvim_set_option("ignorecase", true)
vim.api.nvim_set_option("smartcase", true)

vim.api.nvim_set_option("hlsearch", false)

-- colorscheme
vim.api.nvim_set_var("nvcode_termcolors", 256)
vim.api.nvim_set_option("termguicolors", true)
vim.cmd([[colorscheme onedark]])

-- checks if terminal has 24-bit color support
if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
    vim.cmd([[hi LineNr ctermbg=NONE guibg=NONE]])
end

-- resize windows when tmux pane size changes
vim.cmd [[autocmd VimResized * wincmd =]]

-- incremental feedback on substitute commands
vim.api.nvim_set_option("inccommand", "split")

-- disable backups
vim.api.nvim_set_option("backup", false)
vim.api.nvim_set_option("writebackup", false)
vim.api.nvim_set_option("swapfile", false)

-- keep buffers open when tab is closed
vim.api.nvim_set_option("hidden", true)

-- keep buffers open when tab is closed
vim.api.nvim_set_option("hidden", true)

-- default tab settings
vim.api.nvim_set_option("shiftwidth", 0) -- falls back to tabstop as default
vim.api.nvim_set_option("tabstop", 4)
vim.api.nvim_set_option("expandtab", true)

-- always show tabs at top
vim.api.nvim_set_option("showtabline", 2)

vim.g.python3_host_prog = os.getenv("HOME") .. '/.asdf/shims/python3'

-- configs to use rg for :grep
if vim.fn.executable('rg') then
    vim.api.nvim_set_option("grepprg", "rg --vimgrep --no-heading")
    vim.api.nvim_set_option("grepformat", "%f:%l:%c:%m,%f:%l:%m")
end

-- avoid showing extra message when using completion
vim.opt.shortmess:append('c')

-- terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_commentsring = '//%s'

-- fix for gx in netrw (used by :GBrowse)
-- from: https://github.com/vim/vim/issues/4738#issuecomment-798790444
vim.cmd [[
function! OpenURLUnderCursor()
	let s:uri = expand('<cWORD>')
	let s:uri = matchstr(s:uri, "[a-z]*:\/\/[^ >,;)'\"]*")
	let s:uri = substitute(s:uri, '#', '\\#', '')
	" let s:uri = substitute(s:uri, '?', '\\?', '')
	" let s:uri = shellescape(s:uri, 1)
	if s:uri != ''
		silent exec "!xdg-open '".s:uri."' > /dev/null"
		:redraw!
	endif
endfunction
]]
vim.api.nvim_set_keymap("n", "gx", ":call OpenURLUnderCursor()<CR>", {noremap = true})

vim.cmd [[
" fzf config for hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --follow --line-number --no-heading --color=always --smart-case ".<q-args>, 1, <bang>0)
let $FZF_DEFAULT_COMMAND = "fd --follow --type file --hidden -E .git"
let $FZF_DEFAULT_OPTS .= ' --no-height'
]]

-- easymotion configs
-- let g:EasyMotion_startofline = 0
-- let g:EasyMotion_smartcase = 1
-- let g:EasyMotion_use_smartsign_us = 1

-- disable annoying beep on errors
-- set noerrorbells
-- augroup error_bells
--     autocmd!
--     autocmd GUIEnter * set vb t_vb=
-- augroup END
--
-- better tab completion on commands
-- set wildmode=list:longest
--
-- open all folds by default
-- augroup folds
--     au!
--     au BufRead * normal zR
-- augroup END
