# TOML

## Example


`config.toml`


```toml
[project]
name: "Foo"
description: "Bar"
version: "1.0.0"
updated: 1979-05-27T07:32:00Z

```

```python
import toml
config = toml.load('config.toml')
print(config)
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTUyMTU4OTI1XX0=
-->