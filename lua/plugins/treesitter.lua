return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,

    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
		ensure_installed = {"lua", "vim", "c_sharp", "javascript", "typescript", "rust", "json"},
		sync_install = false,
		auto_install = true,
		highlight = {enable = true},
		indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
            },
        },
	})
    end
}
