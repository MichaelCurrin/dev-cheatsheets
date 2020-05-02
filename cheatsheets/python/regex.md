# Python regex cheatsheet

## Resources

- [re](https://docs.python.org/3/library/re.html) in Python3 docs


## Compile

It's more efficient to compile a pattern once if its going to be used.

```python
PATTERN = re.compile(r'\w)
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
eyJoaXN0b3J5IjpbMTQxMDM0ODA3OV19
-->