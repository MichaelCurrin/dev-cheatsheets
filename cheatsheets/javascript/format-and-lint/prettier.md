---
description: JavaScript formatting with Prettier.
---
# Prettier

Prettier is an opinionated code formatter. Use Prettier for formatting and linters for catching bugs.


## Resources

- [Prettier](https://prettier.io/) homepage
- [Configuration file](https://prettier.io/docs/en/configuration.html)
- [Options](https://prettier.io/docs/en/options.html)
- [Ignore](https://prettier.io/docs/en/ignore.html)


## Install

Install it globally.

```sh
$ npm i -g prettier
$ prettier -h
```

Or install it in a project.

```sh
$ npm i --save-dev prettier
```

If you've set it up in your NPM scripts, you can run like this:

```sh
$ npm run format
```

Otherwise, run ad hoc commands on the CLI as:

```sh
$ npx prettier
```


## CLI

See [CLI](https://prettier.io/docs/en/cli.html) in the docs.

### Usage

```sh
$ prettier -h
```
```
Usage: prettier [options] [file/dir/glob ...]

By default, output is written to stdout.
Stdin is read if it is piped to Prettier and no files are given.

Output options:

  -c, --check              Check if the given files are formatted, print a human-friendly summary
                           message and paths to unformatted files (see also --list-different).
  -l, --list-different     Print the names of files that are different from Prettier's formatting (see also --check).
  -w, --write              Edit files in-place. (Beware!)
...
```

### Examples

Be sure to use a path to a file or directory.

The default behavior will print changes (possibly very long) without writing them.

```sh
$ prettier .
```

Get a summary with `--check`.

```sh
$ prettier -c .
Checking formatting...
[warn] index.js
[warn] foo/bar.js
...
```

Update files in place.

```sh
$ prettier -w .
```

Complicated example:

```sh
$ prettier --single-quote \
  --trailing-comma all \
  --write docs \
  package.json \
  "{app,__{tests,mocks}__}/**/*.js"
```


## Configure

Setup a config file.

- `.prettierrc.json`
- `prettier.config.js` or `.prettierrc.js`
- `.prettierignore`


## Ignoring rules

### Ignore next line

```javascript
// prettier-ignore
console.log('foo')
```

If using ESLint:

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
