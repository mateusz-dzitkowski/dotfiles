return {
    {
        'mason-org/mason.nvim',
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "gopls",
                "hls",
            },
        },
    },
    {
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

            vim.lsp.config("gopls", {
                filetypes = { "go" },
            })

            vim.lsp.config("hls", {
                filetypes = { "haskell" },
            })

            vim.lsp.enable('lua_ls')
            vim.lsp.enable('pyright')
            vim.lsp.enable("gopls")
            vim.lsp.enable("hls")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source
            "hrsh7th/cmp-buffer",       -- buffer completions
            "hrsh7th/cmp-path",         -- filesystem paths
            "saadparwaiz1/cmp_luasnip", -- snippets
            "L3MON4D3/LuaSnip",         -- snippet engine
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
    {
        'stevearc/conform.nvim',
    },
}
