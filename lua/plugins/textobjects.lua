return
{
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        version = '*',
        event = "VeryLazy",
        enabled = true,
        config = function()
            require('nvim-treesitter.configs').setup({
                textobjects = {
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
                }
            })

            local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

            -- vim way: ; goes to the direction you were moving.
            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
            vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        end,
    },
    {
        'echasnovski/mini.nvim',
        version = '*',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        config = function()
            local spec_treesitter = require('mini.ai').gen_spec.treesitter
            require('mini.ai').setup({
                custom_textobjects = {
                    F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
                    ['='] = spec_treesitter({ a = '@assignement.outer', i = '@assignement.inner' }), -- does not work in c#
                    c = spec_treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
                    l = spec_treesitter({ a = '@loop.outer', i = '@loop.inner' }),-- does not work in c# ? is supposed to
                },
            })
        end,
    }
}
