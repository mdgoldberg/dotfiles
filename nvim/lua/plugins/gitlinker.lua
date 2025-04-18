return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        callbacks = {
          ["git.2nd.io"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
      })
    end,
  },
}
