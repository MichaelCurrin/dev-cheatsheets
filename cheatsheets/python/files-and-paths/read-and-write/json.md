# JSON

## Write JSON file

Write an Python object to a JSON file.

Typically the data is a `dict` or `list` object.

Indenting will add pretty printing but is optional.

```python
my_data = {
  "a": 1,
  "b": 2,
  "c": 3,
]

with open(path, 'w') as f_out:
    json.dump(my_data, f_out, indent=4)
```

If you want to display without writing to a file, use `.dumps` instead. Where `s` is for "string".

```python
print( json.dumps(data, indent=4) )
```

## Read JSON file

Convert a JSON file into a Python object, typically of `dict` or `list` type.

```python
with open(path) as f_out:
    my_data = json.load(f_out)
```

If you want to load from a string object instead of a file, using `.loads` where `s` is for "string".

```python
my_json_str = '{ "a": 1, "b": 2, "c": 3 }'

with open(path) as f_out:
    my_data = json.loads(my_json_str)
```
