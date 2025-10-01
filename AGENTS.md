# Agent Instructions for Neovim Config

## Build/Lint/Test Commands
- **Format Lua**: `stylua lua/`
- **No linting setup found**
- **No test framework** (plenary installed but no tests defined)

## Code Style Guidelines
- **Indentation**: 4 spaces, no tabs (`expandtab = true`)
- **Line length**: 80 characters (`colorcolumn = "80"`)
- **Naming**: snake_case for variables, camelCase for functions
- **Imports**: Use `require()` at top of files
- **Error handling**: Use `pcall()` for potentially failing operations
- **Types**: No explicit typing (Lua is dynamically typed)
- **Formatting**: Auto-format on save with conform.nvim
