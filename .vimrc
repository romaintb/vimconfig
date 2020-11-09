filetype off " required!

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'preservim/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
" this is broken, revert to Ag
Bundle 'mileszs/ack.vim'
Bundle 'ctrlpvim/ctrlp.vim'
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
Bundle 'Quramy/tsuquyomi'
Bundle 'ianks/vim-tsx'
Bundle 'elixir-editors/vim-elixir'
Bundle 'slashmili/alchemist.vim'
Bundle 'mhinz/vim-mix-format'

filetype plugin indent on

let mapleader = "\<Space>"
syntax on

colorscheme nord

set autoindent
set listchars=tab:\.\ ,trail:-
set list
set wildmenu
set wildmode=list:longest,list:full
set ruler
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=80
set scrolloff=5
set nowrap
set mouse=a
set showmatch
set ignorecase
set incsearch
set hlsearch
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=>,l
set whichwrap+=<,h
set nofixendofline

autocmd vimenter * if !argc() | NERDTree | endif
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

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <Leader>o :CtrlP<CR>

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

nnoremap <Leader>a :Ack!<Space>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:airline_section_b = '' " git diff + branch ... too long
let g:airline_section_x = '' " file type, I don't care
let g:airline_section_y = '' " file encoding, I don't care
let g:airline_powerline_fonts=1

" ruby syntax highlighting is slow: https://bit.ly/3baHQnU
"set re=1

let g:mix_format_on_save = 1
