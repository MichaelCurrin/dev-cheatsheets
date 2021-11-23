# HTML escape


See [Escaping HTML][] in the Python Wiki

[Escaping HTML]: https://wiki.python.org/moin/EscapingHtml


## CGI

```python
import cgi

s = cgi.escape( """& < >""" )   # s = "&amp; &lt; &gt;"
```


## HTML

```python
import html


s = html.escape( """& < " ' >""" )   # s = '&amp; &lt; &quot; &#x27; &gt;'
```
