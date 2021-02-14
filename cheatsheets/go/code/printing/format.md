---
title: Format
description: Guide to formatting text in Go
---


## Print verbs

- `%v` - the value in a default format 
- `%+v` - when printing structs, the plus flag adds field names
- `%#v`	- a Go-syntax representation of the value
- `%T` - a Go-syntax representation of the type of the value


## String variable

You can use `%v` for any variable.

Use `%s` specifically for strings or slices of bytes.

> %s	the uninterpreted bytes of the string or slice

```go
var name = "World!"
fmt.Print("Hello, %s!", name)
// Hello, World!
```


## Quote

> %q	a single-quoted character literal safely escaped with Go syntax.

```go
var name = "World"
fmt.Printf("%q", name)
// Hello, "World"!
```
