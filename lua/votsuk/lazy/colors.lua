function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9CCFD7", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
                before_highlight = function(group, highlight, palette)
                    if highlight.fg == palette.pine then
                       highlight.fg = "#94ABC5"
                    end

                    if highlight.fg == palette.gold then
                       highlight.fg = "#FFAF87"
                    end

                    if highlight.bg == palette.base then
                       highlight.bg = "#1D1F20"
                    end

                    if highlight.bg == palette.surface then
                       highlight.bg = "#242424"
                    end

                    if highlight.bg == palette.base then
                       highlight.bg = "#1D1F20"
                    end

                    if highlight.bg == palette.surface then
                        highlight.bg = "#242424"
                    end
                end
            })
            ColorMyPencils();
        end
    },
}
