# Variables with types

You can specify a type on a variable, but this is optional. Also you can get the type checking benefit without adding it yourself, if the type can be inferred.

```python
# With type. This doesn't add much.
x: int = 1
# Without type specified. This will be inferred as int.
y = 2

# Initialize with type but no value. This will be the null value e.g. `0`.
z: int

# Example of initializing a null value.
child: bool
if age < 18:
    child = True
else:
    child = False
```
