# CLI


Once installed, Prettier can be used as a CLI tool. 

See the [Prettier CLI][] page of the Prettier docs for more info.


## File types

It can be used to format these and other supported file types.

- JS
- TS
- HTML
- CSS
- Markdown

I don't like this though on Markdown for these reasons.

- It adds whitespace after headings which is not nice after `#` for `h1`.
- It takes out double empty lines.
- It wraps long lines.

I can't seem to override this behavior except just to just not run against Markdown.


## Usage

You might install it globally and use it as:

```sh
$ prettier .
```

Or you might install it in a project and set it up as an NPM script. So you can run it as:

```sh
$ npm run fmt
```


## Help

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


## File pattern

Pass a file path, directory path or glob as a pattern.

```sh
$ prettier PATTERN
```

### File

```sh
$ prettier foo.js
```

Multiple files.

```sh
$ prettier foo.js index.html
```


### Directory

Apply for supported file names.

Running at the root would run on everything including `package.json` and configs - you may prefer to target directories.

```sh
$ prettier .
```

```sh
$ prettier src
```

```sh
$ prettier src tests
```

### Glob

Recommended - use quotes. You can actually leave out the quotes in some shells, but you might get inconsistent behavior depending on if your shell supports `**` for example (older Bash doesn't).

JS files only.

```sh
$ prettier "**/*.js"
```

JS and CSS files only.

```sh
$ prettier "**/*.{js,css}"
```

TS and CSS files only.

```sh
$ prettier "**/*.{ts,css}"
```

Test JS files in multiple directories.

```sh
$ prettier "{app,__{tests,mocks}__}/**/*.js"
```

### Mixed

File, directory and glob together.

```sh
$ prettier main.js src docs/**/*.md"
```


## Flags

### Operational flags

These change how Prettier behaves.

See the [Prettier CLI][] docs or the run the CLI help yourself for more details.

Here is a highlight list.

Flag | Description
---   | ---
`--check` | This will output a human-friendly message and a list of unformatted files, if any. Exits with error status if formatting is needed.
`--list-different`, `-l` | Prints the **filenames** of files that are different from Prettier formatting. Exits with error status if formatting is needed.
`--write`, `-w` |  This rewrites all processed files in place.
`--loglevel` | Change the level of logging for the CLI. Valid options are: `error`, `warn`, `log` (default), `debug`, and `silent`
`--ignore-unknown`, `-u` | Ignore unknown files matched by patterns.

See [Examples](#examples) below for sample output for some of these.


### Options

Change rules for how Prettier formats files.

See [Options](https://prettier.io/docs/en/options.html) in the docs. That shows you what you can set and what the default values are.

These can be set in a config file or in the CLI.

I recommende using the default options unless you have good reason for choosing a non-default option.

Here is a highlight list.

Flag | Description
---   | ---
`--no-semi` | Turn off semi-colons, instead of default of on.
`--single-quote` | Use single quotes instead of default of double.
`--print-width WIDTH` | Defaults to `80`, but `100` or `120` are okay too.
`--tab-width CHARS` | How many spaces to indent by. Defaults to `2` characters.
`--use-tabs` | Use tabs instead of spaces.
`--html-whitespace-sensitivity MODE` | Valide modes are `css` (default), `strict` and `ignore`. See the docs for more info.
`--arrow-parens MODE` | Include parentheses around a sole arrow function parameter. Use either `always` to include or `avoid` for never. e.g. `i => console.log(i)` vs `(i) => console.log(i)`.

e.g.

```sh
$ prettier --no-semi --single-quote .
```


## Examples

### Default

The default behavior will recommended changes. 

This may be very long so is not recommended for CI flows. Especially since this prints the _whole_ file and not just the lines to change. Also you might want to run this on a file instead of a directory, to keep the output short.

```sh
$ prettier main.js
```

This is useful to see what Prettier would do, without actually applying changes - for example if you are experimenting with different rules.

### Check

Get a summary with `--check`.

This can be useful in a CI or git hooks flow, where you want to automate a check and abort if at least one file needs changing (which you would then do locally).

```sh
$ prettier -c .
```
```
Checking formatting...
[warn] index.js
[warn] foo/bar.js
...
[warn] Code style issues found in the above file(s). Forgot to run Prettier?
```

Set log level to see only errors for example. In this case, there is no output.

```sh
$ prettier -c --loglevel error .
```

### List

List files that need changing, if any. Good for CI.

```sh
$ prettier -l
```

```
index.js
foo/bar.js
```

### Edit

Format files and **save** the changes.

```sh
$ prettier -w .
```

### Long example

Detailed example from the docs.

```sh
$ prettier \
  --single-quote \
  --trailing-comma all \
  --write \
  docs package.json "{app,__{tests,mocks}__}/**/*.js"
```

[Prettier CLI]: https://prettier.io/docs/en/cli.html


## Default behavior

- Use `.editorconfig`.
- Ignore `node_modules`.
- Find ignore config.
- Find Prettier config.
