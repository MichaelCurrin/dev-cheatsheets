# Single

See help on the [go get][] subcommand.

[go get]: {% link cheatsheets/go/commands/get.md %}


## Install package in your project


```sh
$ go get GITHUB_INSTALL_REF
```

Tht will install the package to your `GOBIN`.

It will alos update `go.mod` and `go.sum` to reflect - usin `go install` will **not** do that.

e.g.

```sh
$ go get github.com/lib/pq

$ go get github.com/isacikgoz/gitbatch/cmd/gitbatch
```

Pinned exact version:

```sh
$ go get github.com/lib/pq@v1.8.0
```

Latest:

```sh
$ go get honnef.co/go/tools/cmd/staticcheck@latest
```


## Upgrade package

Use the `-u` flag:

```sh
$ go get -u github.com/lib/pq
```

Latest patch release:

```sh
$ go get -u=patch github.com/lib/pq
```


## List versions

Find available versions without upgrading.

```console
$ go list -m -versions github.com/lib/pq
github.com/lib/pq v1.0.0 v1.1.0 v1.1.1 ... ....
```
