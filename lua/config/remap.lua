vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Desactivate highlight after a search' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Déplace le contenu séléctionné
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move the text block down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move the text block up' })

-- Garde le curseur au milieu de l'ecran quand tu déplaces de page en page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Go down a page (centered)' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Go up a page (centered)' })

-- Garde les mots cherchés au milieu de l'ecran
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next instance of searched word (centered)' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous instance of searched word (centered)' })

-- Copie dans le registre système/presse-papier
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {desc = 'Copy in paperclip'})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = 'Copy in paperclip'})
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p", {desc = 'Paste from paperclip'})
vim.keymap.set("n", "<leader>P", "\"+P", {desc = 'Paste from paperclip'})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
desc = 'LSP actions',
callback = function(event)
  vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = event.buf, desc = 'Hover'})
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = event.buf, desc = '[G]o to [d]efinition' })
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = event.buf, desc = '[G]o to [D]eclaration' })
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = event.buf, desc = '[G]o to [i]mplementation' })
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = event.buf, desc = '[G]o to type definition' })
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = event.buf, desc = 'Toggle [s]ignature' })
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = event.buf, desc = 'Rename object' })
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { buffer = event.buf, desc = 'Format' })
  vim.keymap.set({ 'n', 'x' }, 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = event.buf, desc = 'Code [a]ction' })
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.diagnostic.open_float()<cr>', { buffer = event.buf, desc = 'Display diagnostic on current line' })
end,
})

