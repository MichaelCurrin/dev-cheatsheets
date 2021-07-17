# Config files

See the [ESLint](https://michaelcurrin.github.io/code-cookbook/recipes/javascript/format-and-lint/eslint.html) section of my Code Cookbook for entire configs you can copy and paste.


## The ESLint config

From [Configuration file format](https://eslint.org/docs/2.0.0/user-guide/configuring#configuration-file-formats) in the docs.

1. `.eslintrc.js`
2. `.eslintrc.yaml` or `.eslintrc.yml`
3. `.eslintrc.json`
4. `.eslintrc` - DEPRECATED, as it can be JSON or YAML
5. `package.json` - `eslintConfig` field.


## ESLint ignore config

Resources:

- [Ignoring Files and Directories](https://eslint.org/docs/2.0.0/user-guide/configuring#ignoring-files-and-directories) in the docs.
- [Ignoring code](https://eslint.org/docs/user-guide/configuring/ignoring-code) - specifically the _The .eslintignore File_ section.

This is a plain text file, with glob patterns.

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

Note that `node_modules` is always ignored.

### Logging ignored paths

When you pass directories to ESLint, files and directories are **silently** ignored.

If you pass a specific file to ESLint, then you will see a **warning** messaged log, indicating that the file was skipped.

Example file:

```
foo.js
```

When running:

```sh
$ eslint foo.js
```

The output message will tell your `foo.js` was ignored and that you can use the `--no-ignore` flag.
