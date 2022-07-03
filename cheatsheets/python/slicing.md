---
title: Slicing
description: Strings and lists
---

## Basic 

Set start and end.

```python
>>> 'abcdef'[1:]
'bcdef'
>>> 'abcdef'[1:6]
'bcdef'
```

## Interval

The `1` at the end is implied and not nothing here:

```python
>>> 'abcdef'[1:-1:1]
'bcde'
```

Or you can get every 2nd, or 3rd element:

```python
>>> 'abcdef'[::2]
'ace'
>>> 'abcdef'[::3]
'ad'
```

Or you can get every 2nd, or 3rd element:

```python
>>> 'abcdef'[::2]
'ace'
>>> 'abcdef'[::3]
'ad'
```

Use a negative value to reverse - see below.

## Reverse

You can reverse the iterable:

```python
>>> 'abcdef'[-1:1:-1]
'fedc'
>>> 'abcdef'[::-1]
'fedcba'
```
You can use reversed function too but isn't practical for strings:

```python
>>> reversed('abcdef')
<reversed object at 0x7fc4065056a0>
>>> str(reversed('abcdef'))
'<reversed object at 0x7fc406550d30>'
>>> ''.join(reversed('abcdef'))
'fedcba'# 1 at the end is implied and not nothing here
>>> 'abcdef'[1:-1:1]
'bcde'
```


This is easier on a list:

```python
>>> reversed([1,2,3])
<list_reverseiterator object at 0x7fc4065056a0>
>>> list(reversed([1,2,3]))
[3, 2, 1]
```
Or
```python
for x in reversed(my_list)
    print(x)
```
