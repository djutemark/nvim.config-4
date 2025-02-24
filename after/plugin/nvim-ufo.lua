-- From nvim-ufo README
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
local ufo = require('ufo')
ufo.setup();

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

vim.keymap.set('n', '<C-j>', 'zo')
vim.keymap.set('n', '<C-k>', 'za')
vim.keymap.set('n', '<A-j>', ufo.openAllFolds)
vim.keymap.set('n', '<A-k>', ufo.closeAllFolds)

