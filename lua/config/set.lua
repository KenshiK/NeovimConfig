-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- Show current line number
vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Save undo history
vim.opt.undodir = vim.fn.expand('$HOME/.vim/undodir')
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- No idea what it does
--vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.fileformats = "unix,dos,mac"

-- set Powershell as default terminal
-- /!\ Breaks lazygit and probably other things depending on their installation in the default terminal
-- vim.opt.shell = 'pwsh.exe'

vim.opt.conceallevel = 1
