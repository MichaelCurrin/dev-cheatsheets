# Functions

## Builtin

[Builtin functions](https://www.terraform.io/docs/configuration/functions.html) from the docs


Using the `regex` function in the console.

```
> regex("www.(.+)", "www.foo.com")
[
  "foo.com",
]
```

## Timestamp

[Timestamp](https://www.terraform.io/docs/configuration/functions/timestamp.html) docs.


```
> timestamp()
2018-05-13T07:44:12Z
```

```tf
{
  foo = "bazz"  
  bar = timestamp()
}
```
