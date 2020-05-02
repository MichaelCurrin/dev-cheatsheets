# Read and write cheatsheet

## Read text file

```python
with open(path) as f_in:
    text = f_in.read()
```

Use `f.seek(0)` to reset if you need to read the entire file multiple times.

Read line by line. This is more memory efficient.

```python
with open(path) as f_in:
    for line in f_in:
        print(line)
```

## Write text file

```python
with open(path, 'w') as f_out:
    f_out.write('foo\n')
    f_out.write('bar\n')
```

```python
my_list = ["foo", "bar"]
with open(path, 'w') as f_out:
    f_out.writelines(my_list)
```

Example path values:

- `text.txt`
- `foo/bar.txt`
- An absolute path


## Write JSON file

```python
with open(path, 'w') as f_out:
    json.dump(data, f_out)
```

## Write CSV file

```python
header = ["Foo", "Bar"]
rows = [["foo", "bar"], ["fizz", "buzz"]]
with open(path, 'w') as f_out:
    writer = csv.writer(f_out)
    write.writerow(header)
    write.writerows(rows)
```


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


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1ODY3MDkyMF19
-->