---
title: Functions
description: Guide to functions for printing in Go
---

**Overview**

- [Println](#println)
- [Print](#print)
- [Printf](#printf)
- [Sprintf](#sprintf)
- [Fprintln](#fprintln)
- [Fprint](#fprint)


## Println

Print with **default** formatting.

> Spaces are always added between operands and a newline is appended.

```go
name := "World"
fmt.Println("Hello", name)
// Hello Gopher
```

In Python:

```python
name = "World"
print("Hello", name)
```

Equivalent in JS:

```python
name = "World"
console.log("Hello", name");
```


## Print

Same as `Println`, except without the newline.

e.g.

```go
name := "World"
fmt.Print("Hello", name)
fmt.Print("Goodbye", name)
// Hello GopherGoodbye Gopher
```


## Printf

Print with formatting specifier. See more info in [Format][].

Note use of `%v` to substitute variable inside the string.

Remember to add the newline character yourself.

```go
name := "World"
fmt.Printf("Hello %v!\n", name)
// Hello, World!
```

The `printf` name also used in C and Bash.


Equivalent in Python:

```python
name = "World"
print(f"Hello {name}")
```

Equivalent in JS:

```javascript
name = "World"
console.log(`Hello ${name}`);
```

You can use `Printf` _without_ any variables, but you have to remember to add the newline so then you are probably better off using `Println`.

```go
fmt.Printf("Hello\n")
// Hello
```

[Format]: {% link cheatsheets/go/code/printing/format.md %}


## Sprintf

This formats a string and returns it, without actually printing it.

From the docs:

```go
func Sprintf(format string, a ...interface{}) string
```

> Sprintf formats according to a format specifier and returns the resulting string.

```go
package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	const name, age = "Kim", 22
	s := fmt.Sprintf("%s is %d years old.\n", name, age)
	io.WriteString(os.Stdout, s)
}
```

## Fprintln

Print to an `io.Writer` instance.

e.g.

```go
fmt.Fprintln(os.Stdout, e) 
fmt.Fprintln(os.Stdout, "a", 12, "b", 12.0) 
```

## Fprint 

As above but without newline.
