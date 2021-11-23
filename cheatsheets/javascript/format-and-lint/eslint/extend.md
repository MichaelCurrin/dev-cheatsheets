# Extend

You can extend from an external ruleset. This keeps your project light as you add one line instead of many.

For example, using:

```
eslint:recommended
```

Gives you rules covered in [conf/eslint-recommended.js](https://github.com/eslint/eslint/blob/master/conf/eslint-recommended.js) of the ESLint repo.

See also [conf/eslint-all.js](https://github.com/eslint/eslint/blob/master/conf/eslint-all.js).

```
eslint:all
```

See the [Extending](https://eslint.org/docs/user-guide/configuring#extending-configuration-files) section in the docs.

Here is an example from the docs:

```json
{
    "plugins": [
        "react"
    ],
    "extends": [
        "eslint:recommended",
        "plugin:react/recommended"
    ],
    "rules": {
       "react/no-set-state": "off"
    }
}
```
