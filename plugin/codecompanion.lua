vim.pack.add({
    "https://www.github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    {
        src = "https://www.github.com/olimorris/codecompanion.nvim",
        version = vim.version.range("^19.0.0")
    },
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "kimi_cli",
    },
    inline = {
      adapter = "kimi_cli",
    },
  },
  adapters = {
    http = {
      kimi = function()
        return require("codecompanion.adapters").extend("kimi", {
          env = {
            api_key = "KIMI_API_KEY",
          },
        })
      end,
    },
  },
})

vim.keymap.set({ "n", "v" }, "<F36>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "Code Companion Actions(C-F12)"})
vim.keymap.set({ "n", "v" }, "<LocalLeader>k", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "Code Companion Chat toggle"})

