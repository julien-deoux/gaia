local luasnip = require "luasnip"
local s = luasnip.snippet
local t = luasnip.text_node

return {
    s(
        { trig = "ic" },
        { t("@import 'src/less/colors';") }
    ),
}
