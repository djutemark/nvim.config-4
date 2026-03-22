require('nvim-treesitter').setup()

-- Install parsers
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  once = true,
  callback = function()
    require('nvim-treesitter.install').ensure_installed({ 'lua', 'go' })
  end,
})

-- Incremental selection
vim.keymap.set('n', '<c-space>', function()
  require('nvim-treesitter.incremental_selection').init()
end)
vim.keymap.set('x', '<c-space>', function()
  require('nvim-treesitter.incremental_selection').node_incremental()
end)
vim.keymap.set('x', '<c-backspace>', function()
  require('nvim-treesitter.incremental_selection').node_decremental()
end)
