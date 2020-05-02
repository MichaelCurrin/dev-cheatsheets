# Write cheatsheet

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
with open(path, 'w') as f_out:
    writer = csv.DictWriter(f_out, fieldnames=header)
    write.writeheader)
    
    write.writerows( [["foo", "bar"], ["fizz", "buzz"])
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMDIxMTQyNTVdfQ==
-->