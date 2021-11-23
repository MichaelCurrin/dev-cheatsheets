# String format

Guide to using `str.format` and f-string syntax.


## Resources

- [Python f-strings](https://realpython.com/python-f-strings/) article on RealPython site.
- [pyformat.info](https://pyformat.info/) website
    > Using `%` and `.format()` for great good!


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

Number formatting done with both styles:

```python
x = 1234

"{:10,}".format(x)
# '     1,234'

f"{x:10,}"
# '     1,234'
```


## Modifiers

The default behavior is to call `.__format__()` internally. Here we use `repr` and `str`.

If you omit the zero below, it might work or might give an error `IndexError: Replacement index 1 out of range for positional args tuple`.

### repr

Using `__repr__()`. This is similar but different to using `str`.

```python
'{0!r}'
```

Use ASCII modifier, since Python 3.

```python
'{0!a}'
```

### Example

```python
class Data:

    def __str__(self):
        return 'str'

    def __repr__(self):
        return 'repr'
        
        
'{0!s} {0!r}'.format(Data())
# 'str repr'
```

e.g.

```python
class Data:

    def __repr__(self):
        return 'räpr'
        
        
# Interactive console.
'{0!r} {0!a}'.format(Data())
'räpr r\\xe4pr'

# Printing.
print('{0!r} {0!a}'.format(Data()))
# räpr r\xe4pr
```      

With an integer, the value will appear the same.

```python
i = 2021

f"{i} {i!r} {i!a}"
# "2021 '2021' '2021'"
```

But with a string, you'll get quotes for `r` and `a`.

```python
s = '2021'

f"{s} {s!r} {s!a}"
# "2021 '2021' '2021'"
```

### Alignment

With no direction set, the default for strings it to align left. Number alignment is covered in [Numbers](#numbers).

```python
'{:CHARS}'
```

Align left.

```python
'{:<CHARS}'
```

Align right with padding.

```python
'{:>CHARS}'
```

Align center.

```python
'{:^CHARS}'
```

e.g.

```python
"{:<4}".format("ab")
'ab  '

"{:>4}".format("ab")
'  ab'

"{:^4}".format("ab")
' ab '
# Odd number for even characters mean extra space on the right.
"{:^5}".format("ab")
' ab  '
```

### Numbers

#### Align

With no spacing set, Python can't know how to align right, so there will be no padding.

If you set `d` as the type and specify total character places, you'll get aligned right by default.

```python
"{:CHARSd}"
```

e.g. Setting a total of 4 spaces, which adds two spaces before two-digit number.

```python
"{:4d}".format(42)
# '  42'

"{42:4d}"
# '  42'
```

See also [Add padding](#add-padding) below.

#### Separators

Make a long number readable using a separator like a comma.

```python
"{:SEPARATOR}"
```

e.g. Use `"{:,}"` or `"{:,d}".

```python
"{:,}".format(12345678910)
# 12,345,678,910
```

I don't know to other characters. Using `;` gives an error. And a space just adds leading space:

#### Round a float

Load Pi as our float.

```python
import math


math.pi
# 3.141592653589793
```

Default - implied as `"{:7.6f}"`. i.e. 7 digits with 6 after the decimal point.

```python
"{:f}".format(math.pi)
# '3.141593'
```

Or using f-strings.

```python
f"{math.pi:f}"
'3.141593'
```

Custom format - 3 digits, 2 after the decimal point.

```python"
"{:3.2f}".format(math.pi)
# '3.14'
```


## Add padding

For numbers, the [Alignment](#alignment) here defaults to right with `>` implied.

### Integer

Leading zeroes padding.

```python
"{:04d}".format(4)
# '0004'

'{:04d}'.format(42)
# '0042'
```

Out of interest, align left.

```python
'{:<04d}'.format(42)
'4200'
```

Use white space padding and align to right.

```python
'{:4d}'.format(42)
# '  42'
```

### Float

Leading zeroes.

```python
"{:06.2f}".format(math.pi)
# '003.14'
```
