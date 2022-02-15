# Requests

See the [Docs](https://docs.python-requests.org/en/master/)


## Sample

```python
url = 'https://api.github.com/user'
auth = ('user', 'pass')

resp = requests.get(url, auth=auth)

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
