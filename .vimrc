set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'noahfrederick/vim-noctu.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Standard stuff
imap jj <Esc>
set number
set relativenumber
syntax on
let mapleader=","

" Go to placeholder
nnoremap <C-j> /<lt>++><Enter>vf>c
inoremap <C-j> <Esc>/<lt>++><Enter>vf>c

" Fuzzy search
set path+=**
set wildmenu

" Set tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Tab style for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Airline theme
let g:airline_theme='deus'

" Some latex compiling
nnoremap <Leader>ll :!latexmk -pdf % && pkill -HUP mupdf<Enter><Enter>
nnoremap <Leader>lv :!mupdf  %:r.pdf & <Enter><Enter>

" Color?
" colorscheme noctu

