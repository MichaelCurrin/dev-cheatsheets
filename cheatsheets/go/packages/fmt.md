# fmt

Docs: [fmt](https://golang.org/pkg/fmt/) in standard lib.


## Basic

### Default

```
%v	the value in a default format
```

> The default format for %v is:

```
bool:                    %t
int, int8 etc.:          %d
uint, uint8 etc.:        %d, %#x if printed with %#v
float32, complex64, etc: %g
string:                  %s
chan:                    %p
pointer:                 %p
```

> For compound objects, the elements are printed using these rules, recursively, laid out like this:

```
struct:             {field0 field1 ...}
array, slice:       [elem0 elem1 ...]
maps:               map[key1:value1 key2:value2 ...]
pointer to above:   &{}, &[], &map[]
```

### Modifiers

> Maps formatted with `%v` show keys and values in their default formats.
>
> The `%#v` form (the `#` is called a "flag" in this context) shows the map in the Go source format. 

Maps are printed in a consistent order, sorted by the values of the keys.

```go
isLegume := map[string]bool{
	"peanut":    true,
	"dachshund": false,
}

fmt.Printf("%v %#v\n", isLegume, isLegume)
// map[dachshund:false peanut:true] 
// map[string]bool{"dachshund":false, "peanut":true}
```

> Structs formatted with `%v` show field values in their default formats.
>
> The `%+v` form shows the fields by name, while `%#v` formats the struct in Go source format.

```go
person := struct {
	Name string
	Age  int
}{"Kim", 22}

fmt.Printf("%v %+v %#v\n", person, person, person)
// {Kim 22}
// {Name:Kim Age:22}
// struct { Name string; Age int }{Name:"Kim", Age:22}
```


## Examples

From examples section of the docs.

```go
integer := 23

// Each of these prints "23" (without the quotes)
fmt.Println(integer)
fmt.Printf("%v\n", integer)
fmt.Printf("%d\n", integer)
```

`Println(x)` is the same as `Printf("%v\n", x)`.
