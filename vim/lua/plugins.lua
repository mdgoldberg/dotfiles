local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(
  function(use)
    -- package manager
    use "wbthomason/packer.nvim"

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      {
          'kosayoda/nvim-lightbulb',
          requires = 'antoinemadec/FixCursorHold.nvim',
      },
      "jose-elias-alvarez/null-ls.nvim",
      "j-hui/fidget.nvim", -- LSP progess bar (e.g. seeing rust-analyzer progress)
      "nvim-lua/lsp-status.nvim", -- utilities for custom status line components (TODO: set it up)
      "onsails/lspkind-nvim", --  adds vscode-like pictograms
      'ray-x/lsp_signature.nvim', -- LSP signature autocomplete (TODO: DO KEYMAPS)
      "folke/lsp-colors.nvim", -- sets default colors for diagnostics if not set in colorscheme
      "SmiteshP/nvim-navic",  -- show current code context in statusline/winbar
    }

    -- tree-sitter
    use {
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
}

    -- code navigation
    use {
        { 'junegunn/fzf', run = './install --bin', },
        { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons', 'vijaymarupudi/nvim-fzf' } },
        { "nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"} },
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }

    -- autocomplete and snippets
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'lukas-reineke/cmp-rg'
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'

    -- ranger
    use {"francoiscabrol/ranger.vim", requires = {"rbgrouleff/bclose.vim"}}

    -- language-specific
    use {"chrisbra/csv.vim", ft = {"csv"} }
    use { "simrat39/rust-tools.nvim" }
    use {
        "iamcco/markdown-preview.nvim",
        ft = {"markdown"},
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use 'hashivim/vim-terraform'

    -- git
    use "lewis6991/gitsigns.nvim"
    use {'akinsho/git-conflict.nvim', tag = "*", config = function() require('git-conflict').setup() end}
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "shumphrey/fugitive-gitlab.vim"

    -- text objects
    use "michaeljsmith/vim-indent-object"
    use "PeterRincker/vim-argumentative"

    -- appearance and statusline
    use 'folke/tokyonight.nvim'
    use {"luukvbaal/stabilize.nvim", config = function() require("stabilize").setup() end}  -- stabilize window/cursor when quickfix opens
    use 'psliwka/vim-smoothie'  -- smooth scrolling
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use "edkolev/tmuxline.vim"

    -- general
    use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
    use {"folke/which-key.nvim", config = function() require("which-key").setup() end}   -- remembering key bindings
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-unimpaired"
    use {"kylechui/nvim-surround", config = function() require("nvim-surround").setup() end}
    use "tpope/vim-repeat"
    use "tpope/vim-sleuth" -- Detect tabstop and shiftwidth automatically
    use "tommcdo/vim-exchange"

    -- new
    use {'simrat39/symbols-outline.nvim', config = function() require("symbols-outline").setup() end}
    use {'stevearc/dressing.nvim', config = function() require('dressing').setup() end}
    use 'chipsenkbeil/distant.nvim'  -- remote
    -- keybindings: C-space, C-n
    use {
        'dense-analysis/neural',
        config = function()
            require('neural').setup({
                open_ai = {
                    api_key = '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'
                }
            })
            -- vim.cmd [[autocmd User NeuralWritePost FormatWrite]]
        end,
        requires = {
            'MunifTanjim/nui.nvim',
            'ElPiloto/significant.nvim'
        }
    }


  end
)
