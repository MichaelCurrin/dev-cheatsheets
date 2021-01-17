# Map

A map is a dynamic structure of key-value pairs. Like a hash or dictionary in other languages.


## Syntax

```
map[KEY_TYPE]VALUE_TYPE
```


## Examples 

Declare empty.

```go
var a map[string]int
```

Declare with contents.

```go
b := map[string]int{ "foo": 10, "bar": 123 }
```

```go
isLegume := map[string]bool{
    "peanut":    true,
    "dachshund": false,
}
```

Update.

```go
b["bazz"] = 999
```
