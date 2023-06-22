return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics


        null_ls.setup({
            sources = {
                formatting.prettierd,
                diagnostics.eslint_d,
            },


            on_attach = function(client, buffer)
                require("util.format").format_on_write(client, buffer)
            end,
        })
    end
}
