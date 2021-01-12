---
title: Create a package
description: Setup a Go module with dependencies
---

Paths are relative to the repo root.


## Examples

### Hello

Given script `hello.go`.

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

### Command

Given script `/cmd/myapp/main.go`.

Note **no** trailing slash or you'll get an error.

Initialize module.

```sh
$ go mod init cmd/myapp
```

Typically, a public package will start with the domain of the package provider. If you host your package on GitHub, you can use `github.com`.

```sh
$ go mod init github.com/MichaelCurrin/go-tutorial
```

Add dependencies.

```sh
$ go run cmd/app
```

Commit the files:

- `cmd/myapp/main.go`
- `go.mod`
- `go.sum`
