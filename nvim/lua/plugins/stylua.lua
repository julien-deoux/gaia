return {
	"wesleimp/stylua.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = "lua",
	config = function()
		local stylua = require("stylua")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lua",
			callback = function(opts)
				local augroup = vim.api.nvim_create_augroup("Lua", { clear = true })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = opts.buf,
					callback = function()
						stylua.format()
					end,
				})
			end,
		})
	end,
	build = "cargo install stylua",
}
