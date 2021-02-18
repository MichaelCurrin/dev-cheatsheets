# CLI

See [CLI](https://prettier.io/docs/en/cli.html) in the docs.


## Usage

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


## Examples

Be sure to use a path to a file or directory.

### Default

The default behavior will print changes (possibly very long) without writing them.

```sh
$ prettier .
```

### Check

Get a summary with `--check`.

```sh
$ prettier -c .
Checking formatting...
[warn] index.js
[warn] foo/bar.js
...
[warn] Code style issues found in the above file(s). Forgot to run Prettier?
```

### Edit

Update files in place.

```sh
$ prettier -w .
```

### Flags

Complicated example:

```sh
$ prettier --single-quote \
  --trailing-comma all \
  --write docs \
  package.json \
  "{app,__{tests,mocks}__}/**/*.js"
```


## Use without installing

If you don't have Prettier installed globally or in a project, you can still download and run it on a project. This won't install it.

```sh
$ npx prettier -w .
```

That will use the default options plus any overrides you've set in Prettier configs.
