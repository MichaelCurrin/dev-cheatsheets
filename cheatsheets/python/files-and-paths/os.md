# OS library

## Get current path

### Working directory

Absolute path to directory where you are executing from.

```python
os.getcwd()
```

This is equivalent to this where `os.curdir` is `'.'`.

```python
os.path.realpath(os.curdir)
```

### Path to script

Path of the current file. e.g. `abc.py` or `foo/abc.py`.

```python
__file__
```

Though, the variable `__file__`  is **not** defined in the interactive console.

Absolute path to the current file:

```python
os.path.realpath(__file__)
```

Note that `realpath` here is **safer** than using `abspath`.

### Directory of script

If the file is in the current working directory, the result will be an empty string.

```python
os.path.dirname(__file__)
```

Absolute path to that file's directory:

```python
os.path.realpath(os.path.dirname(__file__))
```


## Check access to a path

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

The "canonical" path:

```python
os.path.realpath(path)
```

- Resolves symlinks.
- Does **not** resolve `~`.

### Relative

Convert to relative:

```python
os.path.relpath(path)
```

### Expand user path

```python
os.path.expanduser("~/file.txt")
```


## Join

```python
os.path.join(foo, bar)
```

## Split

### Get directory

Of a file:

```python
os.path.dirname('foo/bar/baz.txt')
# => 'foo/bar'
```

Of a directory:

```python
os.path.dirname('foo/bar')
# => 'foo'
```

Note if it ends in forwardslash it will just remove that.

```python
os.path.dirname('foo/bar/')
# => 'foo/bar'
```

### Base

Get the last part of a path - whether a directory or filename.


```python
os.path.basename('foo/bar/baz.txt')
# => 'baz.txt'
```

```python
os.path.basename('foo/bar')
# => 'bar'
```

If ending in forwardslash is empty.

```python
os.path.basename('foo/bar/')
# => ''
```


## Traverse

### Parent directory

Get the parent directory of a file or directory:

```python
os.path.dirname(path)
```

If you need to get the symbol for parent directory"

```python
os.path.pardir
# => '..'
```
