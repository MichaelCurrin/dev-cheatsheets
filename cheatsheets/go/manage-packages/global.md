---
title: Global
description: Install a Go package globally so that it can be run anywhere as a CLI tool
---


## The URL

Use the `go get` command and pass a URL without protocol.

The URL should point to directory containing a `main.go`. file.


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


## Install package version

e.g.

```sh
$ go get URL@TAG
$ go install honnef.co/go/tools/cmd/staticcheck@latest
```


## Install package from a subdirectory

```sh
$ go get URL
```

Typically, the URL will be a GitHub repo and include a path to a package in the `cmd` directory.

### Examples

#### Generic example

Give script `cmd/myapp/main.go` in `MichaelCurrin/my-app`.

```sh
$ go get github.com/MichaelCurrin/my-app/cmd/myapp
```

If `GOBIN` is in your `PATH`, you can run the CLI tool from anywhere:

```sh
$ myapp -h
```

#### ESBuild example

Download the ESBuild CLI package.

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

You can't use an upgrade flag with `install`, but you can use the flag with `get` as below.

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
