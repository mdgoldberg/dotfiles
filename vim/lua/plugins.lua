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
      "nvim-lua/lsp_extensions.nvim",
      "kosayoda/nvim-lightbulb",
      "onsails/lspkind-nvim",
      {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"},
      "folke/lsp-colors.nvim" -- sets default colors for diagnostics if not set in colorscheme
      -- 'ray-x/lsp_signature.nvim',
    }

    -- tree-sitter
    use {
      {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
      "nvim-treesitter/nvim-treesitter-textobjects"
    }

    -- code navigation
    use {
        { "nvim-telescope/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"} },
        { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons', 'vijaymarupudi/nvim-fzf' } },
        { 'junegunn/fzf', run = './install --bin', },
    }

    -- autocomplete
    use "hrsh7th/nvim-compe"

    -- formatting
    use "mhartington/formatter.nvim"

    -- ranger
    use {"francoiscabrol/ranger.vim", requires = {"rbgrouleff/bclose.vim"}}

    -- language-specific
    use {"simrat39/rust-tools.nvim", ft = {"rust"}}

    -- general
    use "navarasu/onedark.nvim"
    use 'b3nj5m1n/kommentary'

    -- use 'dense-analysis/ale'
    -- use 'maximbaz/lightline-ale'
    -- use 'honza/vim-snippets'
    use "christoomey/vim-tmux-navigator"
    use "airblade/vim-gitgutter"
    use "Yggdroot/indentLine"
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
