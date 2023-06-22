return {
    "phelipetls/jsonpath.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        local copy_json_path = function()
            vim.fn.setreg("", require("jsonpath").get())
        end
        vim.api.nvim_create_user_command(
            'CopyJsonPath',
            copy_json_path,
            { desc = "copy json path" }
        )
    end
}
