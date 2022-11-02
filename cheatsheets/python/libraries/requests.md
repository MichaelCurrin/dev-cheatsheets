# Requests

## Related

- [Resources](https://michaelcurrin.github.io/dev-resources/resources/python/libraries/web-scraping/requests.html) for requests in Dev-Resources.


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


## Data

```python
data = {'abc': 123}
requests.post(url, data=data)
```


## Headers

Custom user-agent based on the docs:

```python 
url = 'https://api.github.com/some/endpoint'
headers = {'user-agent': 'my-app/0.0.1'}

requests.get(url, headers=headers)
```


## Authorization

### Username and password

```python
url = 'https://api.github.com/user'
auth = ('my-username', 'my-password')

resp = requests.get(url, auth=auth)
```

### Token

Using [Authorization header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization).

```python
url = '...'
token = 'abcdef1234'
headers = {"Authorization": f"Bearer {token}"}

requests.post(url, headers=headers)
```


## Sessions

Persist parameters across requests.

Basic:

```python
s = requests.Session()

s.get('https://httpbin.org/cookies/set/sessioncookie/123456789')

r = s.get('https://httpbin.org/cookies')
r.text
# '{"cookies": {"sessioncookie": "123456789"}}'
```

Set attributes on the session and also on the current request:

```python
s = requests.Session()
s.auth = ('user', 'pass')
s.headers.update({'x-test': 'true'})

s.get('https://httpbin.org/headers', headers={'x-test2': 'true'})
```


## Sample

Query the GitHub API, check response data.

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
