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
        options = {
          disabled_filetypes = {
            winbar = { 'neo-tree' },
          },
        },
        sections = {
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_x = {},
          lualine_y = {}
        },
        winbar = {
          lualine_a = {},
          lualine_b = {
            { 'branch', icon = '' }
          },
          lualine_c = {
            {
              'filetype',
              icon_only = true,
              padding = { left = 1, right = 0 }
            },
            {
              'filename',
              path = 1,
              symbols = { modified = '●', readonly = '' }
            }
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            }
          },
        },
        inactive_winbar = {
          lualine_c = {
            {
              'filetype',
              icon_only = true,
              colored = false,
              padding = { left = 1, right = 0 }
            },
            {
              'filename',
              path = 1,
            }
          },
        },
      })
    end,
  },
}
