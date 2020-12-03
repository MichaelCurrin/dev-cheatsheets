# ESLint

## Resources

See ESLint docs:

- [Configuring](https://eslint.org/docs/user-guide/configuring)
- [Rules](https://eslint.org/docs/rules/)


## Rules

A reference for rules I typically like to know about or set, using my preferred values.

Each rule has its own allowed fields. Sometimes you set `2` or `"error"`, or just `1`.

Example:

```js
{
  rules: {
    semi: [2, 'always'],
    semi: ['warn', 'always'],
    'no-console': 'error'
    'no-console': 2
  }
}
```

See [Rules](https://eslint.org/docs/rules/) in the docs. It provides descriptions and link to the rule's page.

See below rule names and some recommended values (not all values).

Name   | Values | Link
---    | ---    | ---
`semi` | `[2, "always"]` | 
`comma-dangle` | `'always-multiline'`. Using `always` is to aggressive like `import { x, y, } from "bar"`. | [docs](https://eslint.org/docs/rules/comma-dangle)
`quotes` | `[2, "single"]`, `[2, "double"]` | [docs](https://eslint.org/docs/rules/quotes)
`no-console` | `'off'` | [docs](https://eslint.org/docs/rules/no-console)
`no-console` | `1` |
`no-undef` | `1` |
`indent` | `["error", 2]` - you'll get 4 spaces for just `"error"` | [docs](https://eslint.org/docs/rules/indent)


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
