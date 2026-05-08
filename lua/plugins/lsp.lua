return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local lspconfig_defaults = lspconfig.util.default_config

			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Disable semantic tokens globally to prevent LSP highlighting from overriding treesitter
			-- lspconfig_defaults.capabilities.textDocument.semanticTokens = nil
			-- lspconfig_defaults.capabilities.textDocument.semanticTokensProvider = nil

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
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- Disable semantic tokens to prevent LSP highlighting from overriding treesitter
					-- if client and client.server_capabilities and client.server_capabilities.semanticTokensProvider then
					-- 	client.server_capabilities.semanticTokensProvider = nil
					-- end

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				end,
			})

			require("mason").setup()
			require("mason-lspconfig").setup({})

			-- Get all installed mason packages and set them up
			local mason_lspconfig = require("mason-lspconfig")
			local installed_servers = mason_lspconfig.get_installed_servers()

			for _, server_name in ipairs(installed_servers) do
				if server_name == "vtsls" then
					lspconfig.vtsls.setup({
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
				end
			end
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
