# Strings


## Split by whitespace

From [tutorial](https://www.golangprograms.com/how-to-split-a-string-on-white-space.html).

Using `strings.Fields` will split by spaces.

```go
package main
 
import (
  "fmt"
  "strings"
)
 
func main() {
  myString := "Foo bar bazz"
  myArray := strings.Fields(myArray)  
  
  fmt.Println(myArray)
  
  for _, v := range myArray {    
    fmt.Println(v)
  }
}
// Foo
// bar
// bazz
```

If you just print `myArray`, it appears to only have on element but that's just a representation issue because of lack of commas.


## Split by character

```go
command := `ffprobe : -i "/media/Name of File.mp3" : -show_entries format=duration : -v quiet : -of csv=p=0`
parts := strings.Split(command, ":")
```
