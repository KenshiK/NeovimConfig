vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/ThePrimeagen/harpoon'
})

require("harpoon").setup()

vim.keymap.set('n', "<leader>h", function() require("harpoon"):list():add() end, { desc = "harpoon file", silent = true })
vim.keymap.set('n', "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon quick menu", silent = true })
vim.keymap.set('n', "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "harpoon to file 1", silent = true })
vim.keymap.set('n', "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "harpoon to file 2", silent = true })
vim.keymap.set('n', "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "harpoon to file 3", silent = true })
vim.keymap.set('n', "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "harpoon to file 4", silent = true })
vim.keymap.set('n', "<leader>5", function() require("harpoon"):list():select(5) end, { desc = "harpoon to file 5", silent = true })
vim.keymap.set('n', "<leader>6", function() require("harpoon"):list():select(6) end, { desc = "harpoon to file 6", silent = true })
vim.keymap.set('n', "<leader>7", function() require("harpoon"):list():select(7) end, { desc = "harpoon to file 7", silent = true })
vim.keymap.set('n', "<leader>8", function() require("harpoon"):list():select(8) end, { desc = "harpoon to file 8", silent = true })
vim.keymap.set('n', "<leader>9", function() require("harpoon"):list():select(9) end, { desc = "harpoon to file 9", silent = true })
vim.keymap.set('n', "<leader>0", function() require("harpoon"):list():select(10) end, { desc = "harpoon to file 10", silent = true })
