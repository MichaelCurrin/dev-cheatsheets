# ESLint

## Resources

ES Lint docs:

- [Configuring](https://eslint.org/docs/user-guide/configuring)
- [Rules](https://eslint.org/docs/rules/)


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

## ESLint config

From [Configuration file format](https://eslint.org/docs/2.0.0/user-guide/configuring#configuration-file-formats) in the docs.

1. `.eslintrc.js`
2. `.eslintrc.yaml` or `.eslintrc.yml`
3. `.eslintrc.json`
4. `.eslintrc` - DEPRECATED, as it can be JSON or YAML
5. `package.json` - `eslintConfig` field.

## ESLint ignore config

See [Ignoring Files and Directories](https://eslint.org/docs/2.0.0/user-guide/configuring#ignoring-files-and-directories) in the docs.

This is a plain text file with glob patterns.

e.g.

- `.eslintignore`
    ```
    **/*.js
    ```

### Logging ignored paths

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
