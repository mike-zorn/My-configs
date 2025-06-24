-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
-- vim.opt_global.shortmess:remove("F"):append("c")
vim.opt.showmode = false
vim.opt.compatible = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ts = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = false
vim.opt.inccommand = "split"

-- see :h fo-table
vim.opt.tw = 79
vim.opt.formatoptions = "tcroqn1"
-- Enable spell checking
vim.opt.spelllang = "en_us"
vim.opt.spellfile = "~/.vim/en.utf-8.add"

-- syntax enable
vim.opt.background = "dark"
vim.opt.ruler = true
vim.opt.grepprg = "grep -nH $*"

vim.opt.mouse = "a"

require("config.lazy")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.g.neovide then
  vim.g.neovide_input_use_logo = true
  vim.o.guifont = "Berkeley Mono,Symbols Nerd Font Mono:h18"
  vim.cmd([[ colorscheme dracula ]])
end

map('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files({ hidden = true })<cr>')
map('t', '<C-p>', '<cmd>lua require(\'telescope.builtin\').find_files({ hidden = true })<cr>')
map('n', '<leader>gg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
map('n', '<leader>gp', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>')
map('i', '<D-v>', '<Esc>"+pi')
map('t', '<D-v>', '<c-\\><c-n>"+pi')
map('v', '<D-c>', '"+y')
map('n', '<leader>n', '<cmd>lua require(\'nvim-tree.api\').tree.open()<cr>')

map('n', '<C-w>tv', ':vsp term://fish<cr>')
map('n', '<C-w>ts', ':sp term://fish<cr>')

-- LSP mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua require(\'telescope.builtin\').lsp_implementations()<CR>")
map("n", "gr", "<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>")
map("n", "gds", "<cmd>lua require(\'telescope.builtin\').lsp_document_symbol()<CR>")
map("n", "gws", "<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbol()<CR>")
map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]])                 -- all workspace diagnostics
map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
--map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
map('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
require("mason").setup {
  automatic_installation = true
}

-- init neoconf before lspconfig so that it can override global settings
require("neoconf").setup({
  import = {
    vscode = false
  }
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = { 'lua_ls', 'terraformls', 'ts_ls', 'pylsp', 'gopls', 'buildifier' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
  }
end

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    --['<Tab>'] = cmp.mapping(function(fallback)
    --  if cmp.visible() then
    --    cmp.select_next_item()
    --  -- else
    --  --   local copilot_keys = vim.fn["copilot#Accept"]()
    --  --   if copilot_keys ~= "" then
    --  --     vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --  --   else
    --  --     fallback()
    --  --   end
    --  end
    --end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = "copilot", group_index = 2 },
  },
}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
    },
  },
})


vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "COMMIT_EDITMSG", "*.md" },
  command = "setlocal spell"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "COMMIT_EDITMSG", "*.md", "git-rebase-todo" },
  command = "set bufhidden=delete"
})

-- move windows within terminal emulator
vim.api.nvim_set_keymap(
  "t",
  "<C-w>h",
  "<C-\\><C-n><C-w>h",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "t",
  "<C-w>j",
  "<C-\\><C-n><C-w>j",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "t",
  "<C-w>k",
  "<C-\\><C-n><C-w>k",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "t",
  "<C-w>l",
  "<C-\\><C-n><C-w>l",
  { noremap = true }
)

-- TODO
-- "" more scrollback in term emu
-- let g:terminal_scrollback_buffer_size = 100000


-- terraform
require 'lspconfig'.terraformls.setup {}
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function() vim.lsp.buf.format() end,
})
