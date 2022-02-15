# Requests

See the [Docs](https://docs.python-requests.org/en/master/)


## Basic

```python
resp = requests.get("https://httpbin.org/get")
resp.json()
# { ... }
```

## Auth

```python
url = 'https://api.github.com/user'
auth = ('my-username', 'my-password')

resp = requests.get(url, auth=auth)
```

## Sample

```python
url = 'https://api.github.com/user'
resp = requests.get(url)

resp.status_code
# 200
resp.headers['content-type']
# 'application/json; charset=utf8'
resp.encoding
# 'utf-8'

resp.text
# '{"type":"User"...'
resp.json()
# {'private_gists': 419, 'total_private_repos': 77, ...}
```
