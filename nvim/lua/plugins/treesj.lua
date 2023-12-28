return {
	"Wansmer/treesj",
	keys = {
		"<space>m",
		"<space>j",
		"<space>s",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local lang_utils = require("treesj.langs.utils")

		require("treesj").setup({
			langs = {
				rescript = {
					function_type_parameters = lang_utils.set_preset_for_args(),
					arguments = lang_utils.set_preset_for_args(),
					record_type = lang_utils.set_preset_for_dict(),
					record = lang_utils.set_preset_for_dict(),
				},
			},
		})
	end,
}
