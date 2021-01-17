---
title: Structures
description: Understanding the `struct` type
---


## Syntax

```
struct {
  KEY_NAME VALUE_TYPE
  [...]
}[ optional instances ]
```

## Examples

```go
person := struct {
	Name string
	Age  int
}{"Kim", 22}
```

```go
point := struct {
	x, y int
}
```
