return {
   {
       'mason-org/mason.nvim',
       lazy = false,
       opts = {
         ui = {
           icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
           }
         },
         registries = {
           'github:mason-org/mason-registry',
           'github:Crashdummyy/mason-registry',
         },
       },
       init = function()
         require('mason').setup()
       end
   },
   {
       'mason-org/mason-lspconfig.nvim',
       opts = {},
       dependencies = {
               { 'mason-org/mason.nvim', opts = {}},
               'neovim/nvim-lspconfig',
       },
   }
}

