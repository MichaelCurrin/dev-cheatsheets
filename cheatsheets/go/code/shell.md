---
title: Shell
description: Execute a shell command within a Go script
---

Set up a shell command as a string and run it. You could run a shell command like `date` or even access programming language CLI tool like `python` or `node`.

This is using the `exec` builtin module. Similar to using the `subprocess` module in Python.

See [exec](https://golang.org/pkg/os/exec/) package in Go's standard packages.


## Syntax

### Import

```go
import (
  "os/exec"
)
```

### Command

You could pass something simple like `"ls"` or with arguments like `"ls -l"`.

```go
cmd := exec.Command("COMMAND")
```

The result will be of type `exec.Cmd`.

You will get an error on invalid command if you have spaces in your command. So use spaces:

```go
exec.Command("ls")
exec.Command("ls", "-l")
exec.Command("bash", "greet.sh")
```

### Run

If you don't care about the output.

```go
exec.Command("COMMAND").Run()
```

Or

```go
cmd := exec.Command("COMMAND").
cmd.Run()
```


### Output

```go
output, err := exec.Command("COMMAND").Output()
```

Use `.Output()` to get stdout.

Use `.CombinedOutput()` to get stdout and stderr.


## Examples

### Run without checking output

```go
cmd := exec.Command("firefox")

err := cmd.Run()

if err != nil {
    log.Fatal(err)
}
```

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
output, err := exec.Command("COMMAND".Output()

if err != nil {
    log.Fatal(err)
}

fmt.Printf("Output is %s\n", output)
```
