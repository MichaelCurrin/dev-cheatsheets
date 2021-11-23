# build


## Usage

```sh
$ go build ARGS
```

The build command will output to the current directory or a given target file path.

Unlike `install` this will not build to your `GOBIN`.


## Help

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


## Default output location

### No module given

Given `main.go` in the top-level directory:

```sh
$ go build
```

The result will be files:

- `main.go`
- `my-project` - the outer directory will be used, such as your repo's name.


### Module given

Pass a script name and the name of the script will be used for output. 

Given `main.go` in the top-level directory:

```sh
$ go build main.go
```

The result will be files:

- `main.go`
- `main`

Given `main.go` in a subdirectory:

```sh
$ go build cmd/myapp/main.go
```

The result will be files:

- `cmd/myapp/main.go`
- `main`


## Custom output

Choose an output path. 

The `-o` flag must come _before_ the module names.

```sh
$ go build -o myapp main.go
```

Result:

- `main.go`
- `myapp`


Use a file path in subdirectory. This will be created for you.

```sh
$ go build -o build/myapp main.go
```

Result:

- `main.go`
- `build/myapp`

