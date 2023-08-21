return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>rq", "<Plug>RestNvim<cr>")
	end,
}
