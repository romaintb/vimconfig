return {
  -- Welcome screen
  {
    "echasnovski/mini.starter",
    version = false,
    event = "VimEnter",
    config = function()
      local starter = require("mini.starter")

      -- Random fun headers
      local headers = {
        -- Classic
        table.concat({
          "                                   ",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "                                   ",
        }, "\n"),
        -- Space
        table.concat({
          "         .                                            ",
          "    .          .    *           .     .        .      ",
          "  .    ╔╗╔╔═╗╔═╗╦  ╦╦╔╦╗     .      .         *      ",
          "       ║║║║╣ ║ ║╚╗╔╝║║║║   .    *        .           ",
          "  *    ╝╚╝╚═╝╚═╝ ╚╝ ╩╩ ╩       .        .      .      ",
          "     .        *        .   *       .          .       ",
          "  .       *        .        .            *            ",
        }, "\n"),
        -- Blocky
        table.concat({
          "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
          "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
          " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
          " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
          " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
          " ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
          " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
          "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
          "          ░    ░  ░    ░ ░        ░   ░         ░   ",
        }, "\n"),
      }

      -- Pick a random header
      math.randomseed(os.time())
      local header = headers[math.random(#headers)]

      -- Random motivational footer
      local footers = {
        "🚀 Let's ship some code!",
        "💻 Time to make magic happen",
        "⚡ Powered by caffeine and vim motions",
        "🎯 You got this!",
        "🔥 Ready to crush some bugs",
        "✨ Write once, debug everywhere",
        "🎨 Craft beautiful code",
        "🌙 Late night coding session?",
        "☀️ Another productive day ahead",
        "🎪 The code circus is open",
      }
      local footer = footers[math.random(#footers)]

      starter.setup({
        items = {
          { name = "", action = "", section = "" },
        },
        content_hooks = {
          starter.gen_hook.aligning("center", "center"),
        },
        header = header,
        footer = "\n" .. footer,
      })
    end,
  },

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

  -- Dracula colorscheme (for cocoon-immo-bis)
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 999,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        -- Use soft variant
        colors = {
          bg = "#282a36",
          fg = "#e9e9f4",
          selection = "#44475a",
          comment = "#7970a9",
          red = "#e8616a",
          orange = "#ffca80",
          yellow = "#ffca80",
          green = "#8aff80",
          purple = "#bd93f9",
          cyan = "#8be9fd",
          pink = "#ff79c6",
          bright_red = "#e8616a",
          bright_green = "#8aff80",
          bright_yellow = "#ffca80",
          bright_blue = "#bd93f9",
          bright_magenta = "#ff79c6",
          bright_cyan = "#8be9fd",
          bright_white = "#f7f7fb",
          menu = "#21222c",
          visual = "#3e4452",
          gutter_fg = "#4b5263",
          nontext = "#3b4048",
        },
        -- Set soft background
        transparent_bg = false,
      })
    end,
  },

  -- Catppuccin colorscheme (default)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Set default theme
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
      -- Store lualine config globally so we can refresh it with different themes
      _G.lualine_config = {
        options = {
          theme = 'auto',
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
      }
      require('lualine').setup(_G.lualine_config)
    end,
  },
}
