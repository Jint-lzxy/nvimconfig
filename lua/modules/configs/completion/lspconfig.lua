return function()
	-- Set up an autocmd to kickstart LSP inlay hints
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("LspInlayHints", { clear = true }),
		callback = function(event)
			if not _G._debugging then
				local inlayhints_enabled = require("core.settings").lsp_inlayhints
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.inlayHintProvider ~= nil then
					vim.lsp.inlay_hint.enable(inlayhints_enabled == true, { bufnr = event.buf })
				end
			end
		end,
	})

	-- Now go ahead and run the usual setup routine
	require("completion.lsp")
end
