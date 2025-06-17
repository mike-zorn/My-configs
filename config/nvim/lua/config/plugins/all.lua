return {
  "folke/neoconf.nvim"
  "folke/which-key.nvim",
  "gcmt/taboo.vim",
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "hrsh7th/cmp-vsnip",
  "hrsh7th/nvim-cmp",     -- Autocompletion plugin
  "hrsh7th/vim-vsnip",
  "machakann/vim-highlightedyank",
  "mfussenegger/nvim-dap",
  "neovim/nvim-lspconfig",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",

  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
}
