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

### No module given

Given module `cmd/myapp/main.go` and no arguments, the current directory will be used.

```sh
$ go install
```

The result will be:

- `cmd/myapp/main.go`
- `~/go/bin/my-repo`

Note the name of the _current directory_ is used and not the script name or the script's directory.

### Module given

Both of these give the same output name.

```sh
$ go install main.go
$ go install cmd/myapp/main.go
```

Result:

- `~/go/bin/main`


## Verbose

> print the names of packages as they are compiled.

```sh
$ go install -v
```
