function ColorMyPencils()
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#9CCFD7", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#121112" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },
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
                        highlight.fg = "#8aa9b5"
                    end
                    if highlight.fg == palette.gold then
                        highlight.fg = "#daa993"
                    end
                end
            })

            ColorMyPencils()
        end
    },
}
