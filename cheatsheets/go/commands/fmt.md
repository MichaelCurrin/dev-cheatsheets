# fmt


## What it does

From the docs, running `go fmt` runs this:

```sh
$ gofmt -l -w PACKAGEES
```


## Help

- [gofmt][] cheatsheet.
- `fmt` help:
    ```sh
    $ go help fmt
    ```
- `gofmt` help:
    ```sh
    $ go doc cmd/gofmt
    ```


## Usage
```
usage: go fmt [-n] [-x] [packages]
```


## Flags

The flags on `go fmt` are limited to two. Use [gofmt][] if you want more control.

| Flag | Description                                      |
| ---- | ------------------------------------------------ |
| `-n` | Dry-run. Prints commands that would be executed. |
| `-x` | Trace. Prints commands as they are executed.     |

For more control, use the standalone `gofmt` command directly.


## Examples

### Dry run

```console
$ go fmt -n main.go
/Users/mcurrin/.local/go/bin/gofmt -l -w main.go
```

```console
$ go fmt -n ./...
/Users/mcurrin/.local/go/bin/gofmt -l -w internal/greetings.go
/Users/mcurrin/.local/go/bin/gofmt -l -w main.go
```


[gofmt]: {% link cheatsheets/go/commands/gofmt.md %}
