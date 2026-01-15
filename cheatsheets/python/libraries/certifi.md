# certifi

[certifi](https://pypi.org/project/certifi/) on PyPI

## Show location of `cacert.pem`

```python
import certifi

print(certifi.where())
```

```sh
$ python -m certifi
```

Override

```sh
export REQUESTS_CA_BUNDLE=$(python -m certifi)
```
