-- return {
--     "nvzone/floaterm",
--     dependencies = "nvzone/volt",
--     opts = {},
--     cmd = "FloatermToggle",
--     lazy = true,
-- }

return {
    "imranzero/multiterm.nvim",
    event = "VeryLazy",
    config = function()
        require("multiterm").setup({
            -- Recommended keymaps:
            vim.keymap.set("n", "<leader>te", "<Plug>(Multiterm)"),
            vim.keymap.set("n", "<leader>tl", "<Plug>(MultitermList)"),
            -- Add configuration options here if needed
        })
    end
}
