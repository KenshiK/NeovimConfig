return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local custom_onedark = require'lualine.themes.onedark'

        -- Change the background of lualine_c section for normal mode
        custom_onedark.normal.c.bg = '#232326'
        require('lualine').setup({
            options = {
                    theme = custom_onedark, --'onedark',
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
            sections = {
                lualine_a = { {'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { {'filetype', icon = { align = 'left' }}, 'lsp_status',  },
                lualine_c = { {'filename', path = 1}, 'diagnostics' },
                lualine_x = { },
                lualine_y = { 'diff', 'branch', 'fileformat', 'encoding' },
                lualine_z = { {'location', separator = { right = '' }, left_padding = 2 } }
            },
            extensions = { 'lazy', 'mason', 'nvim-dap-ui', 'fzf' }
        })
    end
}
