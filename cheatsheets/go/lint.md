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

Install globally:

```sh
$ go install honnef.co/go/tools/cmd/staticcheck@latest
```

Or in a project:

```sh
$ go go honnef.co/go/tools/cmd/staticcheck@latest
```

The downside for the second approach is that you'll get a warning in `go.mod` from your IDE that the package is unused. And running `go mod tidy` remove it. I don't know how to add it to dev dependencies or stop it getting removed. Maybe just have it as a global dependency in a project. See my [Makefile](https://github.com/MichaelCurrin/go-project-template/blob/main/Makefile) of `go-project-template.`


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
