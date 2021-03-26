# YAML


## Boolean

```yaml
my_bool: True
my_bool: False
```


## Numbers

```yaml
my_int: 123
my_float: 123.4
```


## Strings

### Scalar

A scalar could by another type but only string is covered here.

Double quotes are recommended - some formatters will convert single quotes to double quotes.

```yaml
my_string: "Hello, world!"
```

Quotes are optional, even for strings with spaces. 

```yaml
my_string: Hello, world!
```

Quotes are useful when you have special characters you want to escape. 

For example, a value starting or ending with an asterisk, like a cron schedule below.

```yaml
my_string: '* 0 * * *'
```

Quotes can also prevent a value from being cast to another type.

```yaml
my_string: 'True'
my_string: '123'
```

New lines:

```yaml
my_string: "abc\ndef"
```

### Block scalars

A block scalar is similar to a string. The value starts on its own line, indented. The value is escaped, so you can use quotes and symbols easily without having to escape them.

They are especially useful for multi-line strings, but also work fine for single-line strings.

```yaml
my_string: |
  My single line string value.
  
my_string: |
  My multi-line
  string value.
```


## Data structures

YAML is a superset of JSON, so you can use JSON syntax, or the ligher YAML syntax, even without quotes.

### Arrays

```yaml
my_array: []

my_array: [abc, def, 123]
my_array:
  - abc
  - def
  - 123
```

### Dictionaries

```yaml
my_dict: {} 

my_dict: { "abc": 1, "def": 20} 
my_dict:
  abc: 1
  def: 20
```
