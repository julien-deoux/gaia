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
            set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
            set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
            set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
            set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
            set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
            set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
            set("n", "<leader>fr", "<cmd>Telescope resume<cr>")
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }
}
