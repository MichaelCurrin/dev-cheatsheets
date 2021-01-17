# Map

A map is a dynamic structure of key-value pairs. Like a hash or dictionary in other languages.


## Syntax

```
map[KEY_TYPE]VALUE_TYPE
```


## Examples 

Empty.

```go
var a map[string]int
```

With contents.

```go
b := map[string]int{ "foo": 10, "bar": 123 }
```

Update.

```go
b["bazz"] = 999
```
