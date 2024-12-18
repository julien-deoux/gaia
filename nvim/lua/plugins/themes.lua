local g = vim.g
local cmd = vim.cmd

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		config = function()
			g.everforest_background = "hard"
			cmd("colorscheme everforest")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "frappe",
				},
			})
		end,
	},
}
