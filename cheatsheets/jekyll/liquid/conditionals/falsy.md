# Falsy

{% raw %}

These are all falsy, as you would expect.

- False boolean.
    ```yaml
    my_bool: false
    ```
- Undefined variable.
- Null variable.
    ```yaml
    null_var: null
    ```
- Empty variable.
    ```yaml
    empty_var:
    ```


## Nil equivalents

These all rendered treated the same by Liquid and rendered as  `nil`.

```liquid
---
null_var: null
empty_var:
---

{{ page.undefined_var | inspect }}
{{ page.null_var | inspect }}
{{ page.empty_var | inspect }}
```

In YAML you need to define as `null`, but in Jekyll internally null values are stored as `nil`.


{% endraw %}
