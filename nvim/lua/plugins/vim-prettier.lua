return {
	"prettier/vim-prettier",
	ft = {
		"html",
		"css",
		"less",
		"sass",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"markdown",
		"json",
		"yaml",
		"svelte",
	},
	build = "yarn install --frozen-lockfile --production",
	config = function()
		vim.g["prettier#autoformat"] = 0
		vim.b.prettier_exec_cmd = "prettierd"
	end,
}
