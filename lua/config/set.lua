-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- Show current line number
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Show current line number
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.updatetime = 50

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.fileformats = "unix,dos,mac"

vim.opt.conceallevel = 1
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })
-- vim.diagnostic.config({ virtual_text = true })

vim.g.have_nerd_font = true
