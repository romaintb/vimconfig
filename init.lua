-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Vim options
vim.opt.listchars = { tab = '   ', trail = '-' }
vim.opt.wildmode = { 'list:longest', 'list:full' }
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.wildmenu = true
vim.opt.fixendofline = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 5
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.mousemodel = 'extend'
vim.opt.whichwrap:append('>,l,<,h')
vim.opt.backspace = '2'
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

-- Leader key
vim.g.mapleader = ' '

-- Basic keybindings
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('i', '<f1>', '<esc>')
vim.keymap.set('n', '<f1>', '<esc>')
vim.keymap.set('v', '<f1>', '<esc>')

-- Tab management
vim.keymap.set('n', '<leader>tc', ':tabnew<cr>')
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>')
vim.keymap.set('n', '<leader>tp', ':tabprev<cr>')

-- Window navigation
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true })
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true })

-- File operations
vim.keymap.set('n', '<leader>e', ':e<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>x', ':qa<cr>')

-- Plugin-specific keybindings (will be set after plugins load)
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>')
vim.keymap.set('n', '<leader>ac', '<cmd>AvanteChat<cr>')
vim.keymap.set('n', '<leader>ae', '<cmd>AvanteEdit<cr>')
vim.keymap.set('n', '<leader>ax', '<cmd>AvanteExplain<cr>')
vim.keymap.set('n', '<leader>at', '<cmd>AvanteTest<cr>')
vim.keymap.set('n', '<leader>as', '<cmd>AvanteStop<cr>')
vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>')
vim.keymap.set('n', '<leader>tf', ':Neotree reveal<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')

-- Autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.colorcolumn = "80"
  end,
})

-- Plugin configuration with lazy.nvim
require("lazy").setup({
  -- Core dependencies
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = false,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
  },

  -- Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
  },

  -- File navigation
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
  },
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
        source_selector = { winbar = true },
        sources = { 'filesystem', 'buffers', 'git_status' },
      })
    end,
  },

  -- Text editing enhancements
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
  {
    "farmergreg/vim-lastplace",
    event = "BufReadPost",
  },

  -- Mini.nvim ecosystem
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require('mini.ai').setup()
      require('mini.comment').setup()
      require('mini.diff').setup({ 
        view = { 
          style = 'sign', 
          signs = { add = '┃', change = '┃', delete = '┃' }, 
        }, 
      })
      require('mini.git').setup()
      require('mini.icons').setup()
      require('mini.statusline').setup()
      require('mini.trailspace').setup()
      
      -- Custom statusline modifications
      require('mini.icons').mock_nvim_web_devicons()
      require('mini.statusline').section_git = function(args) return '' end
      require('mini.statusline').section_fileinfo = function(args) return '' end
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 
          "markdown", "markdown_inline", "lua", "vim", "javascript", 
          "typescript", "python", "rust", "json", "yaml", "html", "css" 
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        },
      })
    end,
  },

  -- UI enhancements
  {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    config = function()
      require('tabby').setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   lazy = true,
  -- },

  -- Language support and AI
  {
    "dense-analysis/ale",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.ale_fixers = { javascript = {'eslint'} }
      vim.g.ale_fix_on_save = 1
      vim.g.ale_completion_autoimport = 1
      vim.g.ale_completion_enabled = 1
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- API configuration
      provider = "anthropic", -- or "anthropic", "google", "ollama"
      auto_suggestions = true,
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        position = "right", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          align = "center", -- left, center, right for title
          rounded = true,
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): string
        list_opener = "copen",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = true,
  -- },
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy = true,
  -- },
  -- {
  --   "leafgarland/typescript-vim",
  --   lazy = true,
  -- },
  -- {
  --   "maxmellon/vim-jsx-pretty",
  --   lazy = true,
  -- },

  -- Rust support (commented out)
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = true,
  -- },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   lazy = true,
  -- },

  -- Additional plugins to test
  -- {
  --   "folke/snacks.nvim",
  --   lazy = true,
  -- },
})
