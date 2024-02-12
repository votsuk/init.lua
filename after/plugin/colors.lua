require('rose-pine').setup({
    disable_background = true,
    styles = {
        italic = false,
    },
    before_highlight = function(group, highlight, palette)
        if highlight.fg == palette.pine then
            highlight.fg = "#68998a"
        end
        if highlight.fg == palette.gold then
            highlight.fg = "#ffaf87"
        end
    end
})

function ColorMyPencils(color)
	colors = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9CCFD7", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#121112" })
end

ColorMyPencils()
