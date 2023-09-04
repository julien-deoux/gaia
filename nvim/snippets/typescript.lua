local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	s("cl", {
		t("console.log("),
		i(1),
		t(");"),
	}),
	s({ trig = "ix" }, {
		t("import "),
		rep(1),
		t(" from './"),
		i(1),
		t({ "';", "", "export default " }),
		rep(1),
		t(";"),
	}),
	s({ trig = "iu" }, {
		t("import _ from 'underscore';"),
	}),
	s({ trig = "uci" }, {
		t("const clientId = useClientId"),
		i(1),
		t("();"),
	}),
	s(
		"gql",
		fmt(
			[[
const {} = /* GraphQL */ `
  type {} {{
    {}
  }}
`;

export default () => [{}];
]],
			{
				i(1),
				rep(1),
				i(2),
				rep(1),
			}
		)
	),
	s({ trig = "ut" }, {
		t("const { t } = useTranslation"),
		i(1),
		t("();"),
	}),
	s(
		"qh",
		fmt(
			[[
import {{ QueryHookOptions, QueryResult, useQuery }} from '@apollo/client';
import gql from 'graphql-tag';

const get{} = gql`
  query get{} {{
    {}
  }}
`;

type Data = {{
  {}
}};

type Variables = {{
  {}
}};

type Input = {{
  {};
  queryOptions?: QueryHookOptions<Data, Variables>;
}};

type Result = QueryResult<Data, Variables> & {{
  {}: {};
}};

function use{}({{ {}, queryOptions = {{}} }}: Input): Result {{
  const query = useQuery<Data, Variables>(get{}, {{
    ...queryOptions,
    variables: {{
      {}
    }},
  }});

  const {} = {};

  return {{ ...query, {} }};
}}

export default use{};
            ]],
			{
				i(1),
				rep(1),
				i(2),
				i(3),
				i(4),
				i(5),
				i(6),
				i(7),
				rep(1),
				i(8),
				rep(1),
				i(9),
				rep(6),
				i(10),
				rep(6),
				rep(1),
			}
		)
	),
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
		t({ ") {", "  " }),
		i(3),
		t({ "", "}" }),
	}),
	s({ trig = "taf" }, {
		t("("),
		i(1),
		t("): "),
		i(2),
		t(" => "),
		i(3),
	}),
	s({ trig = "tfn" }, {
		t("function "),
		i(1),
		t("("),
		i(2),
		t("): "),
		i(3),
		t({ " {", "  " }),
		i(4),
		t({ "", "}" }),
	}),
	s({ trig = "to" }, {
		t("{ "),
		i(2),
		t(" }: "),
		i(1),
	}),
}
