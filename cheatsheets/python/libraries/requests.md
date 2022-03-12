# Requests

See the [Docs](https://docs.python-requests.org/en/master/)


## Basic

```python
resp = requests.get("https://httpbin.org/get")
resp.text
# ...
```

If you want to parse JSON data to a Python object:

```python
resp.json()
# { ... }
```


## Errors

```python
resp = requests.get("https://httpbin.org/get")

if not resp.ok:
    resp.raise_for_status()
```


## Auth

```python
url = 'https://api.github.com/user'
auth = ('my-username', 'my-password')

resp = requests.get(url, auth=auth)
```


## Headers

Custom user-agent based on the docs:

```python 
url = 'https://api.github.com/some/endpoint'
headers = {'user-agent': 'my-app/0.0.1'}
requests.get(url, headers=headers)
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
