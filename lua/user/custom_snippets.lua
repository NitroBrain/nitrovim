local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- HTML
ls.add_snippets("html", {
  s("base", {
    t({ "<!DOCTYPE html>", "<html lang=\"en\">", "<head>", "    <meta charset=\"UTF-8\">", "    <title>" }),
    i(1, "Title"),
    t({ "</title>", "</head>", "<body>", "" }),
    i(2, "Content"),
    t({ "", "</body>", "</html>" }),
  }),

  -- Extends
  s("extends", {
    t("{% extends '"), i(1, "base.html"), t("' %}"),
  }),

  -- Block
  s("block", {
    t("{% block "), i(1, "block_name"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endblock " }), i(3, "block_name"), t(" %}"),
  }),

  -- URL tag
  s("url", {
    t("{% url '"), i(1, "view_name"), t("' %}"),
  }),

  -- Static files
  s("static", {
    t("{% static '"), i(1, "path/to/file"), t("' %}"),
  }),

  -- Load static
  s("loadstatic", {
    t("{% load static %}"),
  }),

  -- If condition
  s("if", {
    t("{% if "), i(1, "condition"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endif %}" }),
  }),

  -- If-Else
  s("ifelse", {
    t("{% if "), i(1, "condition"), t(" %}"),
    t({ "", "" }),
    i(2, "Content if true"),
    t({ "", "{% else %}", "" }),
    i(3, "Content if false"),
    t({ "", "{% endif %}" }),
  }),

  -- For loop
  s("for", {
    t("{% for "), i(1, "item in list"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endfor %}" }),
  }),

  -- Comment
  s("comment", {
    t("{# "), i(1, "Comment"), t(" #}"),
  }),

  -- Include template
  s("include", {
    t("{% include '"), i(1, "template.html"), t("' %}"),
  }),

  -- With statement
  s("with", {
    t("{% with "), i(1, "var=value"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endwith %}" }),
  }),

  -- Autoescape
  s("autoescape", {
    t("{% autoescape "), i(1, "on/off"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endautoescape %}" }),
  }),

  -- csrf token
  s("csrf", {
    t("{% csrf_token %}"),
  }),

  -- Filter example
  s("filter", {
    t("{{ "), i(1, "variable"), t(" | "), i(2, "filter_name"), t(" }}"),
  }),
})

-- Django
ls.add_snippets("djangohtml", {
  s("base", {
    t({ "<!DOCTYPE html>", "<html lang=\"en\">", "<head>", "    <meta charset=\"UTF-8\">", "    <title>" }),
    i(1, "Title"),
    t({ "</title>", "</head>", "<body>", "" }),
    i(2, "Content"),
    t({ "", "</body>", "</html>" }),
  }),

  -- Extends
  s("extends", {
    t("{% extends '"), i(1, "base.html"), t("' %}"),
  }),

  -- Block
  s("block", {
    t("{% block "), i(1, "block_name"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endblock " }), i(3, "block_name"), t(" %}"),
  }),

  -- URL tag
  s("url", {
    t("{% url '"), i(1, "view_name"), t("' %}"),
  }),

  -- Static files
  s("static", {
    t("{% static '"), i(1, "path/to/file"), t("' %}"),
  }),

  -- Load static
  s("loadstatic", {
    t("{% load static %}"),
  }),

  -- If condition
  s("if", {
    t("{% if "), i(1, "condition"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endif %}" }),
  }),

  -- If-Else
  s("ifelse", {
    t("{% if "), i(1, "condition"), t(" %}"),
    t({ "", "" }),
    i(2, "Content if true"),
    t({ "", "{% else %}", "" }),
    i(3, "Content if false"),
    t({ "", "{% endif %}" }),
  }),

  -- For loop
  s("for", {
    t("{% for "), i(1, "item in list"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endfor %}" }),
  }),

  -- Comment
  s("comment", {
    t("{# "), i(1, "Comment"), t(" #}"),
  }),

  -- Include template
  s("include", {
    t("{% include '"), i(1, "template.html"), t("' %}"),
  }),

  -- With statement
  s("with", {
    t("{% with "), i(1, "var=value"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endwith %}" }),
  }),

  -- Autoescape
  s("autoescape", {
    t("{% autoescape "), i(1, "on/off"), t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endautoescape %}" }),
  }),

  -- csrf token
  s("csrf", {
    t("{% csrf_token %}"),
  }),

  -- Filter example
  s("filter", {
    t("{{ "), i(1, "variable"), t(" | "), i(2, "filter_name"), t(" }}"),
  }),
})

-- JSX
ls.add_snippets("javascriptreact", {
  s("rfc", fmt([[
    import React from 'react';

    const {} = () => {{
      return (
        <>
          {}
        </>
      );
    }};

    export default {};
  ]], { i(1, "ComponentName"), i(2, "// content"), i(1) })),
})

-- TSX
ls.add_snippets("typescriptreact", {
  s("rfc", fmt([[
    import React from 'react';

    interface {}Props {{}}

    const {}: React.FC<{}Props> = () => {{
      return (
        <>
          {}
        </>
      );
    }};

    export default {};
  ]], { i(1, "ComponentName"), i(1), i(1), i(2, "// content"), i(1) })),
})

-- Python
ls.add_snippets("python", {
  -- Function definition
  s("def", fmt([[
    def {}({}):
        {}
  ]], { i(1, "func_name"), i(2, "args"), i(3, "pass") })),

  -- Class definition with init
  s("class", fmt([[
    class {}:
        def __init__(self, {}):
            {}
  ]], { i(1, "ClassName"), i(2, "args"), i(3, "pass") })),

  -- If __name__ == '__main__':
  s("main", fmt([[
    if __name__ == "__main__":
        {}
  ]], { i(1, "main()") })),

  -- For loop
  s("for", fmt([[
    for {} in {}:
        {}
  ]], { i(1, "item"), i(2, "iterable"), i(3, "pass") })),

  -- While loop
  s("while", fmt([[
    while {}:
        {}
  ]], { i(1, "condition"), i(2, "pass") })),

  -- Try-except block
  s("try", fmt([[
    try:
        {}
    except {} as {}:
        {}
  ]], { i(1, "code"), i(2, "Exception"), i(3, "e"), i(4, "handle_exception") })),

  -- Print statement
  s("print", t("print()")),

  -- Import statement
  s("imp", fmt("import {}", { i(1, "module") })),

  -- Import from
  s("imf", fmt("from {} import {}", { i(1, "module"), i(2, "func") })),

  -- Lambda function
  s("lam", fmt("lambda {}: {}", { i(1, "args"), i(2, "expr") })),

  -- Return statement
  s("ret", fmt("return {}", { i(1, "") })),
})

-- C#
ls.add_snippets("cs", {
  -- Console.WriteLine
  s("cwr", fmt([[Console.WriteLine({});]], { i(1, "\"text\"") })),

  -- Class
  s("class", fmt([[
    public class {}
    {{
        {}
    }}
  ]], { i(1, "ClassName"), i(2, "// members") })),

  -- Main method
  s("main", fmt([[
    static void Main(string[] args)
    {{
        {}
    }}
  ]], { i(1, "Console.WriteLine(\"Hello World\");") })),

  -- For loop
  s("for", fmt([[
  for (int {} = 0; {} < {}; {}++)
  {{
      {}
  }}
]], { i(1, "i"), rep(1), i(2, "n"), rep(1), i(3, "// code") })),

  -- If statement
  s("if", fmt([[
    if ({})
    {{
        {}
    }}
  ]], { i(1, "condition"), i(2, "// code") })),

  -- Property
  s("prop", fmt([[
    public {} {} {{ get; set; }}
  ]], { i(1, "string"), i(2, "PropertyName") })),

  -- get/set
  s("get", t("{ get; set; }")),
})
