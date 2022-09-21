# Requests

See the [requests package's docs](https://docs.python-requests.org/en/master/)


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


## Query parameters

Based on the docs:

```python
params = {
  'key1': 'value1', 
  'key2': 'value2'
}
resp = requests.get('https://httpbin.org/get', params=params)
```

You can see that the URL has been correctly encoded by printing the URL:

```python
resp.url
https://httpbin.org/get?key2=value2&key1=value1
```


## Headers

Custom user-agent based on the docs:

```python 
url = 'https://api.github.com/some/endpoint'
headers = {'user-agent': 'my-app/0.0.1'}
requests.get(url, headers=headers)
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
