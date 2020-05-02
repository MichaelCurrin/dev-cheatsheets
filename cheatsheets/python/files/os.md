
# OS library


## Expand user path

```python
os.path.expanduser("~/file.txt")
```

## Check access to path

### exists

```python
os.path.exists(path)
```

### check

```python
os.check(path, mode)
```

Where mode is one of:

- Exists: `os.F_OK`
- Read: `os.R_OK`
- Write: `os.W_OK`
- Execute: `os.X_OK`


<!--stackedit_data:
eyJoaXN0b3J5IjpbODAyOTc5OTc2XX0=
-->