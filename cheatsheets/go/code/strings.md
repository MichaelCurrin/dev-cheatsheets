# Strings

## Related

- [Strings packages][] cheatsheet for packages for basic processing and conversion of strings.

[Strings packages]: {% link cheatsheets/go/packages/strings.md %}

## Basic

```go
s := "My string"
```

### Length

```go
len(s)
```

### Iterate over characters

```go
for _, ch := range s {
    fmt.Print(string(ch), ",")
}
fmt.PrintLn()
```  

### Comparison

Use `<`, `>`, `==`, `!=` operators and get `true` or `false`.

```go
"dog" < "cat"
```

Use the compare function to get `-1`, `0`, or `1` as result.

```go
result := strings.Compare("dog", "cat")
```

Case-insensitive comparsion.

```go
strings.EqualFold("Hello", "hello")
// true
```

### Change case

```go
strings.ToUpper(s)
strings.ToLower(s)
strings.ToTitle(s)
```


## Split

### Split by whitespace

From [tutorial](https://www.golangprograms.com/how-to-split-a-string-on-white-space.html).

Using `strings.Fields` will split by spaces.

```go
strings.Fields(myString)  
```

e.g.

```go
package main
 
import (
  "fmt"
  "strings"
)
 
func main() {
  myString := "Foo bar bazz"
  myArray := strings.Fields(myString)  
  
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


### Split by character

```go
command := `ffprobe : -i "/media/Name of File.mp3" : -show_entries format=duration : -v quiet : -of csv=p=0`
parts := strings.Split(command, ":")
```


## Search

### Term

Check for entire string.

```go
strings.Contains(s, "search term")
```

### Character

Check if any of the characters appears.

```go
strings.ContainsAny(s, "abcd")
```

### Index

Find the first instance of a substring. e.g. 0 for start or -1 for not found.

```go
strings.Index(s, "fox")
```

Or `IndexAny` for characters.


### Starts and ends with

```go
strings.HasPrefix(s, "my prefix")

strings.HasSuffix(s, "my suffix")
```

### Count

Number of non-overlapping substrings occurring.

```go
strings.Count(s, "my term")
```
