return require('packer').startup(function()
--  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"

  use "hoob3rt/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "junegunn/goyo.vim"
  use "junegunn/vim-peekaboo"
  use "jesseleite/vim-noh"
  use "jsit/disco.vim"
  use "mechatroner/rainbow_csv"

-- Neovim 0.5
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
    }
  use "neovim/nvim-lspconfig"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "glepnir/dashboard-nvim"
  use "lewis6991/gitsigns.nvim"

-- Themes
  use "sainnhe/everforest"
  use "sainnhe/gruvbox-material"
end)
