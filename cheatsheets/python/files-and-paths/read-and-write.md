---
title: Read and write
description: Guide to reading and writing files in Python - including text, JSON and CSVs
---


## Text

### Read text file

Such as a `.txt` file, though this will work on any file that is text (i.e. not a zip or image or binary executable).

The result is a single `str` object.

```python
with open(path) as f_in:
    text = f_in.read()
```

Get a `list` of `str` objects.

```python
with open(path) as f_in:
    text = f_in.read()
    lines = text.splitlines()
    
print(len(lines))
```

Note `list.splitlines` will remove newlines by default and something similar could be achived with `list.split("\n")`

Use `f.seek(0)` to reset if you need to read the entire file multiple times.

Read line by line as you need a line. This is usually more memory efficient than reading the entire file into memory.

```python
with open(path) as f_in:
    for line in f_in:
        print(line)
```

### Write text file

Write a list of strings as a multi-line file.

```python
my_list = [
  "Line 1 contents.", 
  "And line 2."
]

with open(path, 'w') as f_out:
    f_out.writelines(my_list)
```

Write one line at a time.

```python
with open(path, 'w') as f_out:
    f_out.write('foo\n')
    f_out.write('bar\n')
```

Example path values:

- `text.txt` - same as `./text.txt`
- `foo/bar.txt` - path to file in a directory.
- An absolute path like `/home/michael/foo/bar.txt`

Don't use `~` - you need to expand that first.


## JSON

### Write JSON file

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

### Read JSON file

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



## CSVs

### Write CSV file

#### Write a list of lists

Using `csv.writer`.

```python
header = ["Foo", "Bar"]
rows = [
  ["foo", "bar"],
  ["fizz", "buzz"]
]

with open(path, 'w') as f_out:
    writer = csv.writer(f_out)
    write.writerow(header)
    write.writerows(rows)
    
print(f"Wrote to {path}, rows: {len(rows)}")
```

#### Write a list of dictionaries

Using `csv.DictWriter`.

```python
header = ["Foo", "Bar"]
rows = [
    {"Foo": "a", "Bar" 1},
    {"Foo": "b", "Bar": 2}
}

with open(path, 'w') as f_out:
    writer = csv.DictWriter(f_out, fieldnames=header)
    write.writeheader()
    write.writerows(rows)
```
