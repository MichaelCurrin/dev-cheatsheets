---
title: Create a package
description: Setup a new Go module as an installable package, with any dependencies
---

Paths are relative to the repo root.


## Examples

### Basic

Specify a short module name.

Given script `hello.go` at the root.

Initialize module:

```sh
$ go mod init hello
```

Install packages (and add them to the `.mod` file by running the module.

```sh
$ go run hello.go
```

Commit the files:

- `hello.go`
- `go.mod`
- `go.sum`

### Command package

Given script `/cmd/myapp/main.go`.

Note **no** trailing slash or you'll get an error.

Initialize module:

```sh
$ go mod init cmd/myapp
```

Add dependencies.

```sh
$ go run cmd/app
```

Commit the files:

- `cmd/myapp/main.go`
- `go.mod`
- `go.sum`


### URL package

Typically, a public package will start with the domain of the package provider.

#### Custom domain

Based on the help prompt from the CLI:

```sh
$ go mod init example.com/m
```

### GitHub

If you host your package on GitHub, you can use `github.com`.

```sh
$ go mod init github.com/my-username/my-app
```

For a V2 module. Based on [gocolly/colly/](https://github.com/gocolly/colly/v2)

```sh
$ go mod init github.com/gocolly/colly/v2
```


### Golang

```sh
$ go mod init golang.org/x/my-package
```
