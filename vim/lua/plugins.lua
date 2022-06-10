return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  --use 'vim-airline/vim-airline'
  use 'gcmt/taboo.vim'
  --use 'airblade/vim-gitgutter'
  use 'machakann/vim-highlightedyank'
  use {'dracula/vim', as = 'dracula' }
  use "williamboman/nvim-lsp-installer"
  use 'neovim/nvim-lspconfig'
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'mfussenegger/nvim-dap'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

end)
