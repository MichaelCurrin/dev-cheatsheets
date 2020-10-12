---
title: Regex
---

## Resources

- [re](https://docs.python.org/3/library/re.html) in Python3 docs


## Methods

```python
# Search string starting from the left.
re.search
# Search at beginning of string.
re.match
# If the whole string matches the regular expression pattern
re.fullmatch
# Return list.
re.findall
```


## Compile

It's more efficient to compile a pattern once if its going to be used.

```python
PATTERN = re.compile(r'\w)

PATTERN.search(my_string)
```


## Flags

- `IGNORECASE`
- `MULTILINE`
- `VERBOSE`
- `DOTALL`
- `DEBUG`

e.g.
```
re.search(flags=re.IGNORECASE)
```

## Matching groups

From docs.

### Group

```python
>>> m = re.match(r"(\w+) (\w+)", "Isaac Newton, physicist")
>>> m.group(0)       # The entire match
'Isaac Newton'
>>> m.group(1)       # The first parenthesized subgroup.
'Isaac'
>>> m.group(2)       # The second parenthesized subgroup.
'Newton'
>>> m.group(1, 2)    # Multiple arguments give us a tuple.
('Isaac', 'Newton')
```

### Groups

```
>>> m = re.match(r"(\d+)\.(\d+)", "24.1632")
>>> m.groups()
('24', '1632')
```

Make group optional.

```python
>>> m = re.match(r"(\d+)\.?(\d+)?", "24")
>>> m.groups()      # Second group defaults to None.
('24', None)
>>> m.groups('0')   # Now, the second group defaults to '0'.
('24', '0')
```

### Groupdict

```python
>>> m = re.match(r"(?P<first_name>\w+) (?P<last_name>\w+)", "Malcolm Reynolds")
>>> m.groupdict()
{'first_name': 'Malcolm', 'last_name': 'Reynolds'}
```

## Slugs

### Convert to slug

```python
slug = re.sub(r'[\W_]+', '-', text.lower())
```

For more robust solution including handling special characters, see

- [SO answers](https://stackoverflow.com/questions/5574042/string-slugification-in-python)
- `python-slugify`

### Match a slug

[source](https://www.regextester.com/104056)

`r'^[a-z0-9]+(?:-[a-z0-9]+)*$'`
