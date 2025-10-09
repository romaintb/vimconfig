return {
  -- File navigation
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>tt", ":Neotree toggle<cr>", desc = "Toggle Neo-tree" },
      { "<leader>tf", ":Neotree reveal<cr>", desc = "Reveal in Neo-tree" },
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        sources = { 'filesystem', 'buffers', 'git_status' },
        source_selector = {
          winbar = true,
          statusline = false,
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
        },
      })
    end,
  },

  -- Text editing enhancements
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- Mini.nvim ecosystem (only what snacks doesn't cover)
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require('mini.ai').setup()         -- Better text objects
      require('mini.comment').setup()     -- Commenting
      require('mini.icons').setup()       -- Icons
      require('mini.trailspace').setup()  -- Trailing whitespace
      require('mini.diff').setup({        -- Git diff signs
        view = {
          style = 'sign',
          signs = { add = '┃', change = '┃', delete = '┃' },
        },
      })

      require('mini.icons').mock_nvim_web_devicons()
    end,
  },
}
