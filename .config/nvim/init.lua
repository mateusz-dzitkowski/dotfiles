vim.g.mapleader = " "

require("config.lazy")

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

