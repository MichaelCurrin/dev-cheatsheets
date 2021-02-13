# get

Reference for [get](https://golang.org/pkg/cmd/go/internal/get/) command.


## Flow

The `go get` command will:

1. Download a package by URL.
2. Download dependencies.
3. Store in `~/go/pkg/mod`
4. Compile the package and install to `~/go/bin` - as if running `go build` or `go install`.


## Help

For usage, see link above.

### Flag highlights

- `-v` - Verbose progress and debug output.
- `-u` - Update package. This flag is fine even if the package is not installed yet.
- `-d` - Download but do not install.


From the CLI help:

> usage: go get [-d] [-f] [-t] [-u] [-v] [-fix] [-insecure] [build flags] [packages]
>
> Get downloads the packages named by the import paths, along with their
> dependencies. It then installs the named packages, like 'go install'.

> With no package arguments, 'go get' applies to Go package in the
current directory, if any.
>
> In particular, 'go get -u' and 'go get -u=patch' update all the dependencies of that package.
>
> With no package arguments and also without -u, 'go get' is not much more than 'go install', and 'go get -d' not much more than 'go list'.


## Examples

### Install target package

Short and long URLs.

```sh
$ go get -u github.com/gorilla/mux
$ go get -u github.com/godoctor/godoctor
```


### Install target in a repo

```sh
$ go get -u github.com/urfave/cli/v2
```

See [cli/go.mod](https://github.com/urfave/cli/blob/v2.3.0/go.mod)

```go
module github.com/urfave/cli/v2

go 1.11

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d
	gopkg.in/yaml.v2 v2.2.3
)
```

```sh
$ go get -u github.com/cpuguy83/go-md2man/v2
```

```sh
$ go get -u github.com/go-delve/delve/cmd/dlv
```


### Install all packages

Similar to `go install`.

```sh
$ go get
```
