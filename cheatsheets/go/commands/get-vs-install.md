# get vs install


## get

I mostly use the `go get` subcommand.

Run it inside a repo or anywhere.

### Install in project

If inside a repo, the installed package will be added to `go.mod` or `go.sum`. This is a good idea, so that it stays associated with the project.

```console
$ cd my-go-repo
$ go get honnef.co/go/tools/cmd/staticcheck
go get: added honnef.co/go/tools v0.2.1
```

### Install globally

Either run outside a repo.

```console
$ cd ~
$ go get honnef.co/go/tools/cmd/staticcheck
```

Or run inside a repo but with `go install` **and** also with a tag like `@latest`. See below.



## install

The `go install` subcommand is similar.

### No tag

If you run it in a repo you'll get an error telling you to use `go get` instead.

```console
$ cd my-go-repo
$ go install honnef.co/go/tools/cmd/staticcheck
no required module provides package honnef.co/go/tools/cmd/staticcheck; to add it:
        go get honnef.co/go/tools/cmd/staticcheck
```

### Tag

Alternatively, run it with a version without error.

```sh
$ cd my-go-repo
$ go install honnef.co/go/tools/cmd/staticcheck@latest
```

