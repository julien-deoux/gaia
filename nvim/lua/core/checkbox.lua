local line_contains_checked = function(line)
	return line:find("✓ ")
end

local M = {}

M.toggle = function()
	local bufnr = vim.api.nvim_buf_get_number(0)
	local cursor = vim.api.nvim_win_get_cursor(0)
	local start_line = cursor[1] - 1
	local current_line = vim.api.nvim_buf_get_lines(bufnr, start_line, start_line + 1, false)[1] or ""

	-- If the line contains a checked checkbox then uncheck it.
	-- Otherwise, if it contains an unchecked checkbox, check it.
	local new_line = ""

	if line_contains_checked(current_line) then
		new_line = current_line:gsub("✓ ", "", 1)
	else
		new_line = "✓ " .. current_line
	end

	vim.api.nvim_buf_set_lines(bufnr, start_line, start_line + 1, false, { new_line })
	vim.api.nvim_win_set_cursor(0, cursor)
end

return M
