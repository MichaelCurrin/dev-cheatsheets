# install


## Usage

```
usage: go install [-i] [build flags] [packages]
Run 'go help install' for details.
```


## Help

```
go help install
usage: go install [-i] [build flags] [packages]

Install compiles and installs the packages named by the import paths.

Executables are installed in the directory named by the GOBIN environment
variable, which defaults to $GOPATH/bin or $HOME/go/bin if the GOPATH
environment variable is not set. Executables in $GOROOT
are installed in $GOROOT/bin or $GOTOOLDIR instead of $GOBIN.

When module-aware mode is disabled, other packages are installed in the
directory $GOPATH/pkg/$GOOS_$GOARCH. When module-aware mode is enabled,
other packages are built and cached but not installed.

The -i flag installs the dependencies of the named packages as well.

For more about the build flags, see 'go help build'.
For more about specifying packages, see 'go help packages'.

See also: go build, go get, go clean.
```


## Basic

This will compile the app and add it to your `GOBIN` directory, so you can run it anywhere.

```sh
$ go install
```

That is the same as doing this:

```sh
$ go build -o ~/go/bin/myapp cmd/myapp/main.go
```

From [docs](https://golang.org/cmd/go/).

> Executables are installed in the directory named by the `GOBIN` environment variable, which defaults to `$GOPATH/bin` or `$HOME/go/bin` if the `GOPATH` environment variable is not set. Executables in `$GOROOT` are installed in `$GOROOT/bin` or `$GOTOOLDIR` instead of `$GOBIN`. 


## Verbose

> print the names of packages as they are compiled.

```sh
$ go install -v
```
