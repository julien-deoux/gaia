return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim"
        },
        config = function()
            local telescope = require "telescope"
            telescope.setup()
            telescope.load_extension "fzf"

            local set = vim.keymap.set
            set("n", "<leader>ff", ":Telescope find_files<cr>")
            set("n", "<leader>fs", ":Telescope live_grep<cr>")
            set("n", "<leader>fc", ":Telescope grep_string<cr>")
            set("n", "<leader>fb", ":Telescope buffers<cr>")
            set("n", "<leader>fg", ":Telescope git_files<cr>")
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }
}
