# Loops

## for loop

### C-style

Variables declared in for and if are local to their scope.

```go
for x := 0; x < 3; x++ {
    fmt.Println("iteration", x)
}
```

### Unpack object with range

You can use `range` to iterate over an array, a slice, a string, a map, or a channel.

`range` returns one (channel) or two values (array, slice, string and map).

For each pair in the map, print key and value.

```go
for key, value := range map[string]int{"one": 1, "two": 2, "three": 3} {
    fmt.Printf("key=%s, value=%d\n", key, value)
}
```

If you only need the value, use the underscore as the key.

```go
for _, name := range []string{"Bob", "Bill", "Joe"} {
    fmt.Printf("Hello, %s\n", name)
}
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
