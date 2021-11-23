# TOML

## Example


`config.toml`


```toml
[project]
foo: "Bar"
buzz: 123
version: "1.0.0"
updated: 1979-05-27T07:32:00Z

```

```python
import toml
config = toml.load('config.toml')
print(config)
```
