local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

return {
	s("cl", {
		t("console.log("),
		i(1),
		t(");"),
	}),
	s({ trig = "iu" }, {
		t("import _ from 'underscore';"),
	}),
	s({ trig = "uci" }, {
		t("const clientId = useClientId"),
		i(1),
		t("();"),
	}),
	s({ trig = "ut" }, {
		t("const { t } = useTranslation"),
		i(1),
		t("();"),
	}),
	s({ trig = "od" }, {
		t("const { "),
		i(2),
		t(" } = "),
		i(1),
		t(";"),
	}),
	s({ trig = "ad" }, {
		t("const [ "),
		i(2),
		t(" ] = "),
		i(1),
		t(";"),
	}),
	s({ trig = "i" }, {
		t("import "),
		i(2),
		t(" from '"),
		i(1),
		t("';"),
	}),
	s({ trig = "af" }, {
		t("("),
		i(1),
		t(") => "),
		i(2),
	}),
	s({ trig = "fn" }, {
		t("function "),
		i(1),
		t("("),
		i(2),
		t({ ") {", "\t" }),
		i(3),
		t({ "", "}" }),
	}),
}
