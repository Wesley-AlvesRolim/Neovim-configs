local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("typescriptreact", {
	s(
		{ trig = "rfc", name = "React Functional Component" },
		fmt(
			[[
					const {1} = (): JSX.Element => {{
						return (
							{2}
						);
					}};

					export default {3};
				]],
			{
				i(1, "component"),
				i(2, ""),
				rep(1),
			}
		)
	),
})
--
-- require("luasnip.loaders.from_snipmate").load({ path = { "." } })
