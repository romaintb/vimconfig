filetype off                   " required!

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'epmatsw/ag.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'easymotion/vim-easymotion'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-endwise'
Bundle 'arcticicestudio/nord-vim'
Bundle 'ryanoasis/vim-devicons'
"Bundle 'leafgarland/typescript-vim'
Bundle 'elixir-editors/vim-elixir'
Bundle 'slashmili/alchemist.vim'
Bundle 'mhinz/vim-mix-format'
" typescript plugin
"Bundle 'Quramy/tsuquyomi'

filetype plugin indent on

let mapleader = "\<Space>"
syntax on

set t_Co=256
set background=dark
colorscheme nord

"set number
"set relativenumber
set nocompatible
set autoindent
set listchars=tab:\.\ ,trail:-
set list
set wildmenu
set wildmode=list:longest,list:full
set laststatus=2
set ruler
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=80
set scrolloff=2
set nowrap
set mouse=a
set showmatch
set ignorecase
set incsearch
set hlsearch
set vb                     "visual bells, no sound !
set clipboard=unnamed
set backspace=2            " allow backspacing over everything in insert mode
set virtualedit=onemore
set history=1000
set whichwrap+=>,l
set whichwrap+=<,h
set shortmess+=I           " oh shut up start message
set nobackup
set noswapfile
set maxmempattern=99999 " some plugins are heavy :(
set nofixendofline
set hidden

" nerdtree plugin
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeMinimalMenu=1
let NERDTreeWinSize=45
let NERDTreeMouseMode=3
let NERDTreeIgnore=['^node_modules$', '^deps$', '^_build$', '_buildpack.config$', '^package-lock.json$', '^mix.lock$']

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <Leader>o :CtrlP<CR>

map <leader>gb :Gblame<cr>
map <leader>tc :tabnew<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap ; :
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <leader>a :Ag!<space>

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
set t_ut=

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:airline_section_b = '' " git diff + branch ... too long
let g:airline_section_x = '' " file type, I don't care
let g:airline_section_y = '' " file encoding, I don't care
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" so, editign a ruby file, syntax hilighting is slow
" and scrolling is really a pain in the ass
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

" auto format elixir files on save
let g:mix_format_on_save = 1
