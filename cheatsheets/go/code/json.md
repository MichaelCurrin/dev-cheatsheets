# JSON

## Encode to JSON

```go
package main

import (
	"encoding/json"
	"fmt"
)

type Person struct {
	Name      string
	Age       int
	FavColors []string
}

func main() {
	people := []Person{
		{"John", 23, nil},
		{"Jane", 55, []string{"purple", "blue", "yellow"}},
	}

	result, err := json.Marshal(people)
	if err != nil {
		panic(err)
	}
	// Remember to stringify bytes.
	fmt.Printf("%s\n", result)
}
```
```
[{"Name":"John","Age":23,"FavColors":null},{"Name":"Jane","Age":55,"FavColors":["purple","blue","yellow"]}]
```

Indent output:

```go
result, err := json.MarshalIndent(people, "", "\t")
// ...
```

```json
[
        {
                "Name": "John",
                "Age": 23,
                "FavColors": null
        },
        {
                "Name": "Jane",
                "Age": 55,
                "FavColors": [
                        "purple",
                        "blue",
                        "yellow"
                ]
        }
]
```

### Update fields

Add names for fields with JSON annotations.

```go
type Person struct {
	Name      string   `json:"name"`
	Age       int      `json:"age"`
	FavColors []string `json:"fav_colors"`
}
```

```json
[
        {
                "name": "John",
                "age": 23,
                "fav_colors": null
        },
        {
                "name": "Jane",
                "age": 55,
                "fav_colors": [
                        "purple",
                        "blue",
                        "yellow"
                ]
        }
]
```

Make age private and omit last field if empty:

```go
type Person struct {
	Name      string   `json:"name"`
	Age       int      `json:"-"`
	FavColors []string `json:"fav_colors, omitempty"`
}
```

```json
[
        {
                "name": "John"
        },
        {
                "name": "Jane",
                "fav_colors": [
                        "purple",
                        "blue",
                        "yellow"
                ]
        }
]
```


## Decode from JSON

If you know the structure of the response data, use a [Struct](#struct), otherwise use a [Map](#map).
### Struct

```json
package main

import (
	"encoding/json"
	"fmt"
)

type Person struct {
	Name      string   `json:"name"`
	Age       int      `json:"age"`
	FavColors []string `json:"fav_colors,omitempty"`
}

func main() {
	person_data := []byte(`
		{
			"name": "Jane",
      "age": 44,
			"fav_colors": [
					"purple",
					"blue",
					"yellow"
			]
		}
	`)

	var p Person

	valid := json.Valid((person_data))
	if valid {
		json.Unmarshal(person_data, &p)
		fmt.Printf("%#v\n", p)
	}
}
```
```go
main.Person{Name:"Jane", Age:44, FavColors:[]string{"purple", "blue", "yellow"}}
```

### Map

```go
package main

import (
	"encoding/json"
	"fmt"
)

func main() {
	person_data := []byte(`
		{
			"name": "Jane",
			"age": 44,
			"fav_colors": [
					"purple",
					"blue",
					"yellow"
			]
		}
	`)

	var m map[string]interface{}

	json.Unmarshal(person_data, &m)
	fmt.Printf("%#v\n", m)

	for k, v := range m {
		fmt.Println(k, v)
	}
}
```

```
map[string]interface {}{"age":44, "fav_colors":[]interface {}{"purple", "blue", "yellow"}, "name":"Jane"}
name Jane
age 44
fav_colors [purple blue yellow]
```

Check the types:

```go
for k, v := range m {
  fmt.Printf("%v - %v (%T)\n", k, v, v)
}
```

```
name - Jane (string)
age - 44 (float64)
fav_colors - [purple blue yellow] ([]interface {})
```
