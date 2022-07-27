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

-- configs to use rg for :grep
if vim.fn.executable('rg') then
    vim.api.nvim_set_option("grepprg", "rg --vimgrep --no-heading")
    vim.api.nvim_set_option("grepformat", "%f:%l:%c:%m,%f:%l:%m")
end
