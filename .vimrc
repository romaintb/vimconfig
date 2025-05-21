" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'nvim-lua/plenary.nvim'
Bundle 'MunifTanjim/nui.nvim'
Bundle 'rcarriga/nvim-notify'
Bundle 'tpope/vim-fugitive'
Bundle 'kdheepak/lazygit.nvim'
Bundle 'nvim-telescope/telescope.nvim'
Bundle "nvim-neo-tree/neo-tree.nvim"
" i don' t like this one that much
Bundle 'tpope/vim-commentary'
Bundle 'wincent/terminus'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'farmergreg/vim-lastplace'

Bundle 'echasnovski/mini.nvim'
Bundle 'nvim-treesitter/nvim-treesitter'

" pretty
Bundle 'nanozuki/tabby.nvim'
Bundle 'catppuccin/nvim'

" languages support
Bundle 'dense-analysis/ale'
Bundle 'github/copilot.vim'
" Bundle 'Exafunction/codeium.vim'
" Bundle 'leafgarland/typescript-vim'
Bundle 'maxmellon/vim-jsx-pretty'

" rust
" Bundle 'neovim/nvim-lspconfig'
" Bundle 'simrat39/rust-tools.nvim'

" obsidian and deps
Bundle 'hrsh7th/nvim-cmp'
Bundle 'obsidian-nvim/obsidian.nvim'

" see if we care about those
Bundle 'folke/zen-mode.nvim'

" please roro test this
Bundle 'folke/snacks.nvim'

set listchars=tab:\.\ ,trail:- wildmode=list:longest,list:full
set autoindent ruler cursorline expandtab list wildmenu nofixendofline
set tabstop=2 shiftwidth=2 softtabstop=2
set scrolloff=5 nowrap showmatch ignorecase incsearch hlsearch
set mouse=a mousemodel=extend
set whichwrap+=>,l whichwrap+=<,h backspace=2 noshowmode
set nonu nornu
set termguicolors
" set colorcolumn=120
set conceallevel=2

syntax on
colorscheme catppuccin

autocmd FileType markdown setlocal cc=80

let mapleader = "\<Space>"
nnoremap ; :
map <leader>tt :Neotree toggle<cr>
map <leader>tf :Neotree reveal<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>lg :LazyGit<CR>
map <leader>gb :Git blame<cr>
map <leader>tc :tabnew<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
nnoremap <leader>e :e<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :qa<cr>
map Q <nop>
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-l> :wincmd l<cr>

" obsidian
map <leader>oo :ObsidianQuickSwitch<cr>
map <leader>ot :ObsidianToday<cr>

lua <<EOF
require('tabby').setup({})
-- require('gitsigns').setup()
require("neo-tree").setup({
  close_if_last_window = true,
  source_selector = { winbar = true },
  sources = { "filesystem", "buffers", "git_status" },
})

-- mini plugins
require('mini.ai').setup()
require('mini.diff').setup({ view = { signs = { add = '┃', change = '┃', delete = '┃' }, }, })
require('mini.git').setup()
require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.trailspace').setup()
MiniIcons.mock_nvim_web_devicons()
MiniStatusline.section_git = function(args) return '' end
MiniStatusline.section_fileinfo = function(args) return '' end

vim.opt.list = true

require('obsidian').setup({
  workspaces = {
    { name = 'second brain', path = '~/work/secondbrain' }
  }
})
EOF

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1

