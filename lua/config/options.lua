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
