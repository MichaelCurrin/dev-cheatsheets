# Rule format

See also [Common rules][] page.

[Common Rules]: {{ site.baseurl }}{% link cheatsheet javascript/format-and-lint/eslint/common-rules.md %}


Each rule has its own allowed fields.

For level, you can use:

- `2` or `"error"`
- `1` or `"warn"`
- `0` or `"off"`

Example:

```js
{
  rules: {
    semi: [2, 'always'],
    semi: ['error', 'always'], // same as above

    'no-console': 'warn'
    'no-console': 1 // same as above
  }
}
```
