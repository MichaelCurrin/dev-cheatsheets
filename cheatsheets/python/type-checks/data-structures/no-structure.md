# No structure

Using parameters only.

For some cases you might be okay without a naming a structure as a type. Go for a simpler approach of just using a function expecting 2 or 3 named parameters with types.

```python
def foo(name: str, age: int, height: Optional[float]): -> None
    print(name)
    print(age >= 18)
    print(height)
```

If there are more fields and if you want to use the type outside the function, rather make a type or class, like `Person`.
