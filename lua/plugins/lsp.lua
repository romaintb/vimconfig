return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
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

      -- Auto-enable LSP servers and setup signature help
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "javascript", "javascriptreact", "typescript", "typescriptreact", "rust" },
        callback = function(args)
          vim.lsp.enable("lua_ls")
          vim.lsp.enable("ts_ls")
          vim.lsp.enable("eslint")
          vim.lsp.enable("rust_analyzer")
        end,
      })

      -- Auto-show signature help when typing function parameters
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.api.nvim_create_autocmd({ "CursorHoldI", "InsertEnter" }, {
            buffer = args.buf,
            callback = function()
              local params = vim.lsp.util.make_position_params()
              vim.lsp.buf_request(0, "textDocument/signatureHelp", params, function(err, result, ctx, config)
                if result and result.signatures and #result.signatures > 0 then
                  vim.lsp.handlers["textDocument/signatureHelp"](err, result, ctx, config)
                end
              end)
            end,
          })
        end,
      })
    end,
  },

  -- Formatting
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

  -- Linting
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
}
