return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local set = vim.keymap.set
        set("n", "<leader>w", "<cmd>BufferClose<cr>")
        set("n", "<leader>W", "<cmd>BufferRestore<cr>")
        set("n", "<leader>h", "<cmd>BufferPrevious<cr>")
        set("n", "<leader>l", "<cmd>BufferNext<cr>")
        set("n", "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>")
        set("n", "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>")
        set("n", "<leader>bw", "<cmd>BufferCloseAllButCurrentOrPinned<cr>")
        set("n", "<leader>ba", "<cmd>BufferPin<cr>")
    end
}
