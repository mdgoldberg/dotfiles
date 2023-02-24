local actions = require "telescope.actions"

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                -- ["<CR>"] = actions.send_selected_to_qflist + actions.select_default,
                ["<C-SPACE>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
                -- ["<CR>"] = actions.send_selected_to_qflist + actions.select_default,
                ["<C-SPACE>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
        },

    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
    },
})
require('telescope').load_extension('fzf')

require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

-- function to check whether there is an open file in the current tab
vim.cmd [[
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
]]

local telescope_builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, {noremap = true})
vim.keymap.set("n", "<leader>e", telescope_builtin.find_files, {noremap = true})
vim.keymap.set(
    "n",
    "<leader>op",
    'TabIsEmpty() ? ":lua require(\'telescope.builtin\').find_files()<CR>" : ":tabnew<CR>:lua require(\'telescope.builtin\').find_files()<CR>"',
    {expr = true, noremap = true}
)

vim.keymap.set("n", "<leader>g", ":grep ''<LEFT>", {noremap = true})
vim.keymap.set("n", "<leader>*", ":grep <cword><CR> :copen<CR>", {noremap = true})
vim.keymap.set("v", "<leader>*", require('fzf-lua').grep_visual, {noremap = true})
vim.keymap.set("n", "<leader>l", require('fzf-lua').live_grep, {noremap = true})

-- git
vim.keymap.set("n", "]c", "<Plug>(GitGutterNextHunk)", {})
vim.keymap.set("n", "[c", "<Plug>(GitGutterPrevHunk)", {})

-- ranger
vim.g.ranger_map_keys = 0
vim.keymap.set("n", "-", ":Ranger<CR>", {})
vim.g.ranger_replace_netrw = 1

-- bclose configs (dependency of ranger.vim, but don't need mapping)
vim.g.bclose_no_plugin_maps = 1
