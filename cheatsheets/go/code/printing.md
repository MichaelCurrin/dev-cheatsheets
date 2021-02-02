# Printing

Read more on the [fmt]({{ site.baseurl }}{% link cheatsheets/go/packages/fmt.md %}) package cheatsheet.

See also [Go by Example: String Formatting](https://gobyexample.com/string-formatting)


## Print verbs

- `%v` - the value in a default format 
- `%+v` - when printing structs, the plus flag adds field names
- `%#v`	- a Go-syntax representation of the value
- `%T` - a Go-syntax representation of the type of the value


## Basic

```go
fmt.Printf("Hello")
// Hello
```


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
