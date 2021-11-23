# About


## Validation

Note that the Python interpreter will **not** validate the types for you.

However, you can **optionally** use a type checker like **Mypy**, which will run static type checks against all your code.

This is similar to running a linter. This can be done locally and ideally as part of your deploy flow.




## Benefits of type checking

Mypy can pick up things to alert on you, like:

- Check if a variable changes type unexpectedly. Like here:
    ```python
    x = 'hello'
    x =  2
    ```
- Making sure you don't pass a bad type e.g. pass `None` or `int` type when only `str` is allowed.
- Allow a range of types to be allowed (e.g. `None` or `int`)
- Validate types of data structures
- Create custom types to better represent concepts e.g. A `Coordinates` type which could be say a tuple of two `float` values. This makes the code easier to read especially for nested data structure. Note you don't have to pass in a class instance of `Coordinates`, you just need to pass in a tuple which matches the structure of the expected type.
