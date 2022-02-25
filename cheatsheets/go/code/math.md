---
title: Math

description: Mathemetical operations
---


## Constants

```go
math.Pi
math.E
```


## Square root

```go
math.Sqrt(my_float)
```

Note use of float here to avoid error.

```go
package main

import (
	"fmt"
	"math"
)

func main() {
	n := 2.0
	fmt.Printf("Number %v Square root %v", n, math.Sqrt(n))
}
```

If you pass inline without a variable, an integer is allowed as Go can infer it should be a float.

```go
package main

import (
	"fmt"
	"math"
)

func main() {
	fmt.Printf("Number 2 Square root %v", math.Sqrt(2))
}
```


## Cube root

```go
math.Cbrt(value)
```


## Round

```go
math.Round(value)
math.Ceil(value)
math.Floor(value)
```

Remove decimal places.

```go
math.Trunc(value)
```

## Max and min

```go
math.Max(value1, value2)
math.Min(value1, value2)
```

## Modulus

For integers:

```go
17 % 5
```

For floats:

```go
math.Mod(17.0, 5.0)
```


## Absolute

```go
math.Abs(value)
```


## Raise to the power

```go
math.Power(value, 2.0)
```



