return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/nvim-cmp",

		"j-hui/fidget.nvim",
		"b0o/SchemaStore.nvim",
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
	},

	config = function()
		local cmp = require("cmp")

		-- Setup fidget to show LSP progress in the statusline
		require("fidget").setup({})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select), -- Previous completion item
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select), -- Next completion item
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
				["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		require("lsp_lines").setup()
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

		vim.keymap.set("", "<leader>l", function()
			local config = vim.diagnostic.config() or {}
			if config.virtual_text then
				vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
			else
				vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
			end
		end, { desc = "Toggle lsp_lines" })

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end



		-- Define which LSP servers to use and their configurations
		local servers = {
			bashls = true,
			lua_ls = true,
			pyright = true,
			astro = true,
			ts_ls = true,
			cssls = true,

			-- ESLint LSP
			-- eslint = {
			-- 	settings = {
			-- 		workingDirect = { mode = "auto" },
			-- 	},
			-- 	on_attach = function(client, bufnr)
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			buffer = bufnr,
			-- 			command = "EslintFixAll",
			-- 		})
			-- 	end,
			-- },

			-- JSON language server with schema support
			jsonls = {
				settings = {
					json = {
						-- Use schemas from SchemaStore for better JSON completion
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup()

		-- Define tools that should always be installed
		local ensure_installed = {
			"pyright", -- Python language server
			"typescript-language-server", -- TypeScript language server
			-- "eslint", -- Linter and formatter
			"lua_ls", -- Lua language server
		}

		vim.list_extend(ensure_installed, servers_to_install)

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end

			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			vim.lsp.config(name, config)
			vim.lsp.enable(name)
		end
	end,
}
