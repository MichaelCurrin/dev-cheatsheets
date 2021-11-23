# Pitfalls

Don't define data structures in function parameters. Only constants.

```python
def foo(x=[]):
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test', 'test']
```

Best practice way:

```python
def foo(x=None):
    if x is None:
        x = []
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test']
```
