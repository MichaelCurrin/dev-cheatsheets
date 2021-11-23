# GOBIN env variable

From [docs](https://golang.org/cmd/go/):

> Executables are installed in the directory named by the `GOBIN` environment variable, which defaults to `$GOPATH/bin` or `$HOME/go/bin` if the `GOPATH` environment variable is not set. Executables in `$GOROOT` are installed in `$GOROOT/bin` or `$GOTOOLDIR` instead of `$GOBIN`. 


## Override GOBIN

The global default value of `GOBIN` of `~/go/bin`. This is used across projects so can get cluttered

You can make a new one if you like.

Must be an **absolute** path.

```sh
$ export GOBIN=$PWD/mybin
```

Check it.

```sh
$ echo $GOBIN
/Users/mcurrin/.../mybin
```

Or

```sh
go env GOBIN
/Users/mcurrin/.../mybin
```

Then run a command like:

```sh
$ go install
```

If you want to compile binaries specific to one project, then you are better off using the `build` command and not messing with `GOBIN`.

```sh
$ go build -o build/
```
