require('neo-tree').setup({
  filesystem = {
    hijack_netrw_behavior = "open_current",
    bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    cwd_target = {
      sidebar = "tab",   -- sidebar is when position = left or right
      current = "window" -- current is when position = current
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
	-- do something, the value of arg varies by event.
	vim.opt.relativenumber = true
	vim.keymap.set({ 'n', 'x' }, 'Q', '<Plug>(leap)')
      end,
      -- id = "optional unique id, only meaningful if you want to unsubscribe later"
    },
  },
  window = {
    mappings = {
      ["<C-v>"] = "open_vsplit",
      ["s"] = "",
    },
  },
})

