vim.pack.add({'https://github.com/lewis6991/gitsigns.nvim'})


local gs = require('gitsigns')
local function map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
end

-- Navigation
map("n", "]h", gs.next_hunk, "Next Hunk")
map("n", "[h", gs.prev_hunk, "Previous Hunk")
map("n", "<leader>tb", gs.toggle_current_line_blame, "[T]oggle line [b]lame")
map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
map('n', '<leader>hp', gs.preview_hunk, "Preview Hunk")
map('n', '<leader>hQ', function() gs.setqflist('all') end, "Set QF List (all)")
map('n', '<leader>hq', gs.setqflist, "Set QF List")
-- Text object
map({'o', 'x'}, 'ih', gs.select_hunk, "Select Hunk")
