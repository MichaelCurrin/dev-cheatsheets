# Lint


## golint

The `golint` tool is marked as deprecated on GitHub.


## Tools

The golint docs recommend the following:

### Static check

- [StaticCheck.io](https://staticcheck.io/)
- [dominikh/go-tools](https://github.com/dominikh/go-tools) repo
    > Staticcheck - The advanced Go linter
- [Run](https://staticcheck.io/docs/run) in docs
- [Checks](https://staticcheck.io/docs/checks)

Install:

```sh
$ go install honnef.co/go/tools/cmd/staticcheck@latest
```

Check current package.

```sh
$ staticcheck .
```

Check all packages.

```sh
$ staticcheck ./...
```

Explain:

```sh
$ staticcheck -explain <check>
```

e.g. after seeing `foo.go:1248:4: unnecessary use of fmt.Sprintf (S1039)`, you would run:

```sh
$ staticcheck -explain S1039
```


### Go vet

This works with no arguments. Or supply packages.

```sh
$ go vet
$ go vet .
$ go vet ./...
```

Help:

```sh
$ go help vet
```
```sh
$ go doc cmd/vet
```
