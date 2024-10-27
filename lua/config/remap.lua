-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files within git' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })

-- Netrw Keymap
vim.keymap.set("n", "<leader>pv", '<cmd>Neotree<cr>')

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- To install a new LSP
-- :LspInstall [lspName] (sans préciser le nom il y a des suggestions selon le fichier courant)

-- Déplace le contenu séléctionné
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Garde le curseur au milieu de l'ecran quand tu déplaces de page en page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Garde les mots cherchés au milieu de l'ecran
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap le système register
-- -- Copie dans le registre système/presse-papier
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- -- Colle le contenu du registre système/presse-papier
-- -- Vu que Ctrl+v marche je sais pas si j'en ai encore besoin
-- vim.keymap.set("n", "<leader>p", "\"+p")
-- vim.keymap.set("v", "<leader>p", "\"+p")
-- vim.keymap.set("n", "<leader>P", "\"+P")
vim.opt.fileformats = "unix,dos,mac"
