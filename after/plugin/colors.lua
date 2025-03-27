usePoimandres()
-- useRosePine()
-- useGruvBuddy()

function usePoimandres()
    require("poimandres").setup({})
    vim.cmd.colorscheme("poimandres")
end

function useRosePine()
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


    vim.cmd.colorscheme("rose-pine")
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9CCFD7", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
end

function useGruvBuddy()
    vim.cmd.colorscheme("gruvbuddy")

    local colorbuddy = require("colorbuddy")
    local Color = colorbuddy.Color
    Color.new("yellow", "#F0F8B0")
    Color.new("green", "#ACC6B2")
    Color.new("orange", "#FFAF87")

    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9CCFD7", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
end
