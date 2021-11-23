# Browser

Open a URL in the browser.

```python
url = "http://example.com"
```


## webbrowser

- [webbrowser](https://docs.python.org/3/library/webbrowser.html) standard library in the docs.
    > The webbrowser module provides a high-level interface to allow displaying web-based documents to users.
    > Under most circumstances, simply calling the `open()` function from this module will do the right thing.
    
```python
import webbrowser

webbrowser.open(url)
```


## urllib

```python
import urllib.request

resp = urllib.request.urlopen(url)
```
