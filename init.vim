set runtimepath^=~/.vim,~/.vim/after,~/.local/share/nvim/site/pack
let &packpath = &runtimepath

lua << EOF
require('plugins')

-- Line wrapping indicator
vim.o.showbreak = "↳ "
-- Cross platform yank to clipboard
vim.g.clipboard = {'unnamed', 'unnamedplus'}
vim.wo.number = true
vim.o.mouse = 'a'

------------------------
-- Key bindings 
------------------------

vim.g.mapleader = ','

-- Simple function to map keymap, non-recursive way
local function map_key(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

map_key('i', 'jj', '<Esc>')
map_key('n', 'gb', ':ls<CR>:b<Space>') -- Fast buffer change

-- UNUSED SINCE FZF
-- Fuzzy search for files
-- vim.o.path = vim.o.path..',**'
-- vim.o.wildmenu = true

-- Placeholder navigation
-- map <C-j> <Esc>/<++><Enter>vf>c
-- inoremap <C-j> <Esc>/<++><Enter>vf>c

-- Tabs vs spaces?
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smarttab = true

EOF

" Standard settings
" set number
" set relativenumber
" set clipboard^=unnamed,unnamedplus  " Cross platform yank to clipboard
" set mouse=a
" Fuzzy search
" set path+=**
" set wildmenu
" Set tabs
" set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

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

set background=dark

" solarized options 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"

" everforest
let g:everforest_enable_italic = 1
let g:everforest_background = 'hard'

" gruvbox-material
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1

" ayu
let ayucolor="mirage"

colorscheme everforest

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
require'nvim-tree'.setup()

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
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
end

local servers = { "gopls", "pyright", "rust_analyzer", "eslint" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require('lualine').setup {
options = {
    -- theme = 'ayu_mirage',
    theme = 'everforest',
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
nnoremap <leader>fb <cmd>lua require'telescope.builtin'.buffers{ show_all_buffers = true }<cr>
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
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" Dashboard
let g:dashboard_default_executive = 'telescope'
let g:dashboard_preview_command = 'cat'
let g:dashboard_preview_pipeline = 'lolcat'
let g:dashboard_preview_file = '~/.config/nvim/nvim_logo.cat'
let g:dashboard_preview_file_height = 11
let g:dashboard_preview_file_width = 80
