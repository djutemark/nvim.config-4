local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>pp", builtin.git_files, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)

