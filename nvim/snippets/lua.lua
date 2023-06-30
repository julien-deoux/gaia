local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
    s(
        { trig = "fun" },
        {
            t("function("),
            i(1),
            t({ ")", "\t" }),
            i(2),
            t({ "", "end" })
        }
    )
}
