---
title: Shell
description: Execute a shell command within a Go script
---

Set up a shell command as a string and run it. You could run a shell command like `date` or even access programming language CLI tool like `python` or `node`.

This is using the `exec` builtin module. Similar to using the `subprocess` module in Python.

See [exec](https://golang.org/pkg/os/exec/) package in Go's standard packages.


## Syntax

You could pass something simple like `"ls"` or with arguments like `"ls -l"`.

```go
out, err := exec.Command("COMMAND").Output()
```

```go
exec.Command("ls")
exec.Command("ls -l")
exec.Command("bash greet.sh")
```


## Examples

### Run scripts

```go
// Or "/bin/sh" for portability.
shell := "bash" 
path := "./my_script.sh"

exec.Command(shell, path)
```

### Execute binary or executable script

```go
exec.Command("date")
```

```go
exec.Command("./my_executable.sh")
```

A fuller example:

- `main.go`
    ```go
    package main

    import (
        "fmt"
        "log"
        "os/exec"
    )

    func main() {
        cmd := "date"
        out, err := exec.Command(cmd).Output()
        if err != nil {
            log.Fatal(err)
        }

        fmt.Printf("The date is: %s\n", out)
    }
    ```

Result:

```sh
$ go run main.go
```
```
The date is: Thu 25 Feb 2021 17:42:46 SAST
```


## Handle errors and output

```go
out, err := exec.Command("COMMAND".Output()

if err != nil {
    log.Fatal(err)
}

fmt.Printf("Output is %s\n", out)
```
