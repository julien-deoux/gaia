vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.re" },
	callback = function()
		vim.opt.filetype = "reason"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.hurl" },
	callback = function()
		vim.opt.filetype = "hurl"
	end,
})
