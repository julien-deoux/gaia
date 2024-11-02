local luasnip = require("luasnip")
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"html",
		fmt(
			[[
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{}</title>
  </head>
  <body>
    {}
  </body>
</html>
]],
			{
				i(1),
				i(2),
			}
		)
	),
}
