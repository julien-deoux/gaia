local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "od" },
        {
            t("const { "),
            i(2),
            t(" } = "),
            i(1),
            t(";")
        }
    )
}
