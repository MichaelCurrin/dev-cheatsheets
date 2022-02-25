# Random

## Random numbers

### Seed

Use a random seed to get a truly random number not a pseudo random number. Also, if you don't do this, then your app will get the _same_ value for the random calls each time.

```go
rand.Seed(time.Now().UnixNano())
```

This works well locally but on the official Go playground it gives the same results each time. Maybe a better seed is needed.

### Integer

```go
rand.Int()
rand.Intn(10)
```

```go
rand.Float32()
rand.Float64()
```


## Permutations

Provide an integer and get a slice with shuffled values from zero to that value (exclusive).

```go
x := rand.Perm(6)
// [ 0 1 3 5 4 2 ]
```

Get permutations of an array.

```go
package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	s := []string{"apple", "pear", "grape", "banana", "peach", "grapefruit"}

	indexes := rand.Perm(len(s))

	for _, v := range indexes {
		fmt.Println(s[v])
	}
}
```

```sh
$ go run main.go
```

Sample output:

```
pear
grapefruit
banana
peach
apple
grape
```

```
apple
banana
pear
peach
grape
grapefruit
```
