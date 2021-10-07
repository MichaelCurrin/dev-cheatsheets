---
title: URL
description: Percent encoding values for a URL
---

This is all for Python 3.


## Related

- [URL encoding][] cheatsheet

[URL encoding]: {{ site.baseurl }}{% link cheatsheets/web/html/encode-and-escape/url-encoding.md %}


## Encode

### Quote

- [urllib.parse.quote](https://docs.python.org/3/library/urllib.parse.html#urllib.parse.quote)
- [urllib.parse.quote_plus](https://docs.python.org/3/library/urllib.parse.html#urllib.parse.quote_plus)
    > Like `quote()`, but also replace spaces with plus signs, as required for quoting HTML form values when building up a query string to go into a URL. 
    > 
    > Plus signs in the original string are escaped unless they are included in safe. It also does not have safe default to '/'.
- [urllib.parse.urlencode](https://docs.python.org/3/library/urllib.parse.html#urllib.parse.urlencode)
    - Pass key-value pairs to encode for query params in a URL. Uses `quote_plus` internally.
- [urllib.parse.parse_qs](https://docs.python.org/3/library/urllib.parse.html#urllib.parse.parse_qs)

```python
import urllib.parse
```

```python
urllib.parse.quote('Hello, world!')
# 'Hello%2C%20world%21'

urllib.parse.quote_plus('Hello, world!')
# 'Hello%2C+world%21'
```

URL params:

```python
params = {'q': 'Python URL encoding', 'abc': '134'}
urllib.parse.urlencode(params)
# 'q=Python+URL+encoding&abc=134'
```

```python
params_str = urllib.parse.urlencode({'spam': 1, 'eggs': 2, 'bacon': 0})
url = f"http://www.musi-cal.com/cgi-bin/query?{params_str}" 
```

### Decode

```python
urllib.parse.unquote('Hello%2C%20world%21')
# 'Hello, world!'
```

```python
urllib.parse.unquote_plus('Hello%2C+world%21')
'Hello, world!'
```

```python
urllib.parse.parse_qs('q=Python+URL+encoding&abc=134')
# {'q': ['Python URL encoding'], 'abc': ['134']}

urllib.parse.parse_qsl('q=Python+URL+encoding&abc=134')
# [('q', 'Python URL encoding'), ('abc', '134')]
```

Note `urlparse` won't separate query params.

```python
urllib.parse.urlparse('q=Python+URL+encoding&abc=134')
# ParseResult(scheme='', netloc='', path='q=Python+URL+encoding&abc=134', params='', query='', fragment='')

urllib.parse.urlparse('https://example.com?q=Python+URL+encoding&abc=134')
ParseResult(scheme='https', netloc='example.com', path='', params='', query='q=Python+URL+encoding&abc=134', fragment='')
```


## Alias

This can be set as a Bash alias.

```console
$ alias urlencode='python3 -c \
"import sys, urllib.parse
print(urllib.parse.quote_plus(sys.argv[1]))"
'

$ urlencode 'Hello, world!'
Hello%2C+world%21
```
