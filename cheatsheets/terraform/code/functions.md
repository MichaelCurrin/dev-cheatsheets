# Functions

See [Built-in functions](https://www.terraform.io/docs/configuration/functions.html) in the docs.

> ... call from within expressions to transform and combine values


## Numeric

- `abs`
- `ceil`
- `floor`
- `log`
- `max`
- `min`
- `parseint`
- `pow`
- `signum`

```terraform
> max(5, 12, 9)
12
```

## String functions

- `chomp`
- `format`
- `formatlist`
- `indent`
- `join`
- `lower`
- `regex`
- `regexall`
- `replace`
- `split`
- `strrev`
- `substr`
- `title`
- `trim`
- `trimprefix`
- `trimsuffix`
- `trimspace`
- `upper`

Using the `regex` function in the console.

```
> regex("www.(.+)", "www.foo.com")
[
  "foo.com",
]
```

## Timestamp

[Timestamp](https://www.terraform.io/docs/configuration/functions/timestamp.html) docs.

```console
> timestamp()
2018-05-13T07:44:12Z
```

```tf
{
  foo = "bazz"  
  bar = timestamp()
}
```
