# log

```go
import (
	"log"
)
```


## Print and exit

The docstring says this is equivalent to calling `Print()` and `os.Exit(1)`.

```go
err := foo()

if err != nil {
  log.Fatal(err)
}
```
