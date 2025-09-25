local colors = {
	bg = "#282c34",
	fg = "#000000",
    white = "#ffffff",
	pink = "#CBA6F7",
	dark_pink = "#45475A",
	darker_pink = "#2C2E3A",
	light = "#B6BEDA",
    blue = "#02FFFF",
    green = "#00875F",
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
							a = { fg = colors.white, bg = colors.green },
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
					lualine_b = { "branch", "diagnostics" },
					lualine_c = {
                        {
                            "filename",
                            path = 1,
                        }
                    },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
