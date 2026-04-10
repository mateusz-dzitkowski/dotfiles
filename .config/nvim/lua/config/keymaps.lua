-- remove the default keymaps
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "grx")

-- set some keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
local function toggle_neotree_focus()
    local ft = vim.bo[vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())].filetype
    if ft == "neo-tree" then
        vim.cmd("Neotree close")
        vim.cmd("wincmd p")
    else
        vim.cmd("Neotree focus")
    end
end
vim.keymap.set("n", "<leader>o", toggle_neotree_focus, { desc = "Focus on Neotree" })

vim.keymap.set("n", "J", vim.diagnostic.open_float, { desc = "Open diagnostics" })

local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })

-- incremental selecting
vim.keymap.set({ "x", "o" }, "<A-o>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "x", "o" }, "<A-i>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
