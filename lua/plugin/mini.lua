vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.cmd.colorscheme('miniwinter') -- TODO: choisir mon thème ailleurs
require('mini.basics').setup()
require('mini.comment').setup()
require('mini.pick').setup()

-- Completion
    require('mini.icons').setup()
    require('mini.snippets').setup()
require('mini.completion').setup()
-- Completion

require('mini.surround').setup(
      {
        search_method = 'cover_or_next',
      })

require('mini.bracketed').setup({
        file = { suffix = '', options = {} },
        window = { suffix = '', options = {} },
    })

require('mini.ai').setup({
        custom_textobjects = {
            F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
            ['='] = spec_treesitter({ a = '@assignement.outer', i = '@assignement.inner' }), -- does not work in c#
            c = spec_treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
            l = spec_treesitter({ a = '@loop.outer', i = '@loop.inner' }),-- does not work in c# ? is supposed to
        },
    })

