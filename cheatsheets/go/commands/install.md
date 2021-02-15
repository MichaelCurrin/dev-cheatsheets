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

Given module `main.go` and no arguments, the current directory's name will be used (such as the repo name). This does not the script name or the script's directory.

```sh
$ go install
```

The result will be:

- `main.go`
- `~/go/bin/my-repo`

If there is no Go script at the top-level, you'll get an error.

### Module given

Both of these give the same output name.

```sh
$ go install main.go
$ go install cmd/myapp/main.go
```

Result:

- `main.go` or `cmd/myapp/main.go`
- `~/go/bin/main`

I don't know a more precise way of doing this where the package name is kept.

### URL given

To install a Go module by URL, rather use the `go get` command.

If you run this just anywhere, it will fail:

```go
$ go install github.com/MichaelCurrin/go-project-template
```

But, if you run it inside that directory, it will work because of the `go.mod` file definition.

```sh
$ cd go-project-template
$ go install github.com/MichaelCurrin/go-project-template
```

Though, you might as well just do this which seems equivalent.

```sh
$ cd go-project-template
$ go install
```


## Verbose

> print the names of packages as they are compiled.

```sh
$ go install -v
```
