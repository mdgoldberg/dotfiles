local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(
  function()
    -- package manager
    use "wbthomason/packer.nvim"

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      "nvim-lua/lsp-status.nvim",
      "kosayoda/nvim-lightbulb",
      "onsails/lspkind-nvim",
      "folke/lsp-colors.nvim", -- sets default colors for diagnostics if not set in colorscheme
      'ray-x/lsp_signature.nvim',
      {'RishabhRD/nvim-lsputils', requires = 'RishabhRD/popfix' },
      {
          "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
          config = function()
              require("lsp_lines").setup()
          end,
      },

    }

    -- tree-sitter
    use {
      {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
      'nvim-treesitter/nvim-treesitter-refactor',
      "nvim-treesitter/nvim-treesitter-textobjects",
    }

    -- code navigation
    use {
        { "nvim-telescope/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"} },
        { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons', 'vijaymarupudi/nvim-fzf' } },
        { 'junegunn/fzf', run = './install --bin', },
    }

    -- autocomplete and snippets
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'

    -- formatting
    use "mhartington/formatter.nvim"

    -- ranger
    use {"francoiscabrol/ranger.vim", requires = {"rbgrouleff/bclose.vim"}}

    -- language-specific
    use {"chrisbra/csv.vim", ft = {"csv"} }
    use {"simrat39/rust-tools.nvim", ft = {"rust"}, config = function() require('rust-tools').setup() end}
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = {"markdown"}
    }

    -- general
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("lualine").setup {}
        end
    }
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
    use 'chipsenkbeil/distant.nvim'  -- remote

    use "christoomey/vim-tmux-navigator"
    use "airblade/vim-gitgutter"
    use "tpope/vim-unimpaired"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tommcdo/vim-exchange"
    use "tpope/vim-abolish"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "shumphrey/fugitive-gitlab.vim"
    use "bitc/vim-bad-whitespace"
    use "edkolev/tmuxline.vim"
    -- use 'easymotion/vim-easymotion'

    -- indent and function argument text objects
    use "michaeljsmith/vim-indent-object"
    use "PeterRincker/vim-argumentative"

    -- language plugins
    -- use 'sheerun/vim-polyglot'

    -- terraform
    use 'hashivim/vim-terraform'

  end
)
