# Truthy

{% raw %}

## Tricky ones

Warning: These are all **truthy**.

- Null number.
    ```yaml
    my_int: 0
    ```
- Null string.
    ```yaml
    my_string: ''
    ```
- Null array.
    ```yaml
    my_array: []
    ```
- Null hash;
    ```yaml:
    my_hash: {}
    ```

If you come from a Python background these are all unexpected.

For a JavaScript programmer, you would be used to an empty object `[]` being truthy but you're would expect to find an empty string or number falsy, but not in Jekyll.


## Easy ones

These are the obvious values that are truthy.

```liquid
---
my_int: 123

my_str: '123'

my_array: [ 123 ]
# OR
my_array:
  - 123

my_hash: { 'a': 1 }
# OR
my_hash:
  a: 1

my_bool: true
---
```

{% endraw %}
