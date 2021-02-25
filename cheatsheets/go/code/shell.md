---
title: Shell
description: Run a shell command within a Go script
---

Setup a shell command as a string and run it. You could run a shell command like `date` or even access programming language CLI tool like `python` or `node`.

This is using the `exec` builtin module. Similar using the `subprocess` module in Python.

- [exec](https://golang.org/pkg/os/exec/) in Go standard packages.


## exec

```go
out, err := exec.Command("COMMAND").Output()
```


## Example

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
