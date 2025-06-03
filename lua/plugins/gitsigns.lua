-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map("n", "<leader>lb", gs.toggle_current_line_blame, "Toggle line blame")
    end,
  },
}
