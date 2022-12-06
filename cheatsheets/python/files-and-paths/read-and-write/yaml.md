# YAML

> YAML is a human-friendly data serialization language for all programming languages. YAML is most often used for configuration files, but it’s also used for data exchange

## Install package

Use the PyYAML package.

```sh
$ pip install PyYAML
```

## Read

### From file

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

### From string

```python
contents = """
abc:
  d: 1000
  e: 10
"""

data = yaml.safe_load(contents)
```



## Write

```python
import yaml

output = {
  'abc': [100, 10]
}

with open('out_file.yaml', 'w') as f:
    yaml.dump(data, f)
```
