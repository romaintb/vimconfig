-- Remember cursor position (replaces vim-lastplace)
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Better diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Custom diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Directory-based theme switching
local function switch_theme_based_on_cwd()
  local cwd = vim.fn.getcwd()
  if cwd:match('/work/cocoon%-immo%-bis') then
    if vim.g.colors_name ~= 'dracula' then
      vim.cmd.colorscheme('dracula')
      -- Refresh lualine with dracula theme
      pcall(function()
        local config = vim.deepcopy(_G.lualine_config)
        config.options.theme = 'dracula'
        require('lualine').setup(config)
      end)
    end
  else
    if vim.g.colors_name ~= 'catppuccin-macchiato' then
      vim.cmd.colorscheme('catppuccin-macchiato')
      -- Reapply indent guide colors for catppuccin
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#363a4f" })
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#363a4f" })
      -- Refresh lualine with catppuccin theme
      pcall(function()
        local config = vim.deepcopy(_G.lualine_config)
        config.options.theme = 'catppuccin'
        require('lualine').setup(config)
      end)
    end
  end
end

-- Switch theme on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = switch_theme_based_on_cwd,
})

-- Switch theme when changing directories
vim.api.nvim_create_autocmd("DirChanged", {
  callback = switch_theme_based_on_cwd,
})
