-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local buffer = args.buf
        local telescope = require("telescope.builtin")
        vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Action" })
        vim.keymap.set("n", "gi", telescope.lsp_implementations, { buffer = buffer, desc = "Goto implementations" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
        vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = buffer, desc = "Goto references" })
        vim.keymap.set("n", "gt", telescope.lsp_type_definitions, { buffer = buffer, desc = "Goto type definitions" })
        vim.keymap.set("n", "gd", telescope.lsp_definitions, { buffer = buffer, desc = "Goto definitions" })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Show hover menu" })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "**/*.md",
    callback = function()
        vim.cmd("Markview splitOpen")
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "**/*.md",
    callback = function()
        vim.cmd("Markview splitClose")
    end,
})
