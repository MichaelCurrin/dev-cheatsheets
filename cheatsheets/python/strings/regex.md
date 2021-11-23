# Regex


## Import

```python
import re
```

## Pattern

Compile a pattern and then use it later. This is more efficient if the pattern is reused as it just has to be compiled once.

```python
PATTERN = re.compile(r"REGEX_PATTERN")
```


## Match

Using `.search` for anywhere in the string or `.match` for the start.

```python
result = PATTERN.search(my_str)
result = PATTERN.match(my_str)
```

Or using `re` directly.

```python
result = re.search(pattern, my_str)
```
