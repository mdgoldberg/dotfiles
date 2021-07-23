require("telescope").setup({})

-- function to check whether there is an open file in the current tab
vim.cmd [[
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
]]

vim.api.nvim_set_keymap("n", "<leader>e", "<CMD>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>", {noremap = true})
vim.api.nvim_set_keymap(
    "n",
    "<leader>op",
    'TabIsEmpty() ? ":Telescope find_files<CR>" : ":tabnew<CR>:Telescope find_files<CR>"',
    {expr = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>a", ":grep ''<LEFT>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>l", "<CMD>lua require('fzf-lua').live_grep()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>*", ":grep <cword><CR> :copen<CR>", {noremap = true})
vim.api.nvim_set_keymap("v", "<leader>*", "<CMD>lua require('fzf-lua').grep_visual()<CR>", {noremap = true})
