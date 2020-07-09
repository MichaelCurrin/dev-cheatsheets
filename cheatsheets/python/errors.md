---
title: Errors
---


## Catch and re-raise

```python
        try:
            foo = "My foo"
            bar(foo)
        except Exception:
            print(f"Foo: {foo}")
            raise
```
