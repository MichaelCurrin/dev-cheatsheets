# fmt

Docs: [fmt](https://golang.org/pkg/fmt/) in standard lib.

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
