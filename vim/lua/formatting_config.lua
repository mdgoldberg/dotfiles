require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      typescript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      json = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      html = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      yaml = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      python = {
        function()
          return {
            exe = "black",
            args = {"-"},
            stdin = true
          }
        end
      },
      rust = {
        function()
          return {
            exe = "rustfmt",
            args = {"--edition=2018", "--emit=stdout"},
            stdin = true
          }
        end
      },
      -- clang-format
      cpp = {
        function()
          return {
            exe = "clang-format",
            args = {},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      }
      -- luafmt
      -- lua = {
      --   function()
      --     return {
      --       exe = "luafmt",
      --       args = {"--indent-count", 2, "--stdin"},
      --       stdin = true
      --     }
      --   end
      -- },
    }
  }
)

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", {noremap = true, silent = true})

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.rs,*.cpp,*.py,*.yaml,*.json,*.html FormatWrite
augroup END
]],
  true
)
