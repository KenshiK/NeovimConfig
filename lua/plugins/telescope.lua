return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		'debugloop/telescope-undo.nvim',
--    'ThePrimeagen/harpoon'
	},
	config = function()
		require("telescope").setup({
			-- the rest of your telescope config goes here
			extensions = {
				undo = {
					-- telescope-undo.nvim config, see below
				},
				-- other extensions:
				-- file_browser = { ... }
			},
		})
		require("telescope").load_extension("undo")
		-- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
--		require("telescope").load_extension("harpoon")
	end,
}
