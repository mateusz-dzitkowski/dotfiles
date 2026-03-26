return {
  {
    'mason-org/mason.nvim',
    opts = {
      ensure_installed = {
        "lua_ls",
	"pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('pyright', {
        filetypes = { "python" },
        settings = {
          python = {
            venvPath = ".",
            venv = ".venv",
            pythonPath = ".venv/bin/python",
          },
        },
      })

      vim.lsp.enable('lua_ls')
      vim.lsp.enable('pyright')
    end
  },
}

