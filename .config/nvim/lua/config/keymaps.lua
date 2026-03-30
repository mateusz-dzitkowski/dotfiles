local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus on Neotree" })

vim.keymap.set("n", "J", vim.diagnostic.open_float, { desc = "Open diagnostics" })
