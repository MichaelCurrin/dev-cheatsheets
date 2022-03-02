# HTTP requests

Note you can't run this on the Go Playground due to network restrictions.

## GET


```go
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
)

func main() {
	u := "https://httpbin.org/get"

	resp, err := http.Get(u)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	fmt.Println(resp.StatusCode)
	fmt.Println(resp.Status)
	fmt.Println(resp.ContentLength)

	var sb strings.Builder

	content, _ := ioutil.ReadAll(resp.Body)
	byte_count, _ := sb.Write(content)

	fmt.Println(byte_count)
	fmt.Println(sb.String())
}
```

```console
$ go run main.go
200
200 OK
274
274
{
  "args": {},
  "headers": {
    "Accept-Encoding": "gzip",
    "Host": "httpbin.org",
    "User-Agent": "Go-http-client/2.0",
    "X-Amzn-Trace-Id": "Root=1-621ddef5-48e717454e408fed0992ce8a"
  },
  "origin": "165.255.122.197",
  "url": "https://httpbin.org/get"
}
```


## POST

Make sure to print content as a string with `Printf` - if you use you use `Println` you'll get bytes.

```go
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
)

func main() {
	u := "https://httpbin.org/post"

	respBody := strings.NewReader(`
		{
			"foo": "bar",
			"fizz": "buzz"
		}
	`)

	resp, err := http.Post(u, "application/json", respBody)
	if err != nil {
		panic(err)
	}

	content, _ := ioutil.ReadAll(resp.Body)
	defer resp.Body.Close()
	fmt.Printf("%s\n", content)
}
```


```console
$ go run main.go
{
  "args": {}, 
  "data": "\n\t\t{\n\t\t\t\"foo\": \"bar\",\n\t\t\t\"fizz\": \"buzz\"\n\t\t}\n\t", 
  "files": {}, 
  "form": {}, 
  "headers": {
    "Accept-Encoding": "gzip", 
    "Content-Length": "45", 
    "Content-Type": "application/json", 
    "Host": "httpbin.org", 
    "User-Agent": "Go-http-client/2.0", 
    "X-Amzn-Trace-Id": "Root=1-621de218-5bc6f4d6284a49792fee5772"
  }, 
  "json": {
    "fizz": "buzz", 
    "foo": "bar"
  }, 
  "origin": "165.255.122.197", 
  "url": "https://httpbin.org/post"
}
```

If you want to work with the data in the response, you'll need to add a struct for the response type. Note `JSON` is the attribute here because HTTPBin returns `"json"` as a key with an object in it.

Recommended - use [JSON to Go](https://mholt.github.io/json-to-go/) to generat the struct from sample JSON.

```go
package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
)

type Response struct {
	Args struct {
	} `json:"args"`
	Data  string `json:"data"`
	Files struct {
	} `json:"files"`
	Form struct {
	} `json:"form"`
	Headers struct {
		AcceptEncoding string `json:"Accept-Encoding"`
		ContentLength  string `json:"Content-Length"`
		ContentType    string `json:"Content-Type"`
		Host           string `json:"Host"`
		UserAgent      string `json:"User-Agent"`
		XAmznTraceID   string `json:"X-Amzn-Trace-Id"`
	} `json:"headers"`
	JSON struct {
		Fizz string `json:"fizz"`
		Foo  string `json:"foo"`
	} `json:"json"`
	Origin string `json:"origin"`
	URL    string `json:"url"`
}

// PrettyPrint Print struct in a readable way
func PrettyPrint(i interface{}) string {
	s, _ := json.MarshalIndent(i, "", "\t")

	return string(s)
}

func main() {
	u := "https://httpbin.org/post"

	respBody := strings.NewReader(`
		{
			"foo": "bar",
			"fizz": "buzz"
		}
	`)

	resp, err := http.Post(u, "application/json", respBody)
	if err != nil {
		panic(err)
	}

	content, _ := ioutil.ReadAll(resp.Body)
	defer resp.Body.Close()

	var result Response
	if err := json.Unmarshal(content, &result); err != nil {
		fmt.Println("Can not unmarshal JSON")
	}
    // Full struct.
	fmt.Println(PrettyPrint(result))

	// Map of your response data.
	fmt.Println(result.JSON)
}
```

```
{
        "args": {},
        "data": "\n\t\t{\n\t\t\t\"foo\": \"bar\",\n\t\t\t\"fizz\": \"buzz\"\n\t\t}\n\t",
        "files": {},
        "form": {},
        "headers": {
                "Accept-Encoding": "gzip",
                "Content-Length": "45",
                "Content-Type": "application/json",
                "Host": "httpbin.org",
                "User-Agent": "Go-http-client/2.0",
                "X-Amzn-Trace-Id": "Root=1-621de61e-04c382b4412f40c936e9feb3"
        },
        "json": {
                "fizz": "buzz",
                "foo": "bar"
        },
        "origin": "165.255.122.197",
        "url": "https://httpbin.org/post"
}
{buzz bar}
```

