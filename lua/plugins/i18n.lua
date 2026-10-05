return {
  'yelog/i18n.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-treesitter/nvim-treesitter',
    'saghen/blink.cmp',
  },
  config = function()
    require('i18n').setup({
      -- Locales to parse; first is the default locale
      -- Use I18nNextLocale command to switch the default locale in real time
      locales = { 'fr' },
      -- sources can be string or table { pattern = "...", prefix = "..." }
      sources = {
        'src/assets/i18n/{locales}.json',
        -- { pattern = "src/locales/lang/{locales}/{module}.ts",            prefix = "{module}." },
        -- { pattern = "src/views/{bu}/locales/lang/{locales}/{module}.ts", prefix = "{bu}.{module}." },
      }
    })
  end
}
