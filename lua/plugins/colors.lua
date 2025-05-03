return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    opts = { style = "moon" },
  },
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    opts = { style = "moon" },
  },
  -- sonokai
  {
    "sainnhe/sonokai",
    name = "sonokai",
    lazy = true,
    opts = function()
            vim.g.sonokai_enable_italic = true
        end
  },
  -- cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    config = function()
        require("cyberdream").setup({
            saturation = 0.8,
            italic_comments = true,
            highlights = {
                Function = { fg = "#dcdcad", bg = "NONE", italic = false },
                ["@lsp.mod.static"] = { italic = true },
            },
            extensions = {
                telescope = true,
                treesitter = true,
                whichkey = true,
                mini = true,
            }
        })
    vim.cmd([[colorscheme cyberdream]])
    end
  },
  -- vim-code-dark
  {
    "tomasiser/vim-code-dark",
    lazy = true,
  },
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        harpoon = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme catppuccin-mocha]])
    end,
    priority = 1000, -- make sure to load this before all the other start plugins
  },
}
