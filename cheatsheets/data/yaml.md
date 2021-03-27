# YAML

## Resources

- Homepage: [yaml.org](https://yaml.org/)
- [YAML validator](https://codebeautify.org/yaml-validator)
- [JSON to YAML](https://onlineyamltools.com/convert-yaml-to-json) - useful to check your YAML data got interpreted as expected. The JSON will be verbose but precise/explicit.


## YAML type formatting

Use `.yml` or `.yaml` extension.

YAML files strictly should start with triple dash, but in practice this is only used sometimes.

e.g.

```yaml
my_string: Hello
```

```yaml
---
my_string: Hello
```

For a Jekyll site:

```yaml
---
my_string: Hello
---
```


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


## Data structures

YAML is a superset of JSON, so you can use JSON syntax, or the ligher YAML syntax, even without quotes.

### Arrays

Empty array.

```yaml
my_array: []
```

Two strings and an integer.

```yaml
my_array: [abc, def, 123]
my_array:
  - abc
  - def
  - 123
```

### Dictionaries

```yaml
my_dict: {} 

my_dict: { "abc": "Hello", "def": 20 } 
my_dict:
  abc: Hello
  def: 20
```
