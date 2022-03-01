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

	// Build content from bytes.
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
