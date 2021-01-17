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


## Examples

For current directory.

```sh
$ go build
```

Given `main.go` in the directory.

```sh
$ go build cmd/myapp/main.go
$ ls main
main
```

Choose an output path. The `-o` flag must come _before_ the packages.

```sh
$ go build -o myapp cmd/myapp/main.go
$ ls myapp
myapp
```
