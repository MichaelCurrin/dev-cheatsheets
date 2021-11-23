---
title: Format
description: Guide to writing rules for ESLint with fields and levels
---

See also [Common rules][] page.

[Common Rules]: {% link cheatsheets/javascript/format-and-lint/eslint/rules/common.md %}

Each rule has its own allowed fields.

For level, you can use:

- `2` or `"error"`
- `1` or `"warn"`
- `0` or `"off"`

Example:

```js
{
  rules: {
    semi: [2, "always"],
    // OR
    semi: ["error", "always"],

    "no-console": "warn"
    // OR
    "no-console": 1
  }
}
```
