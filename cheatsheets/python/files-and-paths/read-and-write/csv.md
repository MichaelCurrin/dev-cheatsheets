# CSVs

## Write CSV file

### Write a list of lists

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

### Write a list of dictionaries

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
