local function GetVisualSelection()
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

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
  },
  config = function()
    require("telescope").load_extension("undo")
    require("telescope").load_extension("noice")
    require("telescope").setup({
      defaults = {
        path_display={"truncate"},
        file_ignore_patterns = { "%__virtual.cs$" },
      },
      -- the rest of your telescope config goes here
      extensions = {
        undo = {
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-cr>"] = require("telescope-undo.actions").restore,
              -- alternative defaults, for users whose terminals do questionable things with modified <cr>
              ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-r>"] = require("telescope-undo.actions").restore,
            },
            n = {
              ["y"] = require("telescope-undo.actions").yank_additions,
              ["Y"] = require("telescope-undo.actions").yank_deletions,
              ["u"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    })
  end,
  keys = {
    {"<leader>u", "<cmd>Telescope undo<cr>", desc = 'Open UndoTree'},
    {'<leader>sh', require('telescope.builtin').help_tags,  desc = '[S]earch [H]elp' },
    {'<leader>sf', require('telescope.builtin').find_files,  desc = '[S]earch [F]iles' },
    {'<leader>sk', require('telescope.builtin').keymaps,  desc = '[S]earch [K]eymaps' },
    {'<leader>sb', require('telescope.builtin').builtin,  desc = '[S]earch Telescope [B]uiltin' },
    {'<leader>ss', require('telescope.builtin').lsp_dynamic_workspace_symbols,  desc = '[S]earch [S]ymbols' },
    {'<leader>sw', require('telescope.builtin').grep_string,  desc = '[S]earch current [W]ord' },
    {'<leader>st', require('telescope.builtin').live_grep,  desc = '[S]earch [T]ext by grep' },
    {'<leader>sg', require('telescope.builtin').git_files,  desc = '[S]earch in [G]it' },
    {'<leader>sd', require('telescope.builtin').diagnostics,  desc = '[S]earch [D]iagnostics' },
    {'<leader>sr', require('telescope.builtin').resume,  desc = '[S]earch [R]esume' },
    {'<leader>s.', require('telescope.builtin').oldfiles,  desc = '[S]earch Recent Files ("." for repeat)' },
    {'<leader><leader>', require('telescope.builtin').buffers,  desc = '[ ] Find existing buffers' },

    -- Slightly advanced example of overriding default behavior and theme
    {'<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
    end, desc = '[/] Fuzzily search in current buffer' },

    -- Shortcut for searching your Neovim configuration files
    {'<leader>sn', function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
    end, desc = '[S]earch [N]eovim files (config)' },

    -- Add visual selection search
    {'<leader>sw', function()
        require('telescope.builtin').grep_string({ search = GetVisualSelection() })
    end, desc = '[S]earch selected [T]ext by grep' },

    -- Undotree
    {"<leader>u", "<cmd>Telescope undo<cr>", desc = 'Open UndoTree' },

    -- Use telelscope display to search lsp references
    {'gr', require('telescope.builtin').lsp_references,  desc = '[G]o to [R]eference' },
  },
}
