return {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require('lspsaga')

        saga.setup({
            move_in_saga = { prev = '<C-k>', next = '<C-j>' },
            finder_action_keys = {
                open = '<cr>',
            },
            definition_action_keys = {
                edit = '<cr>',
            },
        })
    end
}
