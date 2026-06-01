return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				virtual_text = true,
				virtual_lines = false,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				end,
			})

			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				settings = {
					complete_function_calls = true,
					vtsls = {
						autoUseWorkspaceTsdk = true,
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
						},
						preferences = {
							importModuleSpecifier = "shortest",
							importModuleSpecifierEnding = "minimal",
							includePackageJsonAutoImports = "on",
						},
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableType = { enabled = false },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
					javascript = {
						updateImportsOnFileMove = { enabled = "always" },
						preferences = {
							importModuleSpecifier = "shortest",
							importModuleSpecifierEnding = "minimal",
							includePackageJsonAutoImports = "on",
						},
					},
				},
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			vim.lsp.config("astro", {
				capabilities = capabilities,
			})

			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "vtsls", "cssls", "astro", "basedpyright" },
				automatic_enable = { "vtsls", "cssls", "astro", "basedpyright" },
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Insert }
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Tab>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
}
