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

## Override

You can set the `REQUESTS_CA_BUNDLE` or `SSL_CERT_FILE` environment variable to point to a custom bundle that you create containing both certifi's default certs and your new ones.
This is often a safer approach than modifying certifi's installed file directly, especially in shared environments.


```sh
export REQUESTS_CA_BUNDLE=$(python -m certifi)
export SSL_CERT_FILE=$(python3 -m certifi)
```

Or set manually, from [SO](https://stackoverflow.com/q/77442172).

```sh
export SSL_CERT_DIR=/etc/ssl/certs/
# OR
export SSL_CERT_FILE=/etc/ssl/certs/your_cert.pem
````
