return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = function(bufnr)
                if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_fix", "ruff_format" }
                else
                    return { "isort", "black" }
                end
            end,
            go = { "gofmt", "goimports" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    }
}
