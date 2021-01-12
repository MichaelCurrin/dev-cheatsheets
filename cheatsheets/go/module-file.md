# Module file


## Samples

No dependencies.

```go
module help

go 1.13
```

One dependency.

```go
module cmd/myapp

go 1.15

require github.com/urfave/cli/v2 v2.3.0 // indirect
```

Locking transitive dependencies for the above (thanks to a VS Code extension feature).

```go
module cmd/myapp

go 1.15

require (
	github.com/cpuguy83/go-md2man/v2 v2.0.0 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/urfave/cli/v2 v2.3.0
)
```

GitHub module with multiple dependencies.

From [github.com/urfave/cli](https://github.com/urfave/cli).

```go
module github.com/urfave/cli/v2

go 1.11

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d
	gopkg.in/yaml.v2 v2.2.3
)
```
