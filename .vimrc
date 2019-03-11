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
Plugin 'arcticicestudio/nord-vim'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'https://github.com/keith/swift.vim.git'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'https://github.com/Valloric/YouCompleteMe'
" Plugin 'lervag/vimtex'
" Plugin 'klen/python-mode'
" Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"

" Standard stuff
imap jj <Esc>
set number
set relativenumber
syntax on
set clipboard=unnamed
set mouse=a
nnoremap gb :ls<CR>:b<Space>
let mapleader=","

" Placeholder navigation
map <C-j> <Esc>/<++><Enter>vf>c
inoremap <C-j> <Esc>/<++><Enter>vf>c

" Shortcuts
map du ^v$yk$i<Space><Esc>pjd2d
    
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
" let g:airline_theme='monokai'

" Detect pandoc syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" GUI and terminal specific settings
syntax on
if has("gui_running")
    " Nord colorscheme settings
    " let g:nord_italic=1
    " let g:nord_italic_comments=1
    " let g:nord_underline=1
    " let g:nord_comment_brightness=12
	" colorscheme nord
    let g:vim_monokai_tasty_italic = 1
    colorscheme vim-monokai-tasty
else
    " let g:nord_comment_brightness=12
	" colorscheme nord
    colorscheme vim-monokai-tasty
    let g:airline_theme='monokai_tasty'
endif

