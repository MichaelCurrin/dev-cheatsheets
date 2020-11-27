# Prettier

Prettier is an opinionated code formatter.


Use Prettier for formatting and linters for catching bugs.

## Resources

- [Prettier](https://prettier.io/) homepage
- [Configuration file](https://prettier.io/docs/en/configuration.html)
- [Options](https://prettier.io/docs/en/options.html)
- [Ignore](https://prettier.io/docs/en/ignore.html)

JavaScript formatting with Prettier.


## Config

- `.prettierrc.json`
- `prettier.config.js` or `.prettierrc.js`


## Ignore

### Ignore next line

```javascript
// prettier-ignore
console.log('foo')
```

If using ESLint.

```javascript
// eslint-disable-next-line prettier/prettier
console.log('foo')
```

### Global ignore config

A plain text file.

- `.prettierignore` e.g.
    ```
    build/
    *.html
    ```
