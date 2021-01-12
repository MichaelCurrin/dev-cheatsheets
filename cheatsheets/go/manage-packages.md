# Manage packages


## Install package by name

```sh
$ go get -u GITHUB_INSTALL_REF
```

e.g.

```sh
$ go get github.com/lib/pq

$ go get -u github.com/isacikgoz/gitbatch/cmd/gitbatch
```

Precise version:

```sh
$ go get github.com/lib/pq@v1.8.0
```


## Upgrade package

Use the `-u` flag.

```sh
$ go get -u github.com/lib/pq
```

Latest patch release.

```sh
$ go get -u=patch github.com/lib/pq
```

Find available versions:

```sh
$ go list -m -versions github.com/lib/pq
github.com/lib/pq v1.0.0 v1.1.0 v1.1.1 ... ....
```


## Install all project dependencies

Use an ellipsis.

```sh
$ go get ./...
```

Or one of:

```sh
$ go build hello.go
$ go run hello.go
$ go test hello.go
```


## List packages

```sh
$ go list -m all
github.com/MichaelCurrin/go-tutorial
github.com/BurntSushi/toml v0.3.1
github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d
...
```


## Remove unused dependencies

```sh
$ go mod tidy
```
