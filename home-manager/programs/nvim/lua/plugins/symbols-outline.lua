return {
	"simrat39/symbols-outline.nvim",
	config = function()
		require("symbols-outline").setup({
			autofold_depth = 0,
		})
		vim.keymap.set("n", "<leader>o", ":SymbolsOutline<cr>")
	end,
}
