# Imports


## Single

```go
import "fmt"
import "math"
```


## Multiple packages

Note lack of comma.

```go
import (
	"fmt"
	"math"
)
```


## Levels

### Top level

```go
import "math"

math.Sqrt(7)
```

### Next level

```go
import "math/rand"

rand.Intn(10)
```

