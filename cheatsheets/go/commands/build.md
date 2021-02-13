# build


## Usage

```sh
$ go help build
```

```
usage: go build [-o output] [-i] [build flags] [packages]

Build compiles the packages named by the import paths,
along with their dependencies, but it does not install the results.

If the arguments to build are a list of .go files from a single directory,
build treats them as a list of source files specifying a single package.

...
```


## Default output

```sh
$ go build ARGS
```

Given `main.go` in the top-level directory:

```sh
$ go build main.go
```

- `main.go`
- `main`


Given `main.go` in the subdirectory:

```sh
$ go build cmd/myapp/main.go
```

Output is still at the root.

- `cmd/myapp/main.go`
- `main`


## Custom output

Choose an output path. The `-o` flag must come _before_ the packages.

```sh
$ go build -o myapp main.go
```

Result:

- `main.go`
- `myapp`


Use a subdirectory. This will be created for you.

```sh
$ go build -o build/myapp main.go
```

Result:

- `build/myapp`
- `main.go`
