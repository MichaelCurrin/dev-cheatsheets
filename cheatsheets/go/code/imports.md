# Imports


## Resources

- [Import in GoLang](https://golangdocs.com/import-in-golang) from GoDocs.


## Import directly

### Individual packages

```go
import "fmt"
import "math"
```

### Grouped imports

Note lack of comma.

```go
import (
	"fmt"
	"math"
)
```


## Nested imports

### Top level

```go
import "math"

math.Sqrt(7)
```

### Next level

Get the `rand` submodule inside the `math` package.

```go
import "math/rand"

rand.Intn(10)
```

Note you cannot use a submodule without importing it directly. This will give an error.

```go
import "math"

math.rand.Int(10)
```

Though in other languages like Python, that is allowed.


## Aliases

```go
import f "fmt"

f.Println("Hello, World"!) 
```


## Import into current namespace

This has some drawbacks, so avoid using this.

```go
import . "fmt"

Println("Hello, World!")
```


## Blank import

Avoid error on unused import by using an underscore.

```go
import _ "os"
```
