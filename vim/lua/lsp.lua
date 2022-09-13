local lsp_status = require("lsp-status")
lsp_status.register_progress()

local nvim_lsp = require("lspconfig")
local navic = require("nvim-navic")
local lsp_signature = require("lsp_signature")
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local telescope_builtin = require('telescope.builtin')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- lsp_status integration
  lsp_status.on_attach(client, bufnr)

  -- nvim-navic integration
  navic.attach(client, bufnr)

  -- lsp_signature integration
  lsp_signature.on_attach({}, bufnr)

  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)

  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>l", vim.lsp.buf.formatting, bufopts)

  vim.keymap.set("n", "<leader>od", vim.lsp.diagnostic.set_loclist, bufopts)

  vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, bufopts)
  vim.keymap.set("n", "gD", telescope_builtin.lsp_type_definitions, bufopts)
  vim.keymap.set("n", "gr", telescope_builtin.lsp_references, bufopts)
  vim.keymap.set("n", "<leader>t", telescope_builtin.lsp_dynamic_workspace_symbols, bufopts)

  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wl', function()
  --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<leader>f',function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"pyright", "tsserver", "dockerls", "bashls", "terraformls", "yamlls", "graphql"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.update_capabilities(lsp_status.capabilities),
  }
end

-- special rust setup
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
rt.inlay_hints.enable()

-- lsp_lines: disable virtual_text since it's redundant due to lsp_lines
vim.diagnostic.config({ virtual_text = false, virtual_lines = true, update_in_insert = true })

-- nvim-lsputils
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

-- nvim-lightbulb
require('nvim-lightbulb').setup({autocmd = {enabled = true}})

-- fun pictogram symbols
require("lspkind").init(
  {
    -- enables text annotations
    mode = 'symbol_text',
    -- default symbol map
    -- can be either 'default' or 'codicons' for codicon preset (requires vscode-codicons font installed)
    preset = "default"
  }
)
