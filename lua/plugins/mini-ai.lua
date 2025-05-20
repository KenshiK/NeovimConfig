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
                    move = {
                        enable = true,
                        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
                        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
                    },
                    swap = {
                        enable = true,
                        swap_next = { ["<leader>xa"] = { query = "@parameter.inner", desc = "E[x]change [a]rgument place with the next one" } },
                        swap_previous = { ["<leader>xA"] = { query = "@parameter.inner", desc = "E[x]change [A]rgument place with the previous one" }, },
                    }
                }
            })
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
                },
            })
        end,
    }
}
