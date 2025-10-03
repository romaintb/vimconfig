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
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.autoread = true
vim.opt.updatetime = 300

-- Leader key
vim.g.mapleader = ' '

-- Basic keybindings
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('i', '<f1>', '<esc>')
vim.keymap.set('n', '<f1>', '<esc>')
vim.keymap.set('v', '<f1>', '<esc>')
vim.keymap.set('n', '<c-h>', '<c-f>zz')
vim.keymap.set('n', '<c-l>', '<c-b>zz')

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
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- Snacks keybindings are defined in the plugin config

-- LSP keybindings (will be available when LSP attaches)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Plugin configuration with lazy.nvim
require("lazy").setup({
  -- Core dependencies
  { "nvim-lua/plenary.nvim", lazy = false, },
  { "MunifTanjim/nui.nvim",  lazy = false, },

  -- Snacks.nvim - Consolidated utilities
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      indent = {
        enabled = true,
        char = "│",
        blank = " ",
        priority = 1,
        hl = "IblIndent", -- Use a subtle highlight group
      },
      input = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
      lazygit = { enabled = true },
      explorer = { enabled = true },
      terminal = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      rename = { enabled = true },
      dashboard = { enabled = false }, -- Disable if you don't want a dashboard
    },
    keys = {
      { "<leader>lg", function() Snacks.lazygit() end,                                  desc = "LazyGit" },
      { "<leader>tt", function() Snacks.explorer() end,                                 desc = "Toggle Explorer" },
      { "<leader>tf", function() Snacks.explorer({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Explorer (current file)" },
      { "<leader>gb", function() Snacks.git.blame_line() end,                           desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end,                                desc = "Git Browse" },
      { "<leader>gg", function() Snacks.lazygit() end,                                  desc = "LazyGit" },
      { "<leader>.",  function() Snacks.scratch() end,                                  desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end,                           desc = "Select Scratch Buffer" },
      { "<c-/>",      function() Snacks.terminal() end,                                 desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end,                                 desc = "Toggle Terminal (which-key)" },
    },
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
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    },
  },

  -- Text editing enhancements
  {
    "editorconfig/editorconfig-vim",
    event = { "BufReadPost", "BufNewFile" },
  },
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

      require('mini.trailspace').setup()

      require('mini.icons').mock_nvim_web_devicons()
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
      -- Make indent guides more subtle
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#363a4f" })
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#363a4f" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        sections = {
          lualine_b = {}, -- Remove git branch (normally in section b)
          lualine_c = {
            {
              'filename',
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          },
          lualine_x = {}, -- Remove encoding, fileformat
          lualine_y = {}  -- Remove filetype
        }
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "rust_analyzer" },
        automatic_installation = true,
      })

      -- Setup LSP servers using vim.lsp.config
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Add nvim-cmp capabilities if available
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      end

      -- Lua
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      }

      -- TypeScript/JavaScript
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        capabilities = capabilities,
      }

      vim.lsp.config.eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json", ".git" },
        capabilities = capabilities,
      }

      -- Rust
      vim.lsp.config.rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json", ".git" },
        capabilities = capabilities,
      }

      -- Auto-enable LSP servers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "javascript", "javascriptreact", "typescript", "typescriptreact", "rust" },
        callback = function(args)
          vim.lsp.enable("lua_ls")
          vim.lsp.enable("ts_ls")
          vim.lsp.enable("eslint")
          vim.lsp.enable("rust_analyzer")

          -- ESLint auto-fix on save
          if vim.bo[args.buf].filetype:match("javascript") or vim.bo[args.buf].filetype:match("typescript") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.cmd("EslintFixAll")
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "eslint" },
          typescript = { "eslint" },
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
      }

      -- Auto-lint on save and text change
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?`
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
})
