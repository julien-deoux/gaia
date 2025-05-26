return {
	"hedyhli/outline.nvim",
	config = function()
		require("outline").setup({
			symbol_folding = {
				autofold_depth = 0,
			},
		})
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>")
	end,
}
