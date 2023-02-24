-- set leader key to space
vim.g.mapleader = " "

-- use ; instead of :
vim.keymap.set("n", ";", ":", {noremap = true})
vim.keymap.set("v", ";", ":", {noremap = true})

-- use leader-c and leader-p to copy/paste to/from system clipboard
vim.keymap.set("n", "<leader>y", '"+y', {noremap = true})
vim.keymap.set("n", "<leader>p", '"+p', {noremap = true})
vim.keymap.set("v", "<leader>y", '"+y', {noremap = true})
vim.keymap.set("v", "<leader>p", '"+p', {noremap = true})

-- shortcuts for opening/closing/navigating windows/tabs
vim.keymap.set("n", "<leader>w", "winnr('$') > 1 ? ':q<CR>' : ':tabclose<CR>'", {expr = true, noremap = true})
vim.keymap.set("n", "<leader>w", "winnr('$') > 1 ? ':q<CR>' : ':tabclose<CR>'", {expr = true, noremap = true})
vim.keymap.set("n", "<leader>q", ":qall<CR>", {noremap = true})
vim.keymap.set("n", "<tab>", ":tabnext<CR>", {noremap = true})
vim.keymap.set("n", "<S-tab>", ":tabprevious<CR>", {noremap = true})
vim.keymap.set("n", "<leader>oq", ":copen<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cq", ":cclose<CR>", {noremap = true})
vim.keymap.set("n", "<leader>ol", ":lopen<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cl", ":lclose<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cp", ":pclose<CR>", {noremap = true})

-- shortcuts to other common commands
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", {noremap = true})
vim.keymap.set("n", "<leader>s", ":split<CR>", {noremap = true})
vim.keymap.set("n", "<leader>z", ":terminal<CR>i", {noremap = true})

-- use ESC to leave insert mode in nvim terminal buffers
vim.keymap.set("t", "<esc>", ":<C-\\><C-n>", {noremap = true})

-- make CTRL-C trigger InsertLeave by mapping directly to <ESC>
vim.keymap.set("i", "<C-c>", "<ESC>", {noremap = true})
