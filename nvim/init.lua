-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.keymap.set({ "n", "v" }, ";", ":")
  vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true })
  vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true })
else
  require("config.lazy")
end
