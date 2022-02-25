# CLI input

Read keyboard input from the user.

There's no simple function, so you have to set up a buffered IO reader and read a line from it.

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	s, _ := reader.ReadString('\n')
	fmt.Println(s)
}
```
