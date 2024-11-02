local M = {}

M.copy_file_path = function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end

return M
