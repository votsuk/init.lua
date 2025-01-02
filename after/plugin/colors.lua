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
