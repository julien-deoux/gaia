local setmode = function(mode)
	vim.opt.background = mode
end

local apply_system_mode = function()
	local output = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
	if output == "Dark\n" then
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
