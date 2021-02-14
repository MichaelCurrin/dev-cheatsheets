---
title: Functions
description: Guide to print functions in Go
---


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
print("Hello", name")
```

Equivalent in JS:

```python
name = "World"
console.log("Hello", name");
```


## Print

Same as `Println` except without the newline.


## Printf

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
