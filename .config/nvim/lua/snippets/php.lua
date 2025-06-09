local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("pubf", {
		t("public function "),
		i(1, ""),
		t("()"),
		t(" {"),
		t({ "", "\t" }),
		t({ "", "}" }),
	}),

	s("prif", {
		t("private function "),
		i(1, ""),
		t("()"),
		t(" {"),
		t({ "", "\t" }),
		t({ "", "}" }),
	}),

	s("doc", {
		t({ "/** ", " * " }),
		i(1, ""),
		t({ "", " */" }),
	}),

	s("dd", {
		t("dd("),
		i(1, ""),
		t(");"),
	}),
}
