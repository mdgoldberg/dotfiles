local lsp_status = require("lsp-status")
lsp_status.register_progress()

local nvim_lsp = require("lspconfig")
local lsp_format = require("lsp-format")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local telescope_builtin = require("telescope.builtin")

lsp_format.setup({})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- lsp_status integration
	lsp_status.on_attach(client)

	-- lsp-format.nvim integration
	lsp_format.on_attach(client)

	-- enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- mappings
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)

	vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)

	vim.keymap.set("n", "<leader>od", vim.diagnostic.setloclist, bufopts)

	vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, bufopts)
	vim.keymap.set("n", "gD", telescope_builtin.lsp_type_definitions, bufopts)
	vim.keymap.set("n", "gr", telescope_builtin.lsp_references, bufopts)
	vim.keymap.set("n", "<leader>t", telescope_builtin.lsp_dynamic_workspace_symbols, bufopts)

	-- vim.keymap.set('n', '<leader>na', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<leader>nd', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<leader>nl', function()
	--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver", "dockerls", "bashls", "terraformls", "yamlls", "graphql", "lua_ls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = cmp_nvim_lsp.default_capabilities(lsp_status.capabilities),
	})
end

-- special rust setup
local rt = require("rust-tools")
rt.setup({
	server = {
		capabilities = cmp_nvim_lsp.default_capabilities(lsp_status.capabilities),
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			-- Hover actions
			vim.keymap.set("n", "<leader>r<space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})
rt.inlay_hints.enable()

-- special Lua setup
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- special null-ls setup
local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
	code_actions.eslint_d,
	code_actions.gitsigns,
	completion.luasnip,
	diagnostics.commitlint,
	diagnostics.curlylint,
	diagnostics.eslint,
	diagnostics.ruff,
	diagnostics.todo_comments,
	formatting.black,
	-- formatting.isort,
	formatting.jq,
	formatting.prettier,
	formatting.prettierd,
	formatting.rustfmt,
	formatting.stylua,
	formatting.terraform_fmt,
	hover.dictionary,
	hover.printenv,
}

null_ls.setup({ sources = sources })

-- fidget.nvim
require("fidget").setup()

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", {noremap = true, silent = true})

-- fun pictogram symbols
require("lspkind").init({
	-- enables text annotations
	mode = "symbol_text",
	-- default symbol map
	-- can be either 'default' or 'codicons' for codicon preset (requires vscode-codicons font installed)
	preset = "default",
})
