---
title: Format
description: Guide to formatting text in Go
---


## General


- `%v` - the value in a default format.
- `%+v` - when printing structs, the plus flag adds _field_ names.
- `%#v`	- a Go-syntax representation of the value.
- `%T` - a Go-syntax representation of the _type_ of the value.


## String variable

You can use `%v` for any variable.

Use `%s` specifically for strings or slices of bytes.

> `%s`	the uninterpreted bytes of the string or slice

```go
var name = "World!"
fmt.Printf("Hello, %s!", name)
// Hello, World!
```


## Quote

> `%q`	a single-quoted character literal safely escaped with Go syntax.

```go
var name = "World"
fmt.Printf("%q", name)
// Hello, "World"!
```


## Numeric

- Decimal `%d`
- Floating point `%f`
- Scientific notation `%e`

### Precision

Decimal precision - here two decimal places.

```go
"%.2f"
// 123.46
```

Total width - here 10.

```go
"%10f"
// 123.456700
```

Padding (total length here is always at least 10 and will have spaces) and precision (2 decimal places again)

```go
"%10.2f"
//     123.46
// ^^^^
```

Always add a plus sign.

```go
"%+10.2f"
//    +1234.567891
// ^^^^
```

Padding with zeroes.

```go
"%010.2f"
// 00001234.56
// ^^^^
```


## Boolean

- `%t` - the world true or false


## Indexes

Basic:

```go
fmt.Printf("%d %d\n", 12, 45")
```

Explicit indices - starting at one.

```go
fmt.Printf("%[2]d %[1]d\n", 12, 45")
```

Reuse a value and adding octal and hexidecimal:

```go
fmt.Printf("%d %#[1]o %#[1]x\n", 12")
// 12 014 0xc
```

Without the hash it still works but doesn't look as good:

```go
fmt.Printf("%d %[1]o %[1]x\n", 12)
// 12 14 c
```


## Structs

```go
package main

import "fmt"

type circle struct {
	radius int
	border int
}

func main() {
	c := circle{
		radius: 20,
		border: 5,
	}
    
	fmt.Printf("%v\n", c)
	fmt.Printf("%+v\n", c)
	fmt.Printf("%T\n", c)
}

// {20 5}
// {radius:20 border:5}
// main.circle
```
