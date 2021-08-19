---
title: Errors
description: Handle errors in Go
---


## Check function

Save yourself doing 3-line checks for `err != nil` all over and use a `check` function,

```go
func check(e error) {
    if e != nil {
        panic(e)
    }
}
```

Usage:

```go
f, err := os.Open("/tmp/foo.txt")
check(err)
```


## Panic

From [Effective Go](https://golang.org/doc/effective_go#panic).

> real library functions should avoid panic.

If the problem can be masked or worked around, it's always better to let things continue to run rather than taking down the whole program. One possible counterexample is during initialization: if the library truly cannot set itself up, it might be reasonable to panic, so to speak.

```go
var user = os.Getenv("USER")

func init() {
    if user == "" {
        panic("no value for $USER")
    }
}
```


## Recover

> recover is only useful inside deferred functions.

> One application of recover is to shut down a failing goroutine inside a server without killing the other executing goroutines.

```go
func server(workChan <-chan *Work) {
    for work := range workChan {
        go safelyDo(work)
    }
}

func safelyDo(work *Work) {
    defer func() {
        if err := recover(); err != nil {
            log.Println("work failed:", err)
        }
    }()
    do(work)
}
```

> In this example, if `do(work)` panics, the result will be logged and the goroutine will exit cleanly without disturbing the others. There's no need to do anything else in the deferred closure; calling recover handles the condition completely.


## Printing errors

Based on StackCheck tool's message.

```sh
$ staticcheck -explain ST1005
```

> Error strings should not be capitalized (unless beginning with
> proper nouns or acronyms) or end with punctuation, since they are
> usually printed following other context...

So use this:

```go
fmt.Errorf("something bad")
```

Not this:

```go
fmt.Errorf("Something bad")
```

Such that this formats without a spurious capital letter mid-message.

```go
log.Printf("Reading %s: %v", filename, err)
```
