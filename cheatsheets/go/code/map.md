# Map

A map is a dynamic structure of key-value pairs. Like a hash or dictionary in other languages.


## Related

- [JSON][] cheatsheet for converting a JSON string to a map.

[JSON]: {% link cheatsheets/go/code/json.md %}


## Syntax

Declare:

```
map[KEY_TYPE]VALUE_TYPE
```


## Examples 

Declare empty.

```go
var a map[string]int

var b map[string]interface{}
```

Declare with contents:

```go
x := map[string]int{ "foo": 10, "bar": 123 }
```

```go
isLegume := map[string]bool{
    "peanut":    true,
    "dachshund": false,
}
```

Update:

```go
b["bazz"] = 999
```
