local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
	s({ trig = "gr" }, {
		i(1),
		t({" Groceries", "\texpenses:groceries  "}),
		i(2),
		t({ "€", "\tassets:bank:checking:eur", "", "" }),
	}),
}
