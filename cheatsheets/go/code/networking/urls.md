# URLs

Using built-in [net/url](https://pkg.go.dev/net/url) package.

## Parse

```go
u := "https://www.example.com:8000/my/path?foo=bar&fizz=buzz"

result, _ := url.Parse(u)

fmt.Println(result.Scheme)
fmt.Println(result.Host)
fmt.Println(result.Path)
fmt.Println(result.Port())
fmt.Println(result.RawQuery)
```

```
https
www.example.com:8000
/my/path
8000
foo=bar&fizz=buzz
```

```go
values := result.Query()
values["foo"]
// [bar]
```
And for `?foo=bar&foo=buzz`:

```
values["foo"]
// [bar buzz]
```


## Create

```go
u := &url.URL{
  Scheme:   "https",
  Host:     "www.example.com",
  Path:     "/my/path",
  RawQuery: "foo=bar&fizz=buzz",
}

s := u.String()
fmt.Println(s)

u.Host = "my-domaim.com"
s = u.String()
fmt.Println(s)
```

```
https://www.example.com/my/path?foo=bar&fizz=buzz
https://my-domaim.com/my/path?foo=bar&fizz=buzz
```

```go
values := url.Values{}

values.Add("abc", "bar")
values.Add("def", "buzz")
u.RawQuery = values.Encode()

s = u.String()
fmt.Println(s)
```

```
https://my-domaim.com/my/path?abc=bar&def=buzz
```
