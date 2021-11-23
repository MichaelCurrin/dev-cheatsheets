# Math

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
