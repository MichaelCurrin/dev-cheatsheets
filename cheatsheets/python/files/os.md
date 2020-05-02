
# OS library


## Check access to path

### exists

```python
os.path.exists(path)
```

### check

```python
# Exists
os.check(path, os.F_OK)

os.check(path, os.R_OK)
os.check(path, os.W_OK)
os.check(path, os.X_OK)
```

## Check type

```python
os.path.isdir(path)

os.path.isfile(path)

os.path.islink(path)

os.path.isabs(path)
```

## Format path

### Absolute

```python
os.path.abspath(path)
```

### Real

Canonical path. Resolves symlinks.

```python
os.path.realpath(path)
```

### Relative

Convert to relative.

```python
os.path.relpath(path
```

### Expand user path

```python
os.path.expanduser("~/file.txt")
```


## Join

```python
os

## Traverse


### Parent directory

```python
os.path.pardir(path)
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjExODI3NzY3Ml19
-->