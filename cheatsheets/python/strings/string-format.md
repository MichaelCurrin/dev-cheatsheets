# String format

Guide to using `str.format` and F-string syntax.


## Resources

- [Python f-strings](https://realpython.com/python-f-strings/) article on RealPython site.
- [pyformat.info](https://pyformat.info/) website - "Using % and .format() for great good!".


## Basics

### Implied order

```python
"{} {}".format(foo, bar)
```

### Explicit order

```python
"{0} {1}".format(foo, bar)
```

### Named parameters

```python
"{foo} {bar}".format(foo=foo, bar=bar)
```

### F-string

The rules of the `str.format` approach work with the newer F-string syntax, introduced in Python 3.6. This replaces the need for the older named parameters approach above.

```python
f"{foo} {bar}"
```


## Modifiers

Using `repr`.

```python
'{0!r}'.format(foo)
```

Using ASCII
```python
'{0!a}'.format(foo)
```

### Alignment

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

### Numbers

#### Format integer

Aligns right.

```python
'{:4d}'.format(42)
# => '  42'
```

#### Separators

Make a long number readable with a comma separator.

```python
>>> "{:,}".format(12345678910)
```
```
12,345,678,910
```

#### Round a float

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
