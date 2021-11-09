filetype off " required!

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
Bundle 'airblade/vim-gitgutter'
" Bundle 'itchyny/lightline.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-endwise'
Bundle 'jiangmiao/auto-pairs'
Bundle 'farmergreg/vim-lastplace'
Bundle 'kyazdani42/nvim-web-devicons'

" themes
Bundle 'arcticicestudio/nord-vim'

" languages support
Bundle 'leafgarland/typescript-vim'
Bundle 'ianks/vim-tsx'
Bundle 'elixir-editors/vim-elixir'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'

" test
Bundle 'w0rp/ale'
Bundle 'neoclide/coc.nvim'
Bundle 'junegunn/goyo.vim'
Bundle 'wakatime/vim-wakatime'
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
map <leader>gd :Git diff<cr>
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

let g:lightline = { 'colorscheme': 'one' }
let g:airline_section_b = '' " git diff + branch ... too long
let g:airline_section_x = '' " file type, I don't care
let g:airline_section_y = '' " file encoding, I don't care
" let g:airline_section_z = '' " too much info, but some is useful
let g:airline_powerline_fonts=1

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.DS_Store' ]
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }

lua <<EOF
require("nvim-tree").setup {
  auto_close = true,
  view = {
    width = 50
  }
}
EOF

let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 1 " work nicely with coc.nvim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'elixir': ['mix_format'],
\}
