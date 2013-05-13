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
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'

" added this more as a TODO, I need to get those working
Bundle 'vimoutliner/vimoutliner'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wavded/vim-stylus'
Bundle 'kchmck/vim-coffee-script'



Bundle 'Lokaltog/vim-distinguished'


filetype plugin indent on

set background=dark
colorscheme mustang_ro

" gui specific config
if has("gui_running")
    "set gfn=Terminus\ 9
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    nmap <C-V> "+gP
    imap <C-V> <ESC><C-V>i
    vmap <C-C> "+y
    set vb " do you mind shutting your mouth up macvim ?
    "set background=light
    "colorscheme solarized
endif



" some config
syntax on
set number
set nocp
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
"set textwidth=80
set scrolloff=3
set nowrap



" mouse can be used in term :)
set mouse=a

" allow backspacing over everything in insert mode. works on openbsd ??
set backspace=2

" nerdtree plugin
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>
map <F3> <plug>NERDTreeTabsToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
"autocmd VimEnter * wincmd l "go to the file, not nerdtree !!!

" tagbar plugin
let g:tagbar_usearrows = 1
map <F4> :TagbarToggle<CR>

" vim indent guides
let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=235 guibg=#282828
"hi IndentGuidesEven ctermbg=235 guibg=#282828
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
autocmd vimenter * IndentGuidesEnable



let html_use_css=1
let html_no_pre=1
let html_use_xhtml=1
let php_sql_query=1     "Coloration des requetes SQL
let php_htmlInStrings=1 "Coloration des balises html

" Autocompletion
filetype on
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=ccomplete#Complete

au BufRead,BufNewFile *.thtml setfiletype php
au BufRead,BufNewFile *.phtml setfiletype php

" supertab
"let g:SuperTabDefaultCompletionType = "context"





"testing
set virtualedit=onemore
set history=1000
set showmode
set backspace=indent,eol,start
set showmatch
set incsearch
set hlsearch
set wildmenu
set wildmode=list:longest,full
set pastetoggle=<F12>
let mapleader = ','
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-h> <C-W>h<C-W>_
set whichwrap+=>,l
set whichwrap+=<,h


" all of the above : http://stevelosh.com/blog/2010/09/coming-home-to-vim/
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
set relativenumber "seems broken
autocmd WinEnter * set relativenumber
autocmd BufEnter * set relativenumber
set colorcolumn=80
"au FocusLost * :wa
" html : fold tag !!!
nnoremap <leader>ft Vatzf
" split window vertically, and goes to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>a :Ack 



" some cursoline tweak, cursorline only on active buffer, and only color
" cursorline, remove that ugly underscore
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
"hi clear CursorLine
"hi CursorLine ctermbg=238 guibg=#2d2d2d



"nnoremap <leader>t :tabnew 

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0

" sitched to qwerty, this drives me crazy, always hit it by accident
:map Q <Nop>





let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
let g:indent_guides_enable_on_vim_startup = 0

" needed for git gutter
highlight clear SignColumn
