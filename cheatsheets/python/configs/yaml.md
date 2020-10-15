# YAML

## Example

```yaml
foo: bar
buzz: 123

AWS:
    Region: us-east-1
    Lambda:
        Fn::GetAtt:
          - "LambdaExecutionRole"
          - "Arn"
        Runtime: "python3.7"
```

Using [confuse](https://github.com/sampsyo/confuse) library.

> Confuse allows us to interact with YAML files almost identically to how we would with JSON, with the exception that we specify .get() at the end of walking through the tree hierarchy.
>
> .get() can accept a datatype value such as int. Doing so ensures that the value we're getting is actually of the schema we're expecting, which is a neat feature.

```python
config = confuse.Configuration('MyApp', __name__)

config['AWS']['Lambda']['Runtime'].get()
```

Otherwise use `PyYAML`.
