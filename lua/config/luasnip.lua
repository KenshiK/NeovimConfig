local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
  -- Remember the last snippet so you can jumpback to it if needed
  history = true,

  -- Update snippet as you type
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets (a vérifier):
  enable_autosnippets = true,

  -- Explained in the 3rd video that I did not see yet
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },

  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true, desc = 'LuaSnip: Expand the current item or jump to the next item within the snippet' }),

  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true, desc = 'LuaSnip: Move to the previous element within the snippet' }),

  vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.choice_active() then
      ls.choice_active(1)
    end
  end, { silent = true, desc = 'LuaSnip: Select within a list of options' }),
}

require("luasnip.loaders.from_vscode").lazy_load()
