local colors = {
	bg = "#282c34",
	fg = "#000000",
	pink = "#CBA6F7",
	dark_pink = "#45475A",
	darker_pink = "#2C2E3A",
	light = "#B6BEDA",
}

return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					section_separators = "",
					component_separators = "",
					icons_enabled = false,
					theme = {
						normal = {
							a = { fg = colors.fg, bg = colors.pink },
							b = { fg = colors.light, bg = colors.dark_pink },
							c = { fg = colors.light, bg = colors.darker_pink },
						},
						insert = {
							a = { fg = colors.fg, bg = colors.pink },
							b = { fg = colors.light, bg = colors.dark_pink },
						},
						visual = {
							a = { fg = colors.fg, bg = colors.pink },
							b = { fg = colors.light, bg = colors.dark_pink },
						},
						replace = {
							a = { fg = colors.fg, bg = colors.pink },
							b = { fg = colors.light, bg = colors.dark_pink },
						},
						command = {
							a = { fg = colors.fg, bg = colors.pink },
							b = { fg = colors.light, bg = colors.dark_pink },
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
