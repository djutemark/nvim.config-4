vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("djutemark.plugins")
require("djutemark.lsp")
require("djutemark.remap")

-- Make line numbers default
vim.wo.number = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't wrap lines
vim.opt.wrap = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Other
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Keymaps for better default experience

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 16

-- Set highlight on search
vim.o.hlsearch = false

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

