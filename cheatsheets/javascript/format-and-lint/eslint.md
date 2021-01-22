---
title: ESLint
description: Find and fix problems in your JavaScript code
---

## About

ESLint can statically analyze your JS code to find and fix problems.

It can syntax that is invalid. It can give warnings (like a variable that is unused or was never declared). You can customize what you want to be alerted on and you can change a warning level to an error level.

You can also enforce some styling and formatting issues which don't affect functionality. Like indenting code, wrapping lines, trailing semi-colons and trailing commas (for the last item in a structure). If you setup ESLint right, you might not even need Prettier.


## When to run

- Manually.
    ```sh
    $ npm run lint:fix
    ```
- As a hook - like on every commit or on a push.
- As a pre-release step - add to `preversion` in `package.json`, for when you run `npm version TAG`.
- As part of CI.
    - Run lint checks on CircleCI or GH Actions. 
    - You can even setup GH Actions to fix up the code and add a commit for you. But that level of automation may be more trouble than its worth. You'll find put that your build failed because of a lint issue, so you can then change and push changes.
    - Note that some problems in syntax cannot be autofixed - so be prepared to make changes locally anyway.
    - If you have a pre-commit or pre-push hook, then your code on GitHub will be cleaner when it goes through the CI. But having the CI checks is good - in case you make a commit directly on GitHub. And in case someone has not setup hooks locally (git hooks need manual setup but NPM husky hooks I think run automatically if defined in `package.json`.


## Resources

- ESLint documentation
    - [ESLint docs homepage](https://eslint.org)
    - [Configuring](https://eslint.org/docs/user-guide/configuring) guide.
    - [Rules](https://eslint.org/docs/rules/) doc.
    - [Specifiying enviroments](https://eslint.org/docs/user-guide/configuring#specifying-environments)
- ESLint guides on GitHub
    - [Walmart](https://github.com/walmartlabs/eslint-config-walmart)
    - [Google](https://github.com/google/eslint-config-google)
    - [AirBnB](https://github.com/airbnb/javascript)
    - [Gulp](https://github.com/gulpjs/eslint-config-gulp)
    - [Formidable](https://github.com/FormidableLabs/eslint-config-formidable)


## Rules

A reference for rules I typically like to know about or set, using my preferred values.

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

See below rule names and some recommended values (not all values).

Name   | Values | Link
---    | ---    | ---
`semi` | `[2, "always"]` | 
`comma-dangle` | `'always-multiline'`. Using `always` is to aggressive like `import { x, y, } from "bar"`. | [docs](https://eslint.org/docs/rules/comma-dangle) |
`quotes` | `[2, "single"]` or `[2, "double"]` | [docs](https://eslint.org/docs/rules/quotes) |
`no-console` | `'off'` | [docs](https://eslint.org/docs/rules/no-console) |
`no-console` | `1` | |
`no-undef` | `1` | [docs](https://eslint.org/docs/rules/no-undef)
`indent` | `["error", 2]` - you'll get 4 spaces for just `"error"` | [docs](https://eslint.org/docs/rules/indent) |

### Extend

You can extend from an external ruleset. This keeps your project light.

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


## Script settings

Approaches to ignore within a script, where `[RULE, ]` below could be empty, or one more or more rules such as `no-alert, quotes, semi`.

Minimal setting would be to use double quotes and semi-colons, or flip it to single quotes and no semi-colons.

You can also use an IDE formatter or the CLI (`eslint . --fix`) to change files based on your config or default settings.

For more detail than below, you can set level as 0, 1 or 2 - [Configuring rules](https://eslint.org/docs/user-guide/configuring.html#configuring-rules).

### Ignore entire file

Place at the top of the file:

```javascript
/* eslint-disable [RULE, ] */
COMMAND
COMMAND
```

### Ignore a section

```javascript
COMMAND

/* eslint-disable [RULE, ] */
COMMAND
COMMAND
/* eslint-enable [RULE, ] */

COMMAND
```

### Ignore next line

```javascript
// eslint-disable-next-line [RULE, ]
COMMAND
```

### Ignore current line

```javascript
COMMAND // eslint-disable-line [RULE, ]
```

## Config files

See the [ESLint](https://michaelcurrin.github.io/code-cookbook/recipes/javascript/format-and-lint/eslint.html) section of my Code Cookbook for entire configs you can copy and paste.

### The ESLint config

From [Configuration file format](https://eslint.org/docs/2.0.0/user-guide/configuring#configuration-file-formats) in the docs.

1. `.eslintrc.js`
2. `.eslintrc.yaml` or `.eslintrc.yml`
3. `.eslintrc.json`
4. `.eslintrc` - DEPRECATED, as it can be JSON or YAML
5. `package.json` - `eslintConfig` field.

### ESLint ignore config

See [Ignoring Files and Directories](https://eslint.org/docs/2.0.0/user-guide/configuring#ignoring-files-and-directories) in the docs.

This is a plain text file with glob patterns.

Samples from the docs:

- `.eslintignore`
    ```
    **/*.js
    ```
- `.eslintignore`
    ```
    # Ignore files compiled from TypeScript and CoffeeScript
    **/*.{ts,coffee}.js
    ```
- `.eslintignore`
    ```
    # Ignore built files except build/index.js
    build/
    !build/index.js
    ```

Note that `node_modules` is ignored by default.

#### Logging ignored paths

When you pass directories to ESLint, files and directories are **silently** ignored. 

If you pass a specific file to ESLint, then you will see a **warning** indicating that the file was skipped. 

Example file:

```
foo.js
```

When running:

```sh
$ eslint foo.js
```

The output message will tell your `foo.js` was ignored and that you can use the `--no-ignore` flag.
