# TOML

- [Homepage](https://toml.io/)
- [Wikipedia](https://en.wikipedia.org/wiki/TOML)


## Data types

The syntax is similar Python's.

```toml
[datatypes]
my_string = "abc def"
my_int = 123
my_list = [ 123, 456 ]
my_hash = { abc = 123, def = 456 }
my_bool = true
```


## Sample

- `sample.toml`
    ```toml
    # This is a TOML document

    title = "TOML Example"

    [owner]
    name = "Tom Preston-Werner"
    dob = 1979-05-27T07:32:00-08:00

    [database]
    enabled = true
    ports = [ 8000, 8001, 8002 ]
    data = [ ["delta", "phi"], [3.14] ]
    temp_targets = { cpu = 79.5, case = 72.0 }

    [servers]

    [servers.alpha]
    ip = "10.0.0.1"
    role = "frontend"

    [servers.beta]
    ip = "10.0.0.2"
    role = "backend"
    ```


## Strings

```toml
[sample]
# Basic string.
foo_double = "bar"
foo_single = 'bar'
escaped = "newline \n backslash \\"

# Heredoc.
fizz = """buz \
  bazz \
"""
```
