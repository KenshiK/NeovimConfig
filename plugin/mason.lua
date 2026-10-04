vim.pack.add(
    {
        'https://github.com/mason-org/mason.nvim',
        'https://github.com/mason-org/mason-lspconfig.nvim',
        -- Depedencies
        'https://github.com/neovim/nvim-lspconfig'
    }
)

 require('mason').setup()

