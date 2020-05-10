# YAML

## Example

```yaml
appName: appName
logLevel: WARN

AWS:
    Region: us-east-1
    Resources:
      EC2:
```

Using [confuse](https://github.com/sampsyo/confuse) library.

```python
config = confuse.Configuration('MyApp', __name__)

config['AWS']['Lambda']['Runtime'].get()
```

Otherwise use `PyY
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTE2ODU1ODM1M119
-->