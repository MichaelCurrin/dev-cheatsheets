# Vue lint

Guide to `vue-cli-service lint` command.

## Help

```
  Usage: vue-cli-service lint [options] [...files]

  Options:

    --format [formatter]   specify formatter (default: codeframe)
    --no-fix               do not fix errors or warnings
    --no-fix-warnings      fix errors, but do not fix warnings
    --max-errors [limit]   specify number of errors to make build failed (default: 0)
    --max-warnings [limit] specify number of warnings to make build failed (default: Infinity)

  For more options, see https://eslint.org/docs/user-guide/command-line-interface#options
```


## Warnings

The default behavior will not cause an error status on warnings.

```sh
$ vue-cli-service lint --no-fix
```

You can make this fail on warnings using a limit like:

```sh
$ vue-cli-service lint --no-fix --max-warnings 10
```

As you may want your CI to not fail a deploy just because of style warnings.
