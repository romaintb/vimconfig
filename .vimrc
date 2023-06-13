filetype off " required!

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'nvim-lua/plenary.nvim'
Bundle 'tpope/vim-fugitive'
Bundle 'nvim-telescope/telescope.nvim'
Bundle 'akinsho/bufferline.nvim'
Bundle 'kyazdani42/nvim-tree.lua'
" i don' t like this one that much
Bundle 'tpope/vim-commentary'
Bundle 'wincent/terminus'
Bundle 'lewis6991/gitsigns.nvim'
Bundle 'nvim-lualine/lualine.nvim'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'farmergreg/vim-lastplace'
Bundle 'kyazdani42/nvim-web-devicons'

" themes
Bundle 'arcticicestudio/nord-vim'

" languages support
Bundle 'leafgarland/typescript-vim'
Bundle 'maxmellon/vim-jsx-pretty'
" Bundle 'sheerun/vim-polyglot'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'evanleck/vim-svelte'

" test
Bundle 'w0rp/ale'
Bundle 'neoclide/coc.nvim'
" Bundle 'junegunn/goyo.vim'
Bundle 'nvim-neorg/neorg'

filetype plugin indent on

let mapleader = "\<Space>"
syntax on

set termguicolors
colorscheme nord

set listchars=tab:\.\ ,trail:- wildmode=list:longest,list:full
set autoindent ruler cursorline expandtab list wildmenu nofixendofline
set tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=80
set scrolloff=5 mouse=a nowrap showmatch ignorecase incsearch hlsearch
set whichwrap+=>,l whichwrap+=<,h backspace=2 noshowmode nonu nornu

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
require('nvim-tree').setup {
  auto_reload_on_write = true,
  filters = { custom = { '.git', 'node_modules', '.cache', '.DS_Store' } },
  renderer = {
    indent_markers = { enable = true, },
    icons = {
      show = { file = true, folder = true, folder_arrow = false, },
    },
  },
  view = { width = 50 }
}
require('gitsigns').setup()
require('lualine').setup {
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_x = {}
  }
}
require("bufferline").setup {
  options = {
    mode = 'tabs',
    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
      }
      }
    }
  }
EOF

let g:ale_fix_on_save = 0
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 1 " work nicely with coc.nvim
