---
title: Common
description: Some rules you are likely to need with configuring and running ESLint
---


Here is a reference for rules I typically like to know about or set, using my preferred values.

See below rule names and some recommended values (not all values).

| Name           | Values                                                                                                                                                                                                                                                                                 | Link                                               |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `semi`         | `[2, "always"]`                                                                                                                                                                                                                                                                        |                                                    |
| `comma-dangle` | `[2, "always-multiline"]`. Using `always` is to aggressive like `import { x, y, } from "bar"`.                                                                                                                                                                                              | [docs](https://eslint.org/docs/rules/comma-dangle) |
| `quotes`       | `[2, "single"]` or `[2, "double"]`                                                                                                                                                                                                                                                     | [docs](https://eslint.org/docs/rules/quotes)       |
| `no-console`   | `'off'`                                                                                                                                                                                                                                                                                | [docs](https://eslint.org/docs/rules/no-console)   |
| `no-console`   | `1`                                                                                                                                                                                                                                                                                    |                                                    |
| `no-undef`     | `1`                                                                                                                                                                                                                                                                                    | [docs](https://eslint.org/docs/rules/no-undef)     |
| `indent`       | `[2, 2]` - you'll get 4 spaces for just `2` / `"error"`                                                                                                                                                                                                                                | [docs](https://eslint.org/docs/rules/indent)       |
| `max-len`      | `[2, { "code": 100 }]` or `[2, { code: 100, ignoreUrls: true }]`                                                                                                                                                                                                                                                    | [docs](https://eslint.org/docs/rules/max-len)      |
| `func-style`   | For `function` style - `["error", "declaration"]`. For `const foo () => {};`, use `["error", "expression"]` or `["error", "declaration", { "allowArrowFunctions": true }]` (rule only valid as an option for "declaration" and it will override default of no arrow functions allowed. | [docs](https://eslint.org/docs/rules/func-style)   |

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


## Avoid escaped quotes

How to prevent quotes being escaped, so that your strings look cleaner and there are no conflicts with Prettier.

In this example, quoting is set to double quotes.

```
[2, "double"]
```

If using Prettier, by default you'll get this:

```javascript
'this is my "string"'
```

And then ESLint tries to make it this:

```javascript
"this is my \"string\""
```

Unless you set `avoidEscape`.

```
quotes: [2, "double", { avoidEscape: true }]
```
