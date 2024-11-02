return {
    "szw/vim-maximizer",
    config = function()
        local set = vim.keymap.set
        set("n", "<leader>z", ":MaximizerToggle<cr>")
    end
}
