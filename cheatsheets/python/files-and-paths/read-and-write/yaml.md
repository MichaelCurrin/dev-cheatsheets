# YAML

> YAML is a human-friendly data serialization language for all programming languages. YAML is most often used for configuration files, but it’s also used for data exchange

Use the PyYAML library.

```sh
$ pip install PyYAML
```

```python
import yaml


with open(file_path, "r") as f:
    data = yaml.safe_load(f)

print(data)
```

Access the data as dictionary of dictionaries and lists. e.g.

```python
data['abc'][0]

data['def']['x']
```


See also [article](https://python.land/data-processing/python-yaml).
