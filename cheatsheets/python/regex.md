# Python regex cheatsheet

## Resources

- [re](https://docs.python.org/3/library/re.html) in Python3 docs


## Methods

```python
# Search string starting from the left.
re.search
# Search at beginning of string.
re.match
# If the whole string matches the regular expression pattern
re.fulltext

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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU0NDkzMDE0XX0=
-->