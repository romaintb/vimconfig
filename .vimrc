filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
"Bundle 'mileszs/ack.vim'
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdcommenter'
Bundle 'airblade/vim-gitgutter'

" added this more as a TODO, I need to get those working
Bundle 'vimoutliner/vimoutliner'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'very-geek/matchit.vim'

Bundle 'chriskempson/base16-vim'



filetype plugin indent on

let base16colorspace=256
set background=dark
"colorscheme mustang_ro
colorscheme base16-tomorrow

" gui specific config
if has("gui_running")
    "set gfn=Terminus\ 9
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r

    "linux/bsd copy/paste, not needed with the clipboard=unnamed
    nmap <C-V> "+gP
    imap <C-V> <ESC><C-V>i
    vmap <C-C> "+y
endif



" some config
let mapleader = ','
runtime macros/matchit.vim " use % to jump between start/end of methods
syntax on

set relativenumber
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
"set clipboard=unnamed
set backspace=2            " allow backspacing over everything in insert mode
set virtualedit=onemore
set history=1000
set whichwrap+=>,l
set whichwrap+=<,h


"set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l/%L,%c,%p%%]
set statusline=%2*[%n%H%M%R%W]%*
set statusline+=%1*%y%*%*\ %f%m%r%h%w
set statusline+=%=
set statusline+=%l/%L,%c,%p%%
" highlight the status bar when in insert mode
if version >= 700
    "TODO: this is uggly right now
    au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
    au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif


au BufRead,BufNewFile *.thtml setfiletype php
au BufRead,BufNewFile *.phtml setfiletype php


" nerdtree plugin
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1

" tagbar plugin
let g:tagbar_usearrows = 1
map <F4> :TagbarToggle<CR>

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

map <leader>t :tabnew<cr>

map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-h> <C-W>h<C-W>_
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" html : fold tag !!!
nnoremap <leader>ft Vatzf

map <leader>a :Ag!<space>




" needed for git gutter
highlight clear SignColumn

let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

"let g:indentLine_char = '|'
