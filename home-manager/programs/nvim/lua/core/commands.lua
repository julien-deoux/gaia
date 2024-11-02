local filepath = require("core.filepath")

vim.api.nvim_create_user_command("CopyFilePath", filepath.copy_file_path, { desc = "copy file path" })
