return {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        config = function()
                -- Setup orgmode
                require("orgmode").setup({
                        org_agenda_files = "~/stuff/orgfiles/**/*",
                        org_default_notes_file = "~/stuff/orgfiles/refile.org",
                        org_startup_folded = "showeverything",
                })

                -- Experimental LSP support
                vim.lsp.enable("org")
        end,
}
