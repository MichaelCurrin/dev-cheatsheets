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


## Manipulation

### Split

#### Split by string

e.g.

```go
strings.Split(s, " ")
strings.Split(s, ",")
strings.Split(s, "the")
```

Recommended - use quoting of output for readability.

```go
package main

import (
	"fmt"
	"strings"
)

func main() {
	s := "my string"
	fmt.Printf("%q\n", strings.Split(s, " "))
}
```

#### Split by whitespace

From [tutorial](https://www.golangprograms.com/how-to-split-a-string-on-white-space.html).

Using `strings.Fields` will split by whitespace.

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

### Join

```go
strings.Join(myValues, " - ")
```

### Replace

```go
rep := strings.NewReplacer(".", "|")
```

Or supply multiple pairs.


```go
rep := strings.NewReplacer(".", "|", ",", "|")
```

```go
rep.Replace(s)
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


## Conversion

The most common numeric conversions are Atoi (string to int) and Itoa (int to string).

```go
i, err := strconv.Atoi("-42")
s := strconv.Itoa(-42)
```

### Parse

Convert string to other types.

Using 64-bit and base 10 (for integers).

```go
b, err := strconv.ParseBool("true")
f, err := strconv.ParseFloat("3.1415", 64)
i, err := strconv.ParseInt("-42", 10, 64)
u, err := strconv.ParseUint("42", 10, 64)
```

e.g.

```go
package main

import (
	"fmt"
	"strconv"
)

func main() {
	x := "123"
	y, _ := strconv.ParseInt(x, 10, 32)
	fmt.Printf("%v\n", y)
}
```

### Format

Convert other types to strings.

```go
s := strconv.FormatBool(true)
s := strconv.FormatFloat(3.1415, 'E', -1, 64)
s := strconv.FormatInt(-42, 16)
s := strconv.FormatUint(42, 16)
```

### Quote

Add quotes.
Unicode characters are escaped with `\u`.

```go
q := strconv.Quote("Hello, 世界")
fmt.Println("Result", q)
// Result "Hello, 世界"

q = strconv.QuoteToASCII("Hello, 世界")
fmt.Println("Result", q)
// Result "Hello, \u4e16\u754c"
```


## Bytes to string

If you print bytes you'll see something like this:

```go
fmt.Println(content)
// [123 10 32 32 34 97]
```

Use `string` function:

```go
fmt.Println(string(content))
```

Or format as a string with `Printf` instead:

```go
fmt.Printf("%s\n", content)
```
