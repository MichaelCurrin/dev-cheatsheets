# Common rules


See [Rules](https://eslint.org/docs/rules/) in the docs. It provides descriptions and link to the rule's page.

A reference for rules I typically like to know about or set, using my preferred values.

See below rule names and some recommended values (not all values).

| Name           | Values                                                                                                                                                                                                                                                                                 | Link                                               |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `semi`         | `[2, "always"]`                                                                                                                                                                                                                                                                        |                                                    |
| `comma-dangle` | `'always-multiline'`. Using `always` is to aggressive like `import { x, y, } from "bar"`.                                                                                                                                                                                              | [docs](https://eslint.org/docs/rules/comma-dangle) |
| `quotes`       | `[2, "single"]` or `[2, "double"]`                                                                                                                                                                                                                                                     | [docs](https://eslint.org/docs/rules/quotes)       |
| `no-console`   | `'off'`                                                                                                                                                                                                                                                                                | [docs](https://eslint.org/docs/rules/no-console)   |
| `no-console`   | `1`                                                                                                                                                                                                                                                                                    |                                                    |
| `no-undef`     | `1`                                                                                                                                                                                                                                                                                    | [docs](https://eslint.org/docs/rules/no-undef)     |
| `indent`       | `["error", 2]` - you'll get 4 spaces for just `"error"`                                                                                                                                                                                                                                | [docs](https://eslint.org/docs/rules/indent)       |
| `max-len`      | `["error", { "code": 100 }]`                                                                                                                                                                                                                                                           | [docs](https://eslint.org/docs/rules/max-len)      |
| `func-style`   | For `function` style - `["error", "declaration"]`. For `const foo () => {};`, use `["error", "expression"]` or `["error", "declaration", { "allowArrowFunctions": true }]` (rule only valid as an option for "declaration" and it will override default of no arrow functions allowed. | [docs](https://eslint.org/docs/rules/func-style)   |

Note that these may conflict with Prettier. For example, Prettier with single quotes setting allows a double quote string with single quote inside, by ES Lint set up for single quotes see this as an error.

You can set more fields for `max-len`. e.g.

```json
{
  "code": 100,
  "tabWidth": 2,
  "ignoreUrls": true,
  "ignoreStrings": true,
  "ignoreTemplateLiterals": true
}
```

Note - using `ignoreStrings` gave unexpected results for me. Instead of allowing a single string to be over the limit, it allowed a line with multiple strings in it to pass quietly.
