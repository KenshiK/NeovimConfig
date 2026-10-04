vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'})

require('nvim-treesitter-textobjects').setup({
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
            }
        },
        move = {
            enable = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@conditional.outer",
                ["]a"] = "@parameter.inner",
                ["]l"] = "@loop.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@conditional.outer",
                ["]A"] = "@parameter.inner",
                ["]L"] = "@loop.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@conditional.outer",
                ["[a"] = "@parameter.inner",
                ["[l"] = "@loop.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@conditional.outer",
                ["[A"] = "@parameter.outer",
                ["[L"] = "@loop.outer",
            },
        },
        swap = {
            enable = true,
            lookahead = true,
            swap_next = { ["<leader>xa"] = { query = "@parameter.inner", desc = "E[x]change [a]rgument place with the next one" } },
            swap_previous = { ["<leader>xA"] = { query = "@parameter.inner", desc = "E[x]change [A]rgument place with the previous one" }, },
        }
})

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move, { desc = 'Repeat last move' })
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite, { desc = 'Repeat last move in opposite direction' })
-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
