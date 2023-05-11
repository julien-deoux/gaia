local set = vim.keymap.set

-- Move lines up and down
set("n", "<CS-j>", ":m+<cr>==")
set("n", "<CS-k>", ":m-2<cr>==")
set("i", "<CS-j>", "<Esc>:m+<cr>==gi")
set("i", "<CS-k>", "<Esc>:m-2<cr>==gi")
set("v", "<CS-j>", ":m '>+1<cr>gv=gv")
set("v", "<CS-k>", ":m '<-2<cr>gv=gv")

-- Append next line without moving cursor
set("n", "J", "mzJ`Z")

-- Don't copy single character deletion in clipboard
set("n", "x", '"_x')

-- Paste without overriding clipboard
set("x", "<leader>p", '"_dP')

-- Delete without overriding clipboard
set("n", "<leader>d", '"_d')
set("v", "<leader>d", '"_d')

-- Yank to system clipboard
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
