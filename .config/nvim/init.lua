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

require("conform").setup({
	formatters_by_ft = {
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_fix", "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		go = { "gofmt" },
		javascript = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
