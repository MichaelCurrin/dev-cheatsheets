---
title: Unicode
description: Handing Unicode and bytes/ASCII
---

All the examples here are in Python 3.


## Unicode escaped characters

Start a string with `\u` to make a unicode characters using its code.

A unicode character will be displayed in human-readable form.

```python
>>> '\u003e'
'>'

>>> print('\u003e')
>
```

```python
>>> '\u00cd'
'Í'
>>> '\uabcd'
'ꯍ'
```

```python
>>> 'foo \u003e \u00cd \xf0\x9f\x98\x80 baz'
'foo > Í ð\x9f\x98\x80 baz'
```

### Raw

If you make it a raw string, then Python will escape it.

```python
>>> r'\u003e'
'\\u003e'
```

Same as above but with escaping backslash using a double backslash.

```python
>>> '\\u003e'
'\\u003e'
```

```python
>>> print(r'\u003e')
\u003e
```


## Unicode characters

Note that in Python 3, all strings are unicode strings. There is no `unicode` keyword anymore, only `str`.

An emoji:

```python
>>> '😀'
'😀'
```

### Convert from string to bytes

```python
>>> 'Hello 😀'.encode('utf-8')
b'Hello \xf0\x9f\x98\x80'
```

Here you could actually leave out `utf-8` and get the same result, but it is good to be explicit.

### Convert from bytes to string

```python
>>> b'Hello \xf0\x9f\x98\x80'.decode('utf-8')
'Hello 😀'
```

Note the unicode characters are left as is.

```python
>>> b'foo \u003e \u00cd \xf0\x9f\x98\x80 baz'.decode('utf-8')
'foo \\u003e \\u00cd 😀 baz'
```

### Encode as ASCII

Convert from string to bytes. We specify the ASCII standard, which will give an error on unicode characters which cannot be represented..

The default behavior implies `errors='strict'` and can raise an error.

```python
>>> 'Hello 😀'.encode('ascii')
# UnicodeEncodeError: 'ascii' codec can't encode character '\U0001f600' in position 6: ordinal not in range(128)
```

We can choose to replace or ignore unicode characters.

```python
>>> 'Hello 😀'.encode('ascii', errors='replace')
b'Hello ?'
```

```python
>>> 'Hello 😀'.encode('ascii', errors='ignore')
b'Hello '
```


## Codecs

Using the built-in [codecs](https://docs.python.org/3/library/codecs.html) module.

### Example

```python
>>> import codecs
>>> codecs.decode(r'\u003e', 'unicode-escape')
'>'
```

### API

Some
```
codecs.encode(obj, encoding='utf-8', errors='strict')

codecs.decode(obj, encoding='utf-8', errors='strict')
```
