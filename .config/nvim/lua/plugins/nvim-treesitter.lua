return {
    "nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
            end
        })
        
        local ensure_installed = {"go", "gosum", "gomod", "python"}
        local already_installed = require("nvim-treesitter.config").get_installed()
        local parsers_to_install = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(already_installed, parser)
            end)
            :totable()
        require("nvim-treesitter").install(parsers_to_install)
    end,
}
