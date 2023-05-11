return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local set = vim.keymap.set
        local g = vim.g
        set("n", "<leader>e", ":NvimTreeToggle<cr>")
        set("v", "<leader>e", ":NvimTreeToggle<cr>")
        g.loaded = 1
        g.loader_netrwPlugin = 1
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            update_focused_file = {
                enable = true
            }
        })
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}
