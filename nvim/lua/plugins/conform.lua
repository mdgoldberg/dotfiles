return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      -- Add sqlfluff to your formatters table
      -- and specify the arguments
      sqlfluff = {
        args = { "format", "--dialect", "postgres", "-" },
      },
      -- Keep your existing formatter
      pyproject_fmt = {
        command = "pyproject-fmt",
      },
    },
    formatters_by_ft = {
      toml = { "pyproject-fmt" },
      -- Add a new entry for SQL files
      sql = { "sqlfluff" },
      -- Add a new entry for `psql` files
      psql = { "sqlfluff" },
    },
  },
}
