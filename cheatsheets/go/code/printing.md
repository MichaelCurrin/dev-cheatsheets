# Printing

This page summarizes some of the most likely printing scenarios you'll encounter.

Read more on the [fmt]({{ site.baseurl }}{% link cheatsheets/go/packages/fmt.md %}) package cheatsheet or the linked documentation.

See also [Go by Example: String Formatting](https://gobyexample.com/string-formatting)


## Print verbs

- `%v` - the value in a default format 
- `%+v` - when printing structs, the plus flag adds field names
- `%#v`	- a Go-syntax representation of the value
- `%T` - a Go-syntax representation of the type of the value


## Print functions

### Println

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
print("Hello", name")
```

Equivalent in JS:

```python
name = "World"
console.log("Hello", name");
```

### Print

Same as `Println` except without the newline.

### Printf

Print with format specifier.

The `printf` name also used in C and Bash.

```go
name := "World"
fmt.Printf("Hello %v!\n", name)
// Hello, World!
```

Equivalent in Python:

```python
name = "World"
print(f"Hello {name}")
```

Equivalent in JS:

```python
name = "World"
console.log(`Hello ${name}`);
```

You can use `Printf` _without_ any variables, but you have to remember to add the newline so then you are probably better off using `Println`.

```go
fmt.Printf("Hello\n")
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
