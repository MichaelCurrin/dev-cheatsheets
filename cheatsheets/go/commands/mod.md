# mod

## Common

Set up `go.mod` file.

```sh
$ go mod init example.com/m
$ go mod init github.com/username/repo-name
```

Download modules.

```sh
$ go mod download
```

Clean up `go.sum` and remove unused packages from `go.mod`.

```sh
$ go mod tidy
```


## Help

```sh
$ go help mod
```
```
Go mod provides access to operations on modules.

Note that support for modules is built into all the go commands,
not just 'go mod'. For example, day-to-day adding, removing, upgrading,
and downgrading of dependencies should be done using 'go get'.
See 'go help modules' for an overview of module functionality.

Usage:

        go mod <command> [arguments]

The commands are:

        download    download modules to local cache
        edit        edit go.mod from tools or scripts
        graph       print module requirement graph
        init        initialize new module in current directory
        tidy        add missing and remove unused modules
        vendor      make vendored copy of dependencies
        verify      verify dependencies have expected content
        why         explain why packages or modules are needed

Use "go help mod <command>" for more information about a command.
```


## Init

```sh
$ go help mod init
```

```
usage: go mod init [module]

Init initializes and writes a new go.mod to the current directory,
in effect creating a new module rooted at the current directory.
The file go.mod must not already exist.
If possible, init will guess the module path from import comments
(see 'go help importpath') or from version control configuration.
To override this guess, supply the module path as an argument.
```

If you run without a module name supplier, you get this prompt:

```
Example usage:
        'go mod init example.com/m' to initialize a v0 or v1 module
        'go mod init example.com/m/v2' to initialize a v2 module
```
