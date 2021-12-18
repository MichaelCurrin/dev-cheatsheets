---
title: Strip
description: Remove characters from the start or end of a string
---


## Remove whitespace

The default.

Remove any whitespace (space, tab, newline) from the ends.

```python
value.strip()
```

e.g.

```python
' abc def '.strip()
# 'abc def'
```

```python
'\tabc\tdef\n'.strip()
'abc\tdef'
```


## Remove chosen character

```python
'-abc-def-'.strip('-')
# 'abc-def'
```

Note that any if there are _other_ characters on the ends, including whitespace, nothing will be stripped there.

```python
'-abc-def- '.strip('-') 
'abc-def- '
```

See below for handling tht.


## Remove multiple characters

Here we specify a dash and a space get removed.

```python
' -abc-def- '.strip('- ')
```

Here, we specify `#`, `$`, and `c` will get removed.

```python
'$#%abc'.strip('#$c')
'%ab'
```


## Strip from one side

Use `lstring` for left and `rstrip` for right.

```python
' abc '.lstrip()
# 'abc '
```

```python
' abc '.rstrip()
# ' abc'
```

You can pass a character set too:

```python
' abc '.rstrip('bc ')
# ' a'
```
