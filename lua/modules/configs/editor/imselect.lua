return function()
	if vim.fn.executable("im-select") == 1 then
		vim.g.im_select_get_im_cmd = "im-select"
		vim.g.im_select_default = "com.apple.keylayout.US"
	end
end
