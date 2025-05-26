-- Handle "project" files
vim.keymap.set("n", "<leader>pv", ":Neotree position=current reveal<CR>") -- vim.cmd.Ex

-- Tabbing in insert mode does what's expected
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("i", "<Tab>", "<C-t>")

-- When in visual mode, J and K move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- <leader>p pastes but don't loses current paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- <leader>y yanks into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Close buffer
vim.keymap.set("n", "<leader>qb", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Close ALL windows
vim.keymap.set("n", "<leader>qq", [[:qa<CR>]])

-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<CR>]], {})

-- C-s saves!
vim.keymap.set("n", "<C-s>", [[:w<CR>]])
vim.keymap.set("n", "<C-S>", [[:wa<CR>]])

-- Restart LSP
vim.keymap.set("n", "<leader>lspr", ":LspRestart<CR>")

-- Quickfix keymaps
local function toggle_quickfix()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

-- Quickfix navigation
vim.keymap.set("n", "<A-l>", ":cnext<CR>")
vim.keymap.set("n", "<A-h>", ":cprev<CR>")
vim.keymap.set("n", "<leader>cc", toggle_quickfix)

-- Space does nothing
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Keymaps for better default experience

