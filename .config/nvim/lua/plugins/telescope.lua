return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "%.git/" },
            mappings = {
                i = {
                    ["<CR>"] = function(prompt_bufnr)
                        local actions = require("telescope.actions")
                        local entry = require("telescope.actions.state").get_selected_entry()
                        actions.select_default(prompt_bufnr)
                        if entry and entry.lnum then
                            vim.schedule(function()
                                vim.api.nvim_win_set_cursor(0, { entry.lnum, (entry.col or 1) - 1 })
                            end)
                        end
                    end,
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = { additional_args = { "--hidden" } },
        },
    },
}
