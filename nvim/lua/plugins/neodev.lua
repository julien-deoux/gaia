return {
	"folke/neodev.nvim",
	config = function()
		local neodev = require("neodev")
		neodev.setup({
			override = function(root_dir, library)
				if root_dir:find("gaia", 1, true) == 1 then
					library.enabled = true
					library.plugins = true
				end
			end,
		})
	end,
}
