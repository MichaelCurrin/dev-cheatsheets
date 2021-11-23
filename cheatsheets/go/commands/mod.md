# mod

## Overview

- Use [init](#init) to set up `go.mod` file.
    ```sh
    $ go mod init example.com/m
    $ go mod init github.com/username/repo-name
    ```
- Use [download](#download) to download packages.
    ```sh
    $ go mod download
    ```
- Use [tidy](#tidy) to clean up `go.sum`, download packages and remove unused packages from `go.mod`.
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

## Mod subcommands

### init

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

### download

```sh
$ go help mod download
```

```
usage: go mod download [-x] [-json] [modules]

Download downloads the named modules, which can be module patterns selecting
dependencies of the main module or module queries of the form path@version.
With no arguments, download applies to all dependencies of the main module
(equivalent to 'go mod download all').

...

The -x flag causes download to print the commands download executes.
```

### tidy

```sh
$ go mod help tidy
```
```
usage: go mod tidy [-v]

Tidy makes sure go.mod matches the source code in the module.
It adds any missing modules necessary to build the current module's
packages and dependencies, and it removes unused modules that
don't provide any relevant packages. It also adds any missing entries
to go.sum and removes any unnecessary ones.

The -v flag causes tidy to print information about removed modules
to standard error.
```
