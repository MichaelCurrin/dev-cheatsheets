# Data structures

YAML is a superset of JSON, so you can use JSON syntax, or the ligher YAML syntax, even without quotes.


## Arrays

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


## Dictionaries

```yaml
my_dict: {} 

my_dict: { "abc": "Hello", "def": 20 } 
my_dict:
  abc: Hello
  def: 20
```
