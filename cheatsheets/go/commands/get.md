# get

Reference for [get](https://golang.org/pkg/cmd/go/internal/get/) command.


## What it does

> Get downloads the packages named by the import paths, along with their dependencies. It then installs the named packages, like `go install`.

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

### Download only

```sh
$ go get -d github.com/gorilla/mux
```

### Install target package

Run this anywhere.

```sh
$ go get -u github.com/gorilla/mux
$ go get -u github.com/godoctor/godoctor
```

### Install target in a repo

```sh
$ cd my-repo
$ go mod init my-project
$ go get -u github.com/urfave/cli/v2
```

To see what you are installing here and its depednecies, see [cli/go.mod](https://github.com/urfave/cli/blob/v2.3.0/go.mod).

```go
module github.com/urfave/cli/v2

go 1.11

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d
	gopkg.in/yaml.v2 v2.2.3
)
```

Install V2.

```sh
$ go get -u github.com/cpuguy83/go-md2man/v2
```

Install command.

```sh
$ go get -u github.com/go-delve/delve/cmd/dlv
```


### Install a specific version

```sh
go install URL@VERSION
```

You can add a tag like `@1.2.3`.

Or `@latest` if you don't care about tags. 

Note that you can't specify version on `go install` as it gives an error.


### Install all packages

This looks in subdirectories not just the root `main.go`.

```sh
$ go get ./...
```

### Verbose

```sh
$ go get -v github.com/MichaelCurrin/go-project-template
```
```
github.com/cpuguy83/go-md2man (download)
github.com/MichaelCurrin/go-project-template/internal
github.com/cpuguy83/go-md2man/vendor/github.com/russross/blackfriday/v2
github.com/cpuguy83/go-md2man/md2man
github.com/urfave/cli
github.com/MichaelCurrin/go-project-template
```
