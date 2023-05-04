# CSV

Do this import and set up a `path` for all examples below:

```python
import csv


path = "demo.csv"
```


## Resources

- [csv](https://docs.python.org/3/library/csv.html) module in docs.

## Newlines

To avoid issues with newlines, especially when writing out, it is a good ideas as per the documentation to specify an empty newline character before making your reader or writer object:

```python
with open('some.csv', newline='') as f:
    # ...
```

## Read CSV file

Given data:

```
First,Second,Third
abc,def,123
xyz,,1000
```

### Read as a list of lists

Using `csv.reader`:

This approach will return each row as a list. You need to reference the columns by index. This is fragile as if the columns are reordered or deleted then you'll get the wrong data.

```python
with open(path, newline='') as f_in:
    reader = csv.reader(f_in)
```

Data will be like this:

```python
['First', 'Second', 'Third']
["abc", "def", 123]
['xyz', '', '1000']
```

### Read as a list of dictionaries

Using `DictReader`.

This approach is robust - the fields will be _inferred_ from the first line of the CSV, or you can override them or set them if they are missing. Then you can reference cell values on each row by field name, rather than by index. This is stable even if the columns are reordered or columns are deleted.

```python
with open(path) as f_in:
    reader = csv.DictReader(f_in)
```

```python
reader.fieldnames
# ['First', 'Second', 'Third']
```

Here are two rows as dictionaries:

```python
{'First': 'abc', 'Second': 'def', 'Third': '123'}
{'First': 'xyz', 'Second': '', 'Third': '1000'}
```

### Iterate

A few ways to iterate when reading a CSV.

- Using `list` to read the entire file. This is not memory-efficient, but useful if you want to read the whole file first and then do operations on the data to say filter, reorder, or transform, in the Functional Programming style.
    ```python
    with open(path) as f_in:
        reader = csv.reader(f_in)
        csv_rows = list(reader)

    len(csv_rows)
    # 3
    ```
- `for` loop on the iterator. This is memory-efficient as the row is only read when it is needed. You could replace `print` with some function call that might request an API or insert into a DB.
    ```python
    with open(path) as f_in:
        reader = csv.reader(f_in)

        for row in reader:
            print(row)
            print(row[0])

    with open(path) as f_in:
        reader = csv.DictReader(f_in)

        for row in reader:
            print(row)
            print(row["First"])
    ```
- Use `next` on the iterator.
    ```python
    f_in = open(path)
    reader = csv.reader(f_in)

    reader.line_num
    # 0
    reader.dialect.delimiter
    # ','

    next(reader)
    # ['First', 'Second', 'Third']
    reader.line_num
    # 1
    next(reader)
    # ["abc", "def", 123]
    next(reader)
    ['xyz', '', '1000']
    next(reader)
    # Traceback (most recent call last):
    #   File "<stdin>", line 1, in <module>
    # StopIteration

    # Reset to the start of the file.
    f_in.seek(0)
    next(reader)
    # ['First', 'Second', 'Third']
    reader.line_num
    # 3
    ```


## Write CSV file

### Write a list of lists

Using `csv.writer`.

```python
import csv


header = ["Foo", "Bar"]
rows = [
  ["foo", "bar"],
  ["fizz", "buzz"]
]

with open(path, 'w', newline='') as f_out:
    writer = csv.writer(f_out)
    write.writerow(header)
    write.writerows(rows)

print(f"Wrote to {path}, rows: {len(rows)}")
```

You can also write individual rows:

```python
write.writerow(row)
```


### Write a list of dictionaries

Using `csv.DictWriter`.

```python
import csv


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


## Request CSV over HTTP 

```python
import csv

import requests 


CSV_URL = '' 

with requests.Session() as s:
    download = s.get(CSV_URL) 
    decoded_content = download.content.decode('utf-8') 
    reader = csv.reader(decoded_content.splitlines(), delimiter=',') 
    csv_data = list(reader) 
```
