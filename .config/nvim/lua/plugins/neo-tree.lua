return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                      -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config
    opts = {
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    ".git",
                },
            },
            use_libuv_file_watcher = true,
            scan_mode = "deep",
            async_directory_scan = "never",
        },
        window = {
            width = 25,
        },
    }
}
