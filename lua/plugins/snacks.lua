return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
      size = 1024 * 1024, -- 1MB threshold
      setup = function(ctx)
        vim.b.minianimate_disable = true
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ctx.ft
        end)
      end,
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    indent = {
      enabled = true,
      char = "│",
      blank = " ",
      priority = 1,
      hl = "IblIndent",
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
    picker = { enabled = true },
    toggle = { enabled = true },
  },
  keys = {
    -- File pickers
    { "<leader>ff", function() Snacks.picker.files() end,                                              desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                               desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                            desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                             desc = "Recent Files" },
    { "<leader>:",  function() Snacks.picker.command_history() end,                                    desc = "Command History" },
    { "<leader>/",  function() Snacks.picker.grep_buffers() end,                                       desc = "Grep Buffers" },

    -- Git
    { "<leader>lg", function() Snacks.lazygit() end,                                                   desc = "LazyGit" },
    { "<leader>gg", function() Snacks.lazygit() end,                                                   desc = "LazyGit" },
    { "<leader>gb", function() Snacks.git.blame_line() end,                                            desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                                 desc = "Git Browse" },
    { "<leader>gc", function() Snacks.picker.git_log() end,                                            desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                                         desc = "Git Status" },

    -- Explorer
    { "<leader>tt", function() Snacks.explorer() end,                                                  desc = "Toggle Explorer" },
    { "<leader>tf", function() Snacks.explorer({ cwd = vim.fn.expand("%:p:h") }) end,                  desc = "Explorer (current file)" },

    -- Toggles
    { "<leader>ud", function() Snacks.toggle.diagnostics():toggle() end,                               desc = "Toggle Diagnostics" },
    { "<leader>ul", function() Snacks.toggle.option("number", { name = "Line Numbers" }):toggle() end, desc = "Toggle Line Numbers" },
    { "<leader>us", function() Snacks.toggle.option("spell", { name = "Spelling" }):toggle() end,      desc = "Toggle Spelling" },
    { "<leader>uw", function() Snacks.toggle.option("wrap", { name = "Wrap" }):toggle() end,           desc = "Toggle Wrap" },
    { "<leader>ui", function() Snacks.toggle.indent():toggle() end,                                    desc = "Toggle Indent Guides" },

    -- Utilities
    { "<leader>.",  function() Snacks.scratch() end,                                                   desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                            desc = "Select Scratch Buffer" },
    { "<c-/>",      function() Snacks.terminal() end,                                                  desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end,                                                  desc = "Toggle Terminal (which-key)" },
  },
}
