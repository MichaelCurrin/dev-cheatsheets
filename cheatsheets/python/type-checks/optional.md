# Optional

For height to be optional, you could have a union using `float` and `None`. 

e.g.

```python
Union(float, None)
float | None
```

The docs say that prefered way is `Optional[float]` - see [page](https://mypy.readthedocs.io/en/latest/kinds_of_types.html).

Or just set `height=0.0` as a default as then it is never None type and the float type will be inferred.
