return {
    "L3MON4D3/LuaSnip",
    config = function()
        local luasnip = require "luasnip"
        local set = vim.keymap.set

        set(
            "i",
            "<Tab>",
            function()
                return luasnip.expand_or_jumpable()
                    and "<Plug>luasnip-expand-or-jump"
                    or "<Tab>"
            end,
            { silent = true, expr = true }
        )

        set(
            "i",
            "<S-Tab>",
            function()
                luasnip.jump(-1)
            end,
            { silent = true, noremap = true }
        )
        set(
            "s",
            "<Tab>",
            function()
                luasnip.jump(1)
            end,
            { silent = true, noremap = true }
        )
        set(
            "s",
            "<S-Tab>",
            function()
                luasnip.jump(-1)
            end,
            { silent = true, noremap = true }
        )

        require("luasnip.loaders.from_lua").load({
            paths = "~/.config/nvim/snippets/",
        })
    end
}
