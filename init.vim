set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Plugins
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
"
" Plug 'junegunn/goyo.vim'
Plug 'neomake/neomake'
Plug 'junegunn/vim-peekaboo'
" Plug 'jalvesaq/Nvim-R'
Plug 'jesseleite/vim-noh'
Plug 'jsit/disco.vim'
Plug 'mechatroner/rainbow_csv'
" Neovim 0.5
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'

" Themes
" Plug 'morhetz/gruvbox'
" Plug 'mangeshrex/uwu.vim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'altercation/vim-colors-solarized'
" Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
let &showbreak = '> '

let g:python3_host_prog = expand('~/anaconda3/envs/base/bin/python')
" Python lint
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
call neomake#configure#automake('nrwi', 500)

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
nnoremap <C-n> :NvimTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeQuitOnOpen = 3

" Detect pandoc syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" pandoc syntax config
let g:pandoc#syntax#conceal#use = 0

" GUI and terminal specific settings
syntax on
if has("gui_running")
  colorscheme nord
  let g:airline_theme='minimalist'
else
  " colorscheme nord
  set background=dark
  " let g:airline_theme='minimalist'
  " solarized options 
  " let g:solarized_visibility = "high"
  " let g:solarized_contrast = "high"
  let g:gruvbox_italic = 1
  let ayucolor="mirage"
  colorscheme ayu
  " let g:airline_theme = 'gruvbox'
  " let g:airline_theme='solarized'

  " let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme
endif
highlight Comment cterm=italic

" Markdown
let g:vim_markdown_folding_disabled = 1

" Fugitive
set diffopt+=vertical " Open diff vertically

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1

" Lua
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
end

local servers = { "gopls", "pyright", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require('lualine').setup {
options = {
    theme = 'ayu_mirage',
    -- theme = 'github',
    -- section_separators = '',
    -- component_separators = '',
    -- For round icons (require Nerd-Font)
    -- section_separators = {"", ""},
    -- component_separators = {"", ""},
    -- ... your lualine config
  }
}

-- require("github-theme").setup({
--   themeStyle = "dark",
--   -- ... your github-theme config
-- })
EOF

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

runtime! lang/*.vim

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" COC
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
