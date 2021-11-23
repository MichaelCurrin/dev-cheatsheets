# lint

## Basic

Currently an unstable command so you need add a flag.

Run on current directly.

```sh
$ deno lint --unstable
```

Run on a file.

```sh
$ deno lint --unstable server.ts
Checked 1 file
```


## Ignore

If you have a build directory, you'll want to ignore it. You must use `=` after `--ignore` as a space does not work. You can separate multiple values with commas.

```sh
$ deno lint --unstable --ignore=build
```

[Linter](https://deno.land/manual/tools/linter) in the docs.

[deno_lint docs](https://lint.deno.land/) - provides searchable rules.


## Rules

Rules and ignoring rules - from the CLI help:

```
List available rules:
  deno lint --unstable --rules
```

```
Ignore diagnostics on the next line by preceding it with an ignore comment and
rule name:
  // deno-lint-ignore no-explicit-any

  // deno-lint-ignore require-await no-empty

Names of rules to ignore must be specified after ignore comment.

Ignore linting a file by adding an ignore comment at the top of the file:
  // deno-lint-ignore-file
```
