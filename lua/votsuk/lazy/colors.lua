
local function setup_custom_theme()
  -- Define color palette based on Cursor Dark Midnight
  local colors = {
    bg0 = "#191c22",        -- Main background
    bg1 = "#1e2127",        -- Secondary background
    bg2 = "#20242c",        -- Tertiary background
    bg3 = "#272c36",        -- Lighter background
    bg4 = "#434c5e",        -- Even lighter background

    fg0 = "#d8dee9",        -- Main foreground
    fg1 = "#7b88a1",        -- Secondary foreground
    fg2 = "#4c566a",        -- Tertiary foreground
    fg3 = "#4b5163",        -- Muted foreground

    red = "#bf616a",        -- Error, deletion
    orange = "#d08770",     -- Warning
    yellow = "#ebcb8b",     -- Warning, modified
    green = "#a3be8c",      -- Success, addition
    cyan = "#8fbcbb",       -- Info, classes
    blue = "#81a1c1",       -- Keywords, types
    purple = "#b48ead",     -- Numbers, constants
    teal = "#88c0d0",       -- Functions, links
  }

  -- Clear existing highlights
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")
  vim.g.colors_name = "cursor-midnight"

  -- Helper function to set highlights
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Basic UI
  hl("Normal", { fg = colors.fg1, bg = colors.bg1 })
  hl("NormalFloat", { fg = colors.fg0, bg = colors.bg0 })
  hl("NormalNC", { fg = colors.fg1, bg = colors.bg1 })
  hl("Cursor", { fg = colors.bg0, bg = colors.fg0 })
  hl("CursorLine", { bg = colors.bg3 })
  hl("CursorColumn", { bg = colors.bg3 })
  hl("ColorColumn", { bg = colors.bg3 })
  hl("SignColumn", { fg = colors.fg2, bg = colors.bg1 })
  hl("Folded", { fg = colors.fg2, bg = colors.bg3 })
  hl("FoldColumn", { fg = colors.fg2, bg = colors.bg1 })

  -- Line numbers
  hl("LineNrAbove", { fg = colors.fg2 })
  hl("LineNr", { fg = colors.fg1 })
  hl("LineNrBelow", { fg = colors.fg2 })
  hl("CursorLineNr", { fg = colors.fg1, bold = true })

  -- Visual selection
  hl("Visual", { bg = colors.bg4 })
  hl("VisualNOS", { bg = colors.bg4 })

  -- Search
  hl("Search", { fg = colors.bg0, bg = colors.teal })
  hl("IncSearch", { fg = colors.bg0, bg = colors.yellow })
  hl("Substitute", { fg = colors.bg0, bg = colors.orange })

  -- Diff
  hl("DiffAdd", { fg = colors.green, bg = colors.bg0 })
  hl("DiffChange", { fg = colors.yellow, bg = colors.bg0 })
  hl("DiffDelete", { fg = colors.red, bg = colors.bg0 })
  hl("DiffText", { fg = colors.bg0, bg = colors.yellow })

  -- Statusline
  hl("StatusLine", { fg = colors.blue, bg = colors.bg0 })
  hl("StatusLineNC", { fg = colors.fg2, bg = colors.bg0 })
  hl("WildMenu", { fg = colors.fg0, bg = colors.bg4 })

  -- Tabline
  hl("TabLine", { fg = colors.fg3, bg = colors.bg0 })
  hl("TabLineFill", { bg = colors.bg0 })
  hl("TabLineSel", { fg = colors.fg0, bg = colors.bg1 })

  -- Popup menu
  hl("Pmenu", { fg = colors.fg0, bg = colors.bg0 })
  hl("PmenuSel", { fg = colors.fg0, bg = colors.bg4 })
  hl("PmenuSbar", { bg = colors.bg3 })
  hl("PmenuThumb", { bg = colors.bg4 })

  -- Messages
  hl("ErrorMsg", { fg = colors.red })
  hl("WarningMsg", { fg = colors.yellow })
  hl("ModeMsg", { fg = colors.fg0 })
  hl("MoreMsg", { fg = colors.green })
  hl("Question", { fg = colors.cyan })

  -- Syntax highlighting
  hl("Comment", { fg = colors.fg2, italic = true })
  hl("Constant", { fg = colors.purple })
  hl("String", { fg = colors.green })
  hl("Character", { fg = colors.yellow })
  hl("Number", { fg = colors.purple })
  hl("Boolean", { fg = colors.purple })
  hl("Float", { fg = colors.purple })

  hl("Identifier", { fg = colors.fg0 })
  hl("Function", { fg = colors.teal })

  hl("Statement", { fg = colors.blue })
  hl("Conditional", { fg = colors.blue })
  hl("Repeat", { fg = colors.blue })
  hl("Label", { fg = colors.blue })
  hl("Operator", { fg = colors.blue })
  hl("Keyword", { fg = colors.blue })
  hl("Exception", { fg = colors.blue })

  hl("PreProc", { fg = colors.cyan })
  hl("Include", { fg = colors.cyan })
  hl("Define", { fg = colors.cyan })
  hl("Macro", { fg = colors.cyan })
  hl("PreCondit", { fg = colors.cyan })

  hl("Type", { fg = colors.cyan })
  hl("StorageClass", { fg = colors.blue })
  hl("Structure", { fg = colors.cyan })
  hl("Typedef", { fg = colors.cyan })

  hl("Special", { fg = colors.orange })
  hl("SpecialChar", { fg = colors.orange })
  hl("Tag", { fg = colors.blue })
  hl("Delimiter", { fg = colors.fg0 })
  hl("SpecialComment", { fg = colors.cyan, italic = true })
  hl("Debug", { fg = colors.red })

  -- Tree-sitter highlights
  hl("@variable", { fg = colors.fg0 })
  hl("@variable.builtin", { fg = colors.blue })
  hl("@variable.parameter", { fg = colors.fg0 })
  hl("@variable.member", { fg = colors.fg0 })
  hl("@variable.import", { fg = colors.fg0 })
  hl("@variable.export", { fg = colors.fg0 })
  hl("@variable.other", { fg = colors.fg0 })

  hl("@module", { fg = colors.fg0 })
  hl("@namespace", { fg = colors.fg0 })

  hl("@constant", { fg = colors.cyan })
  hl("@constant.builtin", { fg = colors.blue })
  hl("@constant.macro", { fg = colors.cyan })

  hl("@string", { fg = colors.green })
  hl("@string.regexp", { fg = colors.yellow })
  hl("@string.escape", { fg = colors.yellow })

  hl("@character", { fg = colors.yellow })
  hl("@character.special", { fg = colors.blue })

  hl("@number", { fg = colors.purple })
  hl("@boolean", { fg = colors.purple })

  hl("@function", { fg = colors.teal })
  hl("@function.builtin", { fg = colors.teal })
  hl("@function.call", { fg = colors.teal })
  hl("@function.macro", { fg = colors.cyan })
  hl("@function.import", { fg = colors.fg0 })

  hl("@method", { fg = colors.teal })
  hl("@method.call", { fg = colors.teal })

  hl("@constructor", { fg = colors.cyan })

  hl("@parameter", { fg = colors.fg0 })

  hl("@keyword", { fg = colors.blue })
  hl("@keyword.function", { fg = colors.blue })
  hl("@keyword.operator", { fg = colors.blue })
  hl("@keyword.return", { fg = colors.blue })
  hl("@keyword.conditional", { fg = colors.blue })
  hl("@keyword.repeat", { fg = colors.blue })
  hl("@keyword.import", { fg = colors.blue })
  hl("@keyword.operator", { fg = colors.blue })

  hl("@operator", { fg = colors.blue })

  hl("@type", { fg = colors.fg0 })
  hl("@type.builtin", { fg = colors.cyan })
  hl("@type.definition", { fg = colors.cyan })

  hl("@property", { fg = colors.fg0 })
  hl("@field", { fg = colors.fg0 })

  hl("@punctuation.delimiter", { fg = colors.fg0 })
  hl("@punctuation.bracket", { fg = colors.fg0 })
  hl("@punctuation.special", { fg = colors.blue })

  hl("@tag", { fg = colors.blue })
  hl("@tag.builtin", { fg = colors.blue })
  hl("@tag.attribute", { fg = colors.cyan, italic = true })
  hl("@tag.delimiter", { fg = colors.blue })

  hl("@comment", { fg = colors.fg2, italic = true })
  hl("@comment.documentation", { fg = colors.fg2, italic = true })

  -- Diagnostic highlights
  hl("DiagnosticError", { fg = colors.red })
  hl("DiagnosticWarn", { fg = colors.yellow })
  hl("DiagnosticInfo", { fg = colors.teal })
  hl("DiagnosticHint", { fg = colors.cyan })

  hl("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg0 })
  hl("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.bg0 })
  hl("DiagnosticVirtualTextInfo", { fg = colors.teal, bg = colors.bg0 })
  hl("DiagnosticVirtualTextHint", { fg = colors.cyan, bg = colors.bg0 })

  hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.teal })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

  -- LSP semantic tokens
  hl("@lsp.type.class", { fg = colors.cyan })
  hl("@lsp.type.enum", { fg = colors.cyan })
  hl("@lsp.type.interface", { fg = colors.cyan })
  hl("@lsp.type.struct", { fg = colors.cyan })
  hl("@lsp.type.namespace", { fg = colors.fg0 })
  hl("@lsp.type.module", { fg = colors.fg0 })
  hl("@lsp.type.parameter", { fg = colors.fg0 })
  hl("@lsp.type.property", { fg = colors.fg0 })
  hl("@lsp.type.enumMember", { fg = colors.purple })
  hl("@lsp.type.function", { fg = colors.teal })
  hl("@lsp.type.method", { fg = colors.teal })
  hl("@lsp.type.macro", { fg = colors.cyan })
  hl("@lsp.type.decorator", { fg = colors.orange })
  hl("@lsp.type.variable", { fg = colors.fg0 })

  -- Git signs
  hl("GitSignsAdd", { fg = colors.green })
  hl("GitSignsChange", { fg = colors.yellow })
  hl("GitSignsDelete", { fg = colors.red })

  -- Telescope
  hl("TelescopeNormal", { fg = colors.fg0, bg = colors.bg0 })
  hl("TelescopeBorder", { fg = colors.bg3, bg = colors.bg0 })
  hl("TelescopePromptNormal", { fg = colors.fg0, bg = colors.bg3 })
  hl("TelescopePromptBorder", { fg = colors.bg3, bg = colors.bg3 })
  hl("TelescopePromptTitle", { fg = colors.bg0, bg = colors.teal })
  hl("TelescopePreviewTitle", { fg = colors.bg0, bg = colors.green })
  hl("TelescopeResultsTitle", { fg = colors.bg0, bg = colors.blue })
  hl("TelescopeSelection", { fg = colors.fg0, bg = colors.bg4 })
  hl("TelescopeSelectionCaret", { fg = colors.teal, bg = colors.bg4 })

  -- Neo-tree
  hl("NeoTreeNormal", { fg = colors.fg1, bg = colors.bg0 })
  hl("NeoTreeNormalNC", { fg = colors.fg1, bg = colors.bg0 })
  hl("NeoTreeDirectoryName", { fg = colors.fg0 })
  hl("NeoTreeDirectoryIcon", { fg = colors.blue })
  hl("NeoTreeFileName", { fg = colors.fg0 })
  hl("NeoTreeFileIcon", { fg = colors.fg1 })
  hl("NeoTreeGitAdded", { fg = colors.green })
  hl("NeoTreeGitModified", { fg = colors.yellow })
  hl("NeoTreeGitDeleted", { fg = colors.red })
  hl("NeoTreeGitIgnored", { fg = colors.fg2 })
  hl("NeoTreeIndentMarker", { fg = colors.fg2 })
  hl("NeoTreeExpander", { fg = colors.fg2 })

  -- Netrw-specific highlights
  hl("netrwDir", { fg = colors.cyan, bold = true })            -- Directories
  hl("netrwPlain", { fg = colors.fg0 })                        -- Regular files  
  hl("netrwLink", { fg = colors.cyan })                        -- Symbolic links
  hl("netrwSymLink", { fg = colors.cyan })                     -- Symbolic links (alternative)
  hl("netrwExe", { fg = colors.green, bold = true })           -- Executable files
  hl("netrwClassify", { fg = colors.yellow })                  -- File classifications
  hl("netrwCursorLine", { fg = colors.fg0, bg = colors.blue }) -- Current selection
  hl("netrwQuickHelp", { fg = colors.fg2 })                    -- Help text
  hl("netrwHelpCmd", { fg = colors.teal })                     -- Help commands
  hl("netrwComment", { fg = colors.fg2, italic = true })       -- Comments
  hl("netrwVersion", { fg = colors.fg2 })                      -- Version info
  hl("netrwList", { fg = colors.fg0 })                         -- List items
  hl("netrwHidePat", { fg = colors.fg2 })                      -- Hidden patterns
  hl("netrwTreeBar", { fg = colors.fg2 })                      -- Tree view bars

  -- Diagnostic virtual text (appears at end of lines)
  hl("DiagnosticVirtualTextError", { fg = colors.red, bg = "NONE", italic = true })
  hl("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = "NONE", italic = true })
  hl("DiagnosticVirtualTextInfo", { fg = colors.teal, bg = "NONE", italic = true })
  hl("DiagnosticVirtualTextHint", { fg = colors.blue, bg = colors.bg0, italic = true })

  -- Markdown
  hl("@markup.raw.markdown_inline", { fg = colors.cyan, bg = colors.bg1 })
  hl("@markup.list.markdown", { fg = colors.fg0, bg = colors.bg1 })
  hl("@markup.heading", { fg = colors.blue, bg = colors.bg1 })
  hl("@markup.strong", { fg = colors.fg0, bg = colors.bg1 })
  hl("@markup.link.label", { fg = colors.blue, bg = colors.bg1 })
  hl("@markup.link.markdown_inline", { fg = colors.fg0, bg = colors.bg1 })
  hl("@markup.link.url", { fg = colors.fg1, bg = colors.bg1 })
end

-- Apply the custom theme
setup_custom_theme()

return {}
