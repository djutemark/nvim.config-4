require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
end

local servers = { }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

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
