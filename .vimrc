set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/vim-peekaboo'
Plug 'altercation/vim-colors-solarized'
Plug 'jalvesaq/Nvim-R'

" Initialize plugin system
call plug#end()

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
let &showbreak = '> '

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = expand('~/anaconda3/envs/base/bin/python')
let g:deoplete#sources#jedi#enable_typeinfo = 0
" let g:deoplete#sources#jedi#python_path = expand('~/anaconda3/envs/waterboard/bin/python')
" " disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" Python lint
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
call neomake#configure#automake('nrwi', 500)

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Keybinds
imap jj <Esc>
" Fast buffer change
nnoremap gb :ls<CR>:b<Space>
" Placeholder navigation
map <C-j> <Esc>/<++><Enter>vf>c
inoremap <C-j> <Esc>/<++><Enter>vf>c
" Clear search highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>


" Standard settings
syntax on
set number
set relativenumber
set clipboard^=unnamed,unnamedplus  " Cross platform yank to clipboard
set mouse=a
let mapleader=","
set encoding=utf-8
" Fuzzy search
set path+=**
set wildmenu
" Set tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Tab style for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Goyo settings
let g:goyo_width = 120

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 3

" Detect pandoc syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" pandoc syntax config
let g:pandoc#syntax#conceal#use = 0

" GUI and terminal specific settings
syntax on
if has("gui_running")
  color summerfruit256
  let g:airline_theme='minimalist'
else
    set background=light
    " solarized options 
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    colorscheme solarized
    let g:airline_theme='solarized'
endif
highlight Comment cterm=italic

" Tagbar settings
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_iconchars = ['>', '|']
highlight TagbarSignature guifg=Green ctermfg=Green

" Python
let g:ycm_python_interpreter_path = '~/anaconda3/bin/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/global_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/Abios/*']

" Markdown
let g:vim_markdown_folding_disabled = 1
