local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "ix" },
        {
            t("import "),
            i(1),
            t(" from './"),
            rep(1),
            t({ "';", "", "export default " }),
            rep(1),
            t(";"),
        }
    ),
    s(
        { trig = "od" },
        {
            t("const { "),
            i(2),
            t(" } = "),
            i(1),
            t(";")
        }
    ),
    s(
        { trig = "i" },
        {
            t("import "),
            i(2),
            t(" from '"),
            i(1),
            t("';"),
        }
    ),
}
