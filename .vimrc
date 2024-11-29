" git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'nvim-lua/plenary.nvim'
Bundle 'MunifTanjim/nui.nvim'
Bundle 'rcarriga/nvim-notify'
Bundle 'tpope/vim-fugitive'
Bundle 'nvim-telescope/telescope.nvim'
Bundle "nvim-neo-tree/neo-tree.nvim"
" i don' t like this one that much
Bundle 'tpope/vim-commentary'
Bundle 'wincent/terminus'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'farmergreg/vim-lastplace'

" pretty
Bundle 'nanozuki/tabby.nvim'
Bundle 'catppuccin/nvim'
Bundle 'kyazdani42/nvim-web-devicons'
Bundle 'lewis6991/gitsigns.nvim'
Bundle 'nvim-lualine/lualine.nvim'
Bundle 'nvim-treesitter/nvim-treesitter'

" languages support
Bundle 'dense-analysis/ale'
Bundle 'github/copilot.vim'
" Bundle 'leafgarland/typescript-vim'
Bundle 'maxmellon/vim-jsx-pretty'

" rust
Bundle 'neovim/nvim-lspconfig'
Bundle 'simrat39/rust-tools.nvim'

set listchars=tab:\.\ ,trail:- wildmode=list:longest,list:full
set autoindent ruler cursorline expandtab list wildmenu nofixendofline
set tabstop=2 shiftwidth=2 softtabstop=2
set scrolloff=5 nowrap showmatch ignorecase incsearch hlsearch
set mouse=a mousemodel=extend
set whichwrap+=>,l whichwrap+=<,h backspace=2 noshowmode nonu nornu
set termguicolors
" set colorcolumn=120

syntax on
colorscheme catppuccin

let mapleader = "\<Space>"
nnoremap ; :
map <leader>tt :Neotree toggle<cr>
map <leader>tf :Neotree reveal<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
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

lua <<EOF
require('tabby').setup({})
require('gitsigns').setup()
require("neo-tree").setup({
  close_if_last_window = true,
  source_selector = { winbar = true },
  sources = { "filesystem", "buffers", "git_status" },
})

require('lualine').setup {
  options = { theme = 'auto' },
  sections = {
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {}
  },
  inactive_sections = {
    lualine_c = {{'filename', path = 1}}
  }
}

-- rust things
require("rust-tools").setup({})

vim.opt.list = true
EOF

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1

