vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.signatureHelpProvider then
			require('lsp-overloads').setup(client, {
			display_automatically = false,
		      })
		end
	end,
})

