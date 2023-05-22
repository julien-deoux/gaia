return {
    "MunifTanjim/eslint.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
        require("eslint").setup({
            bin = "eslint_d"
        })
    end
}
