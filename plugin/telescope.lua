function GetVisualSelection()
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

vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/debugloop/telescope-undo.nvim',
    'https://github.com/nvim-telescope/telescope.nvim'
})
  -- config = function()
  --   require("telescope").load_extension("undo")
  --   require("telescope").load_extension("noice")
    require("telescope").setup({
      defaults = {
        path_display={"truncate"},
        file_ignore_patterns = { "%__virtual.cs$" },
      },
      -- the rest of your telescope config goes here
      -- extensions = {
      --   undo = {
      --     mappings = {
      --       i = {
      --         ["<cr>"] = require("telescope-undo.actions").yank_additions,
      --         ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
      --         ["<C-cr>"] = require("telescope-undo.actions").restore,
      --         -- alternative defaults, for users whose terminals do questionable things with modified <cr>
      --         ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
      --         ["<C-r>"] = require("telescope-undo.actions").restore,
      --       },
      --       n = {
      --         ["y"] = require("telescope-undo.actions").yank_additions,
      --         ["Y"] = require("telescope-undo.actions").yank_deletions,
      --         ["u"] = require("telescope-undo.actions").restore,
      --       },
      --     },
      --   },
      -- },
    })
  -- end,


vim.keymap.set('n', "<leader>u", "<cmd>Telescope undo<cr>",                                   { desc = 'Open UndoTree', silent = true })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,                     { desc = '[S]earch [H]elp' , silent = true })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files,                    { desc = '[S]earch [F]iles' , silent = true })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps,                       { desc = '[S]earch [K]eymaps' , silent = true })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').builtin,                       { desc = '[S]earch Telescope [B]uiltin' , silent = true })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[S]earch [S]ymbols' , silent = true })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,                   { desc = '[S]earch current [W]ord' , silent = true })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').live_grep,                     { desc = '[S]earch [T]ext by grep' , silent = true })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files,                     { desc = '[S]earch in [G]it' , silent = true })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,                   { desc = '[S]earch [D]iagnostics' , silent = true })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume,                        { desc = '[S]earch [R]esume' , silent = true })
vim.keymap.set('n', '<leader>s.', require('telescope.builtin').oldfiles,                      { desc = '[S]earch Recent Files ("." for repeat)' , silent = true })
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers,                 { desc = '[ ] Find existing buffers' , silent = true })
vim.keymap.set('n',  '<leader>sm', '<cmd>Telescope notify<CR>', { desc = '[S]earch [M]essage', silent = true })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
    end, { desc = '[/] Fuzzily search in current buffer', silent = true })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files (config)' , silent = true })

-- Add visual selection search
vim.keymap.set('v', '<leader>sw', function()
        local text = GetVisualSelection()
        require('telescope.builtin').grep_string({ search = text })
    end, { desc = '[S]earch selected [T]ext by grep', silent = true })

-- Use telescope display to search lsp references
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eference', silent = true })

--     -- Undotree
--     {"<leader>u", "<cmd>Telescope undo<cr>", desc = 'Open UndoTree' },
