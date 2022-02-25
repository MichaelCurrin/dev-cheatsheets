# Loops

## for loop

### C-style

Variables declared in for and if are local to their scope.

```go
for x := 0; x < 3; x++ {
    fmt.Println("iteration", x)
}
```

### Iterate over an object

You can use `range` to iterate over an array, a slice, a string, a map, or a channel.

`range` returns one (channel) or two values (array, slice, string and map).

### Map of key-values pairs.

```go
my_map := map[string]int{"one": 1, "two": 2, "three": 3}

for key, value := range my_map {
    fmt.Printf("key=%s, value=%d\n", key, value)
}
```

### Slice

Unpack as index and value. Or use an underscore for index if you don't need it.

```go
my_slice = []string{"Bob", "Bill", "Joe"}

for _, name := range my_slice {
    fmt.Printf("Hello, %s\n", name)
}
// Bob
// Bill
// Joe

for i, v := range my_slice {
    fmt.Println(i, v)
}
// 0 Bob
// 1 Bill
// 2 Joe
```


## while loop

Use `for` without anything after.
```go
for { 
    // ...
}
```
    
## Keywords

- `break`
- `contine`
