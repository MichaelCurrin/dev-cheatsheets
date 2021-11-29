# Ignoring rules


## Ignore next line

```javascript
// prettier-ignore
console.log("Hello, World")
```

If using ESLint:

```javascript
// eslint-disable-next-line prettier/prettier
console.log('foo')
```


## Global ignore config

A plain text file.

- `.prettierignore` e.g.
    ```
    build/
    *.html
    ```
