return {
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
