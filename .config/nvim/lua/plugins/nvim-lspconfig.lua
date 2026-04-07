return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config("pyright", {
            filetypes = { "python" },
            settings = {
                python = {
                    venvPath = ".",
                    venv = ".venv",
                    pythonPath = ".venv/bin/python",
                },
            },
        })

        vim.lsp.config("gopls", {
            filetypes = { "go" },
        })

        vim.lsp.config("hls", {
            filetypes = { "haskell" },
        })

        vim.lsp.enable("lua_ls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("gopls")
        vim.lsp.enable("hls")
    end
}
