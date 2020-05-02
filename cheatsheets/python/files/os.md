# OS library

## Get current path

### Working directory

Absolute path to directory where you are executing from.

```python
os.getcwd()
```

This seems like a longer equivalent:

```python
os.path.realpath(os.curdir)
```

Where `os.durdir` is `'.'`.


### Path to script

Path of the current file. 

```python
__file__
```

NB. `__file__`  is not defined in the interactive console.

Absolute path to the current file. Note the realpath is safer than abspath.

```python
os.path.realpath(__file__)
```


## Check access to path

### exists

```python
os.path.exists(path)
```

### check

```python
# Exists
os.check(path, os.F_OK)

# Read
os.check(path, os.R_OK)

# Write
os.check(path, os.W_OK)

# Execte
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

The "canonical" path.

```python
os.path.realpath(path)
```

- Resolves symlinks.
- Does **not** resolve `~`.

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
os.path.join(foo, bar)
```

## Traverse


### Parent directory

```python
os.path.pardir(path)
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbNjY4NjIzMjddfQ==
-->