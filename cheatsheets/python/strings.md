# Python strings cheatsheet

## Formatting

### New style

```
'{} {}'.format(foo, bar)
```

Use f-strings in Python 3.6+.

```python
f'{foo} {bar}'
```

#### Modifiers

- `repr`
	- `'{0!r}'.format(foo)`
- ASCII
	- `'{0!a}'.format(foo)`

#### Alignment

Align left.

```python
'{:10}'
'{:<10}'
```

Align right with padding.

```python
'{:>10}'
```

Align center.

```python
'{:^10}'
```

Format integer. Aligns right.

```python
'{:4d}'.format(42)
# => '  42'
```

Round a float.

```python
# Default to 7.6 values (7 total length and 6 after point).
'{:f}'.format(3.141592653589793)
# => '3.141593'

# Custom
'{:3.2f}'.format(3.141592653589793)
# => '3.14'

# Add padding.
'{:06.2f}'.format(3.141592653589793)
# => '003.14'
```


### Old style

```python
'%s  %s' % (foo, bar)
```

### Debugging

```python
logging.debug("User name: %s", name)
```


### Resources

- https://pyformat.info/
- https://www.w3schools.com/python/ref_string_format.asp


## Truncate long string

```python
import textwrap


textwrap.shorten("Hello  world!", width=12)
# => 'Hello world!'
textwrap.shorten("Hello  world!", width=11)
# > 'Hello [...]'
textwrap.shorten("Hello world", width=10, placeholder="...")
# => 'Hello...'
```

[source](https://stackoverflow.com/questions/2872512/python-truncate-a-long-string)

```python
'{:.5}'.format('xylophone')
# => 'xylop'
```


## Working with strings

### Repeating strings

```python
>>> '---'*10
'------------------------------'

>>> ['---']*10
['---', '---', '---', '---', '---', '---', '---', '---', '---', '---']

>>> print(" | ".join(['---']*10))
--- | --- | --- | --- | --- | --- | --- | --- | --- | ---
```

### Convert strings to markdown table

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

print(" | ".join(header))
print(" | ".join(['---']*len(header)))
print(" | ".join(row))
```

```markdown
a | b | c
--- | --- | ---
1 | 2 | 3
```

a | b | c
--- | --- | ---
1 | 2 | 3

### Convert strings to dict

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

row_dict = {k: v for k, v in zip(header, row)}

print(row_dict)
# {'a': '1', 'b': '2', 'c': '3'}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM3OTg0MTUwOF19
-->