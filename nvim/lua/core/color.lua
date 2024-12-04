local setmode = function(mode)
	vim.opt.background = mode
end

local apply_system_mode = function()
	local output = ""
	if vim.fn.executable("defaults") == 1 then
		output = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
	end
	if vim.fn.executable("kreadconfig5") == 1 then
		output = vim.fn.system({ "kreadconfig5", "--file", "kdeglobals", "--group", "General", "--key", "ColorScheme" })
	end
	if output:find("Dark") then
		setmode("dark")
	else
		setmode("light")
	end
end

vim.api.nvim_create_user_command("ColorsDark", function()
	setmode("dark")
end, { desc = "Set dark mode" })
vim.api.nvim_create_user_command("ColorsLight", function()
	setmode("light")
end, { desc = "Set light mode" })

vim.api.nvim_create_user_command("ColorsApplySystem", apply_system_mode, { desc = "Read system mode" })

vim.keymap.set("n", "<leader>as", apply_system_mode)

pcall(apply_system_mode)
