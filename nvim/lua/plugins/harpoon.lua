return {
	"ThePrimeagen/harpoon",
	keys = {
		"<leader>a",
		"<leader>fm",
	},
	config = function()
		local set = vim.keymap.set
		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 20,
			},
		})
		set("n", "<leader>a", function()
			require("harpoon.mark").add_file()
		end)
		set("n", "<leader>fm", function()
			require("harpoon.ui").toggle_quick_menu()
		end)
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
