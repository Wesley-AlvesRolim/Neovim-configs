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
					const {a} = (): JSX.Element => {{
						return (
							{b}
						);
					}};

					export default {c} ;
				]],
      {
        a = i(1, "Component"),
        b = i(2, ""),
        c = rep("a"),
      }
    )
  ),
})

ls.add_snippets("markdown", {
  s(
    { trig = "link", name = "Link" },
    fmt("[{1}]({2})", {
      i(1, "link name"),
      i(2, "url"),
    })
  ),
})
--
-- require("luasnip.loaders.from_snipmate").load({ path = { "." } })
