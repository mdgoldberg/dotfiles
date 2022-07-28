local actions = require "telescope.actions"

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                -- ["<C-CR>"] = actions.send_selected_to_qflist + actions.select_default,
                ["<C-SPACE>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
                -- ["<C-CR>"] = actions.send_selected_to_qflist + actions.select_default,
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

-- git
vim.api.nvim_set_keymap("n", "]c", "<Plug>(GitGutterNextHunk)", {})
vim.api.nvim_set_keymap("n", "[c", "<Plug>(GitGutterPrevHunk)", {})

-- ranger
vim.g.ranger_map_keys = 0
vim.api.nvim_set_keymap("n", "-", ":Ranger<CR>", {})
vim.g.ranger_replace_netrw = 1

-- bclose configs (dependency of ranger.vim, but don't need mapping)
vim.g.bclose_no_plugin_maps = 1

-- easymotion configs
-- map  <leader>/ <Plug>(easymotion-sn)
-- omap <leader>/ <Plug>(easymotion-tn)
-- map  <leader>n <Plug>(easymotion-next)
-- map  <leader>N <Plug>(easymotion-prev)
-- map <leader>l <Plug>(easymotion-lineforward)
-- map <leader>j <Plug>(easymotion-j)
-- map <leader>k <Plug>(easymotion-k)
-- map <leader>h <Plug>(easymotion-linebackward)
