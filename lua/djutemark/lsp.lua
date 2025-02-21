require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 'lua_ls', 'omnisharp', 'svelte', 'ts_ls', 'gopls', 'templ', 'html', 'clangd' },
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

  vim.keymap.set("n", "<leader>ff", function()
    if vim.bo.filetype == "templ" then
      local cf_bufnr = vim.api.nvim_get_current_buf()
      local filename = vim.api.nvim_buf_get_name(cf_bufnr)
      local cmd = "templ fmt " .. vim.fn.shellescape(filename)

      vim.fn.jobstart(cmd, {
        on_exit = function()
          -- Reload the buffer only if it's still the current buffer
          if vim.api.nvim_get_current_buf() == cf_bufnr then
            vim.cmd('e!')
          end
        end,
      })
    else
      vim.lsp.buf.format()
    end
  end, { buffer = bufnr, remap = false })
end

local servers = { 'omnisharp', 'svelte', 'ts_ls', 'gopls', 'templ', 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
})

lspconfig['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        enable = true,
        globals = {
          'vim',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
