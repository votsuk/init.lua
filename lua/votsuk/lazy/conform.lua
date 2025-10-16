return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			-- format_on_save = {
			-- 	timeout_ms = 5000,
			-- 	lsp_format = "never",
			-- },
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
