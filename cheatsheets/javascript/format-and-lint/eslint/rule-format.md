# Rule format

See also [Common rules][] page.

[Common Rules]: {{ site.baseurl }}{% link cheatsheets/javascript/format-and-lint/eslint/common-rules.md %}


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
