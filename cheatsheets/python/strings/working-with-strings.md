# Working with strings


## Repeating strings

```python
>>> '---'*10
'------------------------------'

>>> ['---']*10
['---', '---', '---', '---', '---', '---', '---', '---', '---', '---']

| >>> print(" | ".join(['---']*10)) |
| ----------- | ------------------- ||  |  |  |  |  |  |  |
```


## Convert strings to a Markdown table

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

print(" | ".join(header))
print(" | ".join(['---']*len(header)))
print(" | ".join(row))
```

```markdown
| a   | b   | c   |
| --- | --- | --- |
| 1   | 2   | 3   |
```

| a   | b   | c   |
| --- | --- | --- |
| 1   | 2   | 3   |


## Convert strings to a dict

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

row_dict = {k: v for k, v in zip(header, row)}

print(row_dict)
# {'a': '1', 'b': '2', 'c': '3'}
```
