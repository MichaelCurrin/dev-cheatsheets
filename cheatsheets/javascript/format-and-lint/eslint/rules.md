# Rules


## Format

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

See [Rules](https://eslint.org/docs/rules/) in the docs. It provides descriptions and link to the rule's page.
