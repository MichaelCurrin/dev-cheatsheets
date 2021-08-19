---
title: Global
description: Install a Go package globally so that it can be run anywhere as a CLI tool
---


## The URL

Use the `go get` command and pass a URL without protocol.

The URL should point to directory containing a `main.go` file.

This also works if there is a single Go file of another name e.g. [cmd/staticcheck/staticcheck.go](https://github.com/dominikh/go-tools/blob/master/cmd/staticcheck/staticcheck.go).


## Install package from root directory

Point a repo with `main.go` at the root.

```sh
$ go get REPO_URL
```

Here using [MichaelCurrin/go-project-template](https://github.com/MichaelCurrin/go-project-template).

```sh
$ go get github.com/MichaelCurrin/go-project-template
```

Run the command which now exists in `GOBIN`.

```sh
$ go-project-template -h
```


## Install target version

```sh
$ go get URL@TAG
$ go install URL@TAG
```

Note this doesn't not work in the repo root as you'll get an error. 

Here using [staticcheck.go](https://github.com/dominikh/go-tools/blob/master/cmd/staticcheck/staticcheck.go).

```sh
$ go install honnef.co/go/tools/cmd/staticcheck@v0.2.0
```

```console
$ go install honnef.co/go/tools/cmd/staticcheck@v0.2.0
$ staticcheck --version
staticcheck 2021.1 (v0.2.0)

$ go install honnef.co/go/tools/cmd/staticcheck@v0.2.1
$ staticcheck --version
staticcheck 2021.1.1 (v0.2.1)
```

In a module, you can omit the version.

```sh
$ cd my-go-repo
$ go get honnef.co/go/tools/cmd/staticcheck
```

But you'll get an error outside a module if you use `install`.

```console
$ cd ~
$ go install honnef.co/go/tools/cmd/staticcheck
go install: version is required when current directory is not in a module
	Try 'go install honnef.co/go/tools/cmd/staticcheck@latest' to install the latest version
```  
 
But no issue if you use `get`.

```sh
$ cd ~
$ go get honnef.co/go/tools/cmd/staticcheck
```


## Install package from a subdirectory

```sh
$ go get REPO_URL/APP_PATH
```

Typically, the package will bee on GitHub repo URL and include a path to a package in the `cmd` directory.

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

### Custom domain

```sh
$ go get honnef.co/go/tools/cmd/staticcheck
```


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
