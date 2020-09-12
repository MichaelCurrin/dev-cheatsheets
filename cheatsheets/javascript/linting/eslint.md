---
title: ESLint
---

## Resources

ES Lint docs:

- [Configuring](https://eslint.org/docs/user-guide/configuring)
- [Rules](https://eslint.org/docs/rules/)


## Script settings

Approaches to ignore within a script, where `[RULE, ]` below could be empty, or one more or more rules such as `no-alert, quotes, semi`.

Minimal setting would be to use double quotes and semi-colons, or flip it to single quotes and no semi-colons.

You can also use an IDE formatter or CLI (`eslint --fix`) to change files based on your config or default settings.

For more detail than below, you can set level as 0, 1 or 2 - [Configuring rules](https://eslint.org/docs/user-guide/configuring.html#configuring-rules).


### Ignore all warnings in a file

Place at the top of the file:

```javascript
/* eslint-disable [RULE, ] */
COMMAND
COMMAND
```

## Ignore in a section of a file

```javascript
COMMAND

/* eslint-disable [RULE, ] */
COMMAND
COMMAND
/* eslint-enable [RULE, ] */

COMMAND
```

### Ignore the next line

```javascript
// eslint-disable-next-line [RULE, ]
COMMAND
```

### Ignore a rule in the current line

```javascript
COMMAND // eslint-disable-line [RULE, ]
```

## Config file formats

https://eslint.org/docs/2.0.0/user-guide/configuring#configuration-file-formats

1.  `.eslintrc.js`
2.  `.eslintrc.yaml` / `.eslintrc.yml`
4.  `.eslintrc.json`
5.  `.eslintrc` - DEPRECATED, can be JSON or YAML
6.  `package.json` - `eslintConfig` field.


## Ignore file

> When you pass directories to ESLint, files and directories are silently ignored. If you pass a specific file to ESLint, then you will see a warning indicating that the file was skipped. For example, suppose you have an `.eslintignore` file that looks like this:
>

Example `.eslintignore` file:

```
foo.js
```

Run

```sh
eslint foo.js
```

And the output message will tell your `foo.js` was ignored and that you can use the `--no-ignore` flag.
