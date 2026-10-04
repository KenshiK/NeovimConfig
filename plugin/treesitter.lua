vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })


require("nvim-treesitter").setup({})
require("nvim-treesitter").install({"lua", "vim", "c_sharp", "javascript", "typescript", "rust", "json", "yaml"})

-- require("nvim-treesitter.install").update({ with_sync = true })()
-- require("nvim-treesitter.configs").setup({
--     ensure_installed = {"lua", "vim", "c_sharp", "javascript", "typescript", "rust", "json"},
--     sync_install = false,
--     auto_install = true,
--     highlight = {enable = true},
--     indent = { enable = true },
--     incremental_selection = {
--         enable = true,
--         -- keymaps = {
--         --         init_selection = "<C-space>",
--         --         node_incremental = "<C-space>",
--         --         scope_incremental = false,
--         --         node_decremental = "<bs>",
--         -- },
--     },
-- })
