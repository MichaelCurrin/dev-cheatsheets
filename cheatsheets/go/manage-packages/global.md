---
title: Global
description: Install a Go package globally so that it can be run anywhere as a CLI tool
---


Use the `go get` command a URL - such as a GitHub repo, excluding the protocol.

The URL should point to directory containing a `main.go`. file.

If using GitHub, the URL will be like one of:

```
github.com/USERNAME/REPO_NAME
github.com/USERNAME/REPO_NAME/PATH
```


## Install package from root directory

Point as to a GitHub repo with `main.go` at the root. 

Here using [MichaelCurrin/go-project-template](https://github.com/MichaelCurrin/go-project-template).

```sh
$ go get github.com/MichaelCurrin/go-project-template
```

Run the command which now exists in `GOBIN`.

```sh
$ go-project-template -h
```


## Install package from a subdirectory

If there was a CLI command, it will typically in the `cmd` directory.

e.g. `cmd/myapp/main.go`

### Generic example

```sh
$ go get github.com/MichaelCurrin/my-app/cmd/myapp
```

If `GOBIN` is in your `PATH`, you can run from anywhere:

```sh
$ myapp -h
```

### ESBuild example

Download the ESBuild CLI.

```sh
$ go get github.com/evanw/esbuild/cmd/esbuild
```

Check that it is accessible.

```sh
$ type esbuild
esbuild is /Users/mcurrin/go/bin/esbuild
```

Run it:

```sh
$ esbuild -h
...
```

- GitHub repo: [evanw/esbuild](https://github.com/evanw/esbuild)
- GitHub module path: [cmd/esbuild](https://github.com/evanw/esbuild/tree/master/cmd/esbuild)


## Upgrade

You can't use an upgrade flag with `install`, but you can use it with `get` as below.

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
