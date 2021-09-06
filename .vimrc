filetype off " required!

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'preservim/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
" i don' t like this one that much
Bundle 'tpope/vim-commentary'
Bundle 'wincent/terminus'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-endwise'
Bundle 'farmergreg/vim-lastplace'
Bundle 'arcticicestudio/nord-vim'
Bundle 'ryanoasis/vim-devicons'
Bundle 'leafgarland/typescript-vim'
Bundle 'ianks/vim-tsx'
Bundle 'elixir-editors/vim-elixir'

" recently removed
" Bundle 'ctrlpvim/ctrlp.vim'
" Bundle 'mileszs/ack.vim'


" test
Bundle 'w0rp/ale'
Bundle 'neoclide/coc.nvim'
" Bundle 'vimwiki/vimwiki'
Bundle 'junegunn/goyo.vim'
Bundle 'wakatime/vim-wakatime'
Bundle 'nvim-lua/plenary.nvim'
Bundle 'nvim-telescope/telescope.nvim'

filetype plugin indent on

let mapleader = "\<Space>"
syntax on

set termguicolors
colorscheme nord

set listchars=tab:\.\ ,trail:- wildmode=list:longest,list:full
set autoindent ruler cursorline expandtab list wildmenu nofixendofline
set tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=80
set scrolloff=5 mouse=a nowrap showmatch ignorecase incsearch hlsearch rnu
set whichwrap+=>,l whichwrap+=<,h backspace=2

" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeWinSize=45
let NERDTreeIgnore=['^node_modules$', '^deps$', '^_build$', '_buildpack.config$', '^package-lock.json$', '^mix.lock$']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

map <leader>gb :Gblame<cr>
map <leader>gd :Gdiff<cr>
map <leader>tc :tabnew<cr>
nnoremap ; :
nnoremap <Leader>e :e<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:airline_section_b = '' " git diff + branch ... too long
let g:airline_section_x = '' " file type, I don't care
let g:airline_section_y = '' " file encoding, I don't care
let g:airline_powerline_fonts=1

let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 1 " work nicely with coc.nvim
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'elixir': ['mix_format'],
\}
