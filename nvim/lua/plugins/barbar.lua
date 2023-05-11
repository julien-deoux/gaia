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
    end
}
