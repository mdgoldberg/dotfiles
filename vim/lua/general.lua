vim.o.updatetime = 500
vim.wo.signcolumn = 'yes'

vim.o.mouse = 'a'

-- keep at least 3 lines on either side of cursor in window
vim.o.scrolloff = 3

vim.o.smartindent = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false

-- checks if terminal has 24-bit color support
if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
    vim.cmd([[hi LineNr ctermbg=NONE guibg=NONE]])
end

-- resize windows when tmux pane size changes
vim.cmd [[autocmd VimResized * wincmd =]]

-- incremental feedback on substitute commands
vim.o.inccommand = 'split'

-- disable backups
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- keep buffers open when tab is closed
vim.o.hidden = true

-- default tab settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- always show tabs at top
vim.o.showtabline = 2

vim.g.python3_host_prog = os.getenv("HOME") .. '/.asdf/shims/python3'

-- configs to use rg for :grep
if vim.fn.executable('rg') then
    vim.o.grepprg = "rg --vimgrep --no-heading"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
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
vim.keymap.set("n", "gx", ":call OpenURLUnderCursor()<CR>", {noremap = true})

vim.cmd [[
" fzf config for hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --follow --line-number --no-heading --color=always --smart-case ".<q-args>, 1, <bang>0)
let $FZF_DEFAULT_COMMAND = "fd --follow --type file --hidden -E .git"
let $FZF_DEFAULT_OPTS .= ' --no-height'
]]

vim.g.strip_whitespace_on_save = 1

-- colorscheme
vim.cmd([[colorscheme tokyonight]])
require("tokyonight").setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
