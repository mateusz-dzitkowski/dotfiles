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
        },
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = { additional_args = { "--hidden" } },
        },
    },
}
