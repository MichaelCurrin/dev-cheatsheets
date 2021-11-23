# Primitive types

See [Type](https://yaml.org/type/) docs.


## Null

Same as in JSON.

```yaml
my_null: null
```


## Boolean

While JSON only supports `"true"` for input, there are multiple ways in YAML to get a boolean.

```yaml
my_bool: true
my_bool: True
my_bool: yes
my_bool: on
```

See [Boolean docs](https://yaml.org/type/bool.html)


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

See more info in the [Strings]({% link cheatsheets/data/yaml/strings.md %}) page.
