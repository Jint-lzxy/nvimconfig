return function()
	require("lsp_signature").setup({
		zindex = 45, -- avoid conflicts with nvim.cmp
		transparency = 100,
	})
end
