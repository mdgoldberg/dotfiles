-- set leader key to space
vim.g.mapleader = " "

-- use ; instead of :
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("v", ";", ":", {noremap = true})

-- use leader-c and leader-p to copy/paste to/from system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', {noremap = true})

-- shortcuts for opening/closing/navigating windows/tabs
vim.api.nvim_set_keymap("n", "<leader>w", "winnr('$') > 1 ? ':q<CR>' : ':tabclose<CR>'", {expr = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>w", "winnr('$') > 1 ? ':q<CR>' : ':tabclose<CR>'", {expr = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>q", ":qall<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<tab>", ":tabnext<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-tab>", ":tabprevious<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>oq", ":copen<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>cq", ":cclose<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ol", ":lopen<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>cl", ":lclose<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>cp", ":pclose<CR>", {noremap = true})

-- shortcuts to other common commands
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>s", ":split<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>z", ":terminal<CR>i", {noremap = true})

-- use ESC to leave insert mode in nvim terminal buffers
vim.api.nvim_set_keymap("t", "<esc>", ":<C-\\><C-n>", {noremap = true})

-- make CTRL-C trigger InsertLeave by mapping directly to <ESC>
vim.api.nvim_set_keymap("i", "<C-c>", "<ESC>", {noremap = true})
