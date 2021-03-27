# Primitive types


## Null

Same as in JSON.

```yaml
my_null: null
```


## Boolean

```yaml
my_bool: True
my_bool: False
```

Note case - `true` would be a string as `"true"`, not a boolean.

But in JSON, you do use `true`.


## Numbers

```yaml
my_int: 123
my_float: 123.4
```


## Strings

```yaml
my_string: abc def
my_string: "abc def"
my_string: |
  abc def
```

See more info in the [Strings]({{ site.baseurl }}{% link cheatsheets/data/yaml/strings.md %}) page.
