vim.g.have_nerd_font = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Desactivate highlight after a search' })

-- Open terminal (Using plugin Floaterm)
vim.keymap.set('n', '<leader>te', '<cmd>FloatermToggle<CR>', { desc = 'Open floating terminal' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = '[S]earch Telescope [B]uiltin' })
vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = '[S]earch [T]ext by grep' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch in [G]it' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files (config)' })

function vim.getVisualSelection()
	local current_clipboard_content = vim.fn.getreg('"')

	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	vim.fn.setreg('"', current_clipboard_content)

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

-- Add visual selection search
vim.keymap.set('v', '<space>sw', function()
	local text = vim.getVisualSelection()
	builtin.grep_string({ search = text })
end, { desc = '[S]earch selected [T]ext by grep' })

-- Use telelscope display to search lsp references
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]o to [R]eference' })

-- Netrw Keymap
-- vim.keymap.set("n", "<leader>pv", '<cmd>Neotree<cr>', { desc = 'Open file Tree' })

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = 'Open UndoTree' })

-- To install a new LSP
-- :LspInstall [lspName] (sans préciser le nom il y a des suggestions selon le fichier courant)

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

-- Refactoring.nvim
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {desc = 'QUICKFIX: Go to next'})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", {desc = 'QUICKFIX: Go to previous'})
vim.keymap.set("n", "<M-x>", "<cmd>cclose<CR>", {desc = 'QUICKFIX: Close quickfix window'})
vim.keymap.set("n", "<M-d>", function()
    vim.diagnostic.setqflist()
    vim.cmd.cclose()
    vim.cmd.cnext()
end, {desc = 'QUICKFIX: Navigate diagnostics'})
