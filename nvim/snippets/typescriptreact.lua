local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "fcp" },
        {
            t({ "import React, { FC } from 'react';", "", "type " }),
            i(1),
            t({ "Props = {", "\t" }),
            i(2),
            t({ "", "}", "", "const " }),
            rep(1),
            t(": FC<"),
            rep(1),
            t("Props> = ({ "),
            i(3),
            t({ " }) => {", "\t" }),
            i(4),
            t({ "", "}", "", "export default " }),
            rep(1),
            t(";")
        }
    ),
    s(
        { trig = "fc" },
        {
            t({ "import React, { FC } from 'react';", "", "const " }),
            i(1),
            t({ ": FC = () => {", "\t" }),
            i(2),
            t({ "", "}", "", "export default " }),
            rep(1),
            t(";")
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
    )
}
