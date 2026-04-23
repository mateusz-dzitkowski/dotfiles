vim.g.mapleader = " "
vim.g.lazygit_floating_window_scaling_factor = 1

require("config.lazy")
require("config.autocmds")
require("config.options")
require("config.keymaps")

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = true,
})

vim.cmd.colorscheme "catppuccin-mocha"
