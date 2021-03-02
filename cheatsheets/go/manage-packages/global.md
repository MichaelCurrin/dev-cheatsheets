---
title: Global
description: Install a Go package globally so that it can be run anywhere as a CLI tool
---


Use the `go get` command a URL.

The URL should point to a repo's directory containing a `main.go`. file.

Such as to a GitHub repo. Here using [MichaelCurrin/go-project-template](https://github.com/MichaelCurrin/go-project-template).

```sh
$ go get github.com/MichaelCurrin/go-project-template
```

Run the command which now exists in `GOBIN`.

```sh
$ go-project-template -h
```

If there was a `cmd/myapp/main.go` file:

```sh
$ go get github.com/MichaelCurrin/go-project-template/cmd/myapp
```

If `GOBIN` is in your `PATH`, you can run from anywhere:

```sh
$ my-app -h
```

You can't use the upgrade flag with `install`, but you can with `get`.

```sh
$ go get -u URL
```

e.g.

```sh
$ go get -u github.com/MichaelCurrin/go-project-template/cmd/myapp    
```
```
go: github.com/cpuguy83/go-md2man/v2 upgrade => v2.0.0
go: github.com/russross/blackfriday/v2 upgrade => v2.1.0
```


## Check installed packages

Show names in `GOBIN`, sorted by most recently updated.

```sh
$ ls -1 -t ~/go/bin
```
```
go-project-template
...
gopls
golint
goreturns
...
```
