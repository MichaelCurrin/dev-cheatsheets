# Module type

## ES Lint

Set the type to ES module in the config.

- `.eslintrc.json
    ```json
    {
      "parserOptions": {
        "sourceType": "module"
      }
    }
    ```

Based on [answer](https://github.com/eslint/eslint/issues/10397#issuecomment-391752490) on the ESLint repo's issues.

ESLint cannot figure out the type from here:

- `package.json`
    ```json
    {
      "type": "module"
    }
    ```

Or at least not in my testing with multiple packages in one and no root `package.json`.


## Prettier

ESLint defaults to ES5 syntax-checking. So it rejects `const` and `import` keywords.

Here you can support modern JavaScript.


- `.eslintrc.json`
    ```json
    {
        "parserOptions": {
            "ecmaVersion": 2017
        },

        "env": {
            "es6": true
        }
    }
    ```
