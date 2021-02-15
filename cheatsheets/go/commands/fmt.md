# fmt


## What it does

From the docs, running `go fmt` runs this:

```sh
$ gofmt -l -w
```

Any packages listed are passed on to.


## Usage

```
usage: go fmt [-n] [-x] [packages]
```

## Flags

The flags on `go fmt` are limited.

- `-n` - Dry-run. Pprints commands that would be executed.
- `-x` - Trace. Prints commands as they are executed.

For more control, use the standalone `gofmt` command directly.

See more info on [gofmt]({{ site.baseurl }}{% link cheatsheets/go/commands/gofmt.md %}) guide.
