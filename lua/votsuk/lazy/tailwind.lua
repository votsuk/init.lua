return {
    'luckasRanarison/tailwind-tools.nvim',
    requires = { 'neovim/nvim-lspconfig' }, -- Required for LSP integration
    config = function()
        require('tailwind-tools').setup {}
    end
}
