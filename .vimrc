filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mhinz/vim-signify'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'molok/vim-smartusline'

" added this more as a TODO, I need to get those working
"Bundle 'vimoutliner/vimoutliner'
"Bundle 'scrooloose/syntastic'
"Bundle 'very-geek/matchit.vim'

Bundle 'chriskempson/base16-vim'



filetype plugin indent on




let mapleader = "\<Space>"
"runtime macros/matchit.vim " use % to jump between start/end of methods
syntax on

let base16colorspace=256
set background=dark
colorscheme base16-default

"set number
"set relativenumber
set nocompatible
set autoindent
"set listchars=tab:\.\ ,trail:-
"set list
set wildmenu
set wildmode=list:longest,list:full
set laststatus=2
set ruler
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set ttymouse=sgr " after 220 chars, no mouse ... fix that

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P "smartusline needs this

" nerdtree plugin
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
"let NERDTreeDirArrows=0

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nnoremap <Leader>o :CtrlP<CR>

" map git commands
map <leader>gb :Gblame<cr>
map <leader>gl :!clear && git log -p %<cr>
map <leader>gd :!clear && git diff %<cr>

map <leader>cc :CoffeeCompiler vert

map <leader>tc :tabnew<cr>
map <leader>tq :tabclose<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap ; :
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <leader>a :Ag!<space>

" needed for git gutter
highlight clear SignColumn
