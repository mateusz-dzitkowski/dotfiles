local map = vim.keymap.set

-- remove the default keymaps
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "grx")

-- make vertical movement center the cursor on screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

-- set some keymaps
map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
map("n", "J", vim.diagnostic.open_float, { desc = "Open diagnostics" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

map("n", "<leader>hr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })

-- incremental selecting
map({ "x", "o" }, "<A-o>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

map({ "x", "o" }, "<A-i>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- tresitter movement
map({ "n", "x", "o" }, "]m", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "Start of next function" })
map({ "n", "x", "o" }, "]]", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "Start of next class" })
-- You can also pass a list to group multiple queries.
map({ "n", "x", "o" }, "]o", function()
    require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end, { desc = "Start of next loop" })
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
map({ "n", "x", "o" }, "]s", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end, { desc = "Start of next scope" })
map({ "n", "x", "o" }, "]z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, { desc = "Start of next fold" })

map({ "n", "x", "o" }, "]M", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "End of next function" })
map({ "n", "x", "o" }, "][", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "End of next class" })

map({ "n", "x", "o" }, "[m", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "Start of previous function" })
map({ "n", "x", "o" }, "[[", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "Start of previous class" })

map({ "n", "x", "o" }, "[M", function()
    require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "End of previous function" })
map({ "n", "x", "o" }, "[]", function()
    require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "End of previous class" })
