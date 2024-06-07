" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'nvim-lua/plenary.nvim'
Bundle 'tpope/vim-fugitive'
Bundle 'nvim-telescope/telescope.nvim'
Bundle 'kyazdani42/nvim-tree.lua'
" i don' t like this one that much
Bundle 'tpope/vim-commentary'
Bundle 'wincent/terminus'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'farmergreg/vim-lastplace'

" pretty
" Bundle 'akinsho/bufferline.nvim'
Bundle 'nanozuki/tabby.nvim'
Bundle 'arcticicestudio/nord-vim'
Bundle 'EdenEast/nightfox.nvim'
Bundle 'catppuccin/nvim'
Bundle 'kyazdani42/nvim-web-devicons'
Bundle 'lewis6991/gitsigns.nvim'
Bundle 'nvim-lualine/lualine.nvim'
Bundle 'nvim-treesitter/nvim-treesitter'

" languages support
Bundle 'dense-analysis/ale'
Bundle 'github/copilot.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'maxmellon/vim-jsx-pretty'
" Bundle 'kchmck/vim-coffee-script'

set listchars=tab:\.\ ,trail:- wildmode=list:longest,list:full
set autoindent ruler cursorline expandtab list wildmenu nofixendofline
set tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=120
set scrolloff=5 mouse=a nowrap showmatch ignorecase incsearch hlsearch
set whichwrap+=>,l whichwrap+=<,h backspace=2 noshowmode nonu nornu
set termguicolors

syntax on
" colorscheme nord
colorscheme catppuccin
" colorscheme nordfox

let mapleader = "\<Space>"
map <Leader>tt :NvimTreeToggle<CR>
map <Leader>tf :NvimTreeFindFile<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
map <leader>gb :Git blame<cr>
map <leader>tc :tabnew<cr>
nnoremap ; :
nnoremap <Leader>e :e<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>
map Q <Nop>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

lua <<EOF
require('gitsigns').setup()
require('nvim-tree').setup {
  auto_reload_on_write = true,
  filters = { custom = { '.git', 'node_modules', '.cache', '.DS_Store' } },
  renderer = {
    indent_markers = { enable = true, },
    icons = { show = { file = true, folder = true, folder_arrow = false, }, },
  },
  view = { width = 50 }
}
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
require('tabby').setup({})

vim.opt.list = true
EOF

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1

