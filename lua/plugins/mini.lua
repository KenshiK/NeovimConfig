return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function ()
    require('mini.surround').setup(
      {
        search_method = 'cover_or_next',
      })

    local spec_treesitter = require('mini.ai').gen_spec.treesitter
    require('mini.ai').setup({
        custom_textobjects = {
            F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
            ['='] = spec_treesitter({ a = '@assignement.outer', i = '@assignement.inner' }), -- does not work in c#
            c = spec_treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
            l = spec_treesitter({ a = '@loop.outer', i = '@loop.inner' }),-- does not work in c# ? is supposed to
        },
    })

    require('mini.comment').setup()
    end
}
