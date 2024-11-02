return {
    "tpope/vim-fugitive",
    config = function()
        local set = vim.keymap.set
        set("n", "<leader>gs", vim.cmd.Git)
        set("n", "g ", ":Git ")
    end
}
