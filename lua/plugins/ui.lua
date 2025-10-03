return {
  -- Keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 500,
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      -- Register group names
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Tree/Tabs" },
        { "<leader>c", group = "Code" },
        { "<leader>r", group = "Rename" },
        { "<leader>u", group = "UI/Toggle" },
      })
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
      -- Make indent guides more subtle
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#363a4f" })
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#363a4f" })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        sections = {
          lualine_b = {}, -- Remove git branch
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {}, -- Remove encoding, fileformat
          lualine_y = {}  -- Remove filetype
        }
      })
    end,
  },
}
