require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'lua_ls', 'omnisharp', 'svelte', 'ts_ls', 'gopls', 'templ', 'html', 'clangd' },
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

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
  end,
})

local servers = {
  'svelte',
  'gopls',
  'templ',
  'clangd',
  'zls',
  'astro',
  'tailwindcss',
  'rust_analyzer',
  'graphql',
  'cssls',
}
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp, {
    capabilities = capabilities,
  })
end

-- OmniSharp needs explicit cmd because Mason installs it as "OmniSharp" (PascalCase)
vim.lsp.enable('omnisharp', {
  capabilities = capabilities,
  cmd = { "OmniSharp" },
})

vim.lsp.enable('html', {
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
})

vim.lsp.enable('lua_ls', {
  capabilities = capabilities,
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
})

vim.lsp.enable("denols", {
  capabilities = capabilities,
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
  end,
})

vim.lsp.enable("ts_ls", {
  capabilities = capabilities,
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { "package.json" })
  end,
  single_file_support = false
})
