return {
    'neovim/nvim-lspconfig',
    -- cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    -- event = { 'BufReadPre', 'BufNewFile' },
    -- dependencies = {
    --   { 'williamboman/mason.nvim' },
    --   { 'williamboman/mason-lspconfig.nvim' },
    -- },
    -- init = function()
    --   -- Reserve a space in the gutter
    --   -- This will avoid an annoying layout shift in the screen
    --   vim.opt.signcolumn = 'yes'
    -- end,
    -- config = function()
    --   local lsp_defaults = require('lspconfig').util.default_config
    --
    --   -- Add cmp_nvim_lsp capabilities settings to lspconfig
    --   -- This should be executed before you configure any language server
    --   lsp_defaults.capabilities = vim.tbl_deep_extend(
    --     'force',
    --     lsp_defaults.capabilities,
    --     require('cmp_nvim_lsp').default_capabilities()
    --   )
    -- end
}
