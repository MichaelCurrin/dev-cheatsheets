# URL encoding

Convert characters in a URL to be "percent encoded", or reverse them.

e.g. `#` becomes `%23`.

## HTML

- [w3schools.com/tags/ref_urlencode.ASP](https://www.w3schools.com/tags/ref_urlencode.ASP) - Reference table and conversion tool. Note the form tool will not convert certain characters like `-` or `.`, nor will JS `EncodeURIComponent`.
- [url-encode-decode.com](https://www.url-encode-decode.com/) - Conversion tool
- [urlencoder.org](https://www.urlencoder.org/) - Conversion tool


## Javascript

- `encodeURI`
    - Encode an entire URL. Preserves the domain and characters like `?` and `=`.
    - See [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) or [W3 schools](https://www.w3schools.com/jsref/jsref_encodeuri.asp).
    - Note escaped:
        ```
        A-Z a-z 0-9 ; , / ? : @ & = + $ - _ . ! ~ * ' ( ) #
        ```
- `encodeURIComponent`
    - Encode piece of a URL.
    - See [source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent)
- `decodeURI`
    - Reverse an encoded URL.
- `decodeURIComponent`
    - Reverse an encoded piece of a URL.

Example:

```javascript
> encodeURI('https://example.com?q=Hello, world!')
"https://example.com?q=Hello,%20world!"

// If you actually want a character comma to be encoded and not skipped, you would use this and then build the URL.
> encodeURIComponent('Hello, world!')
"Hello%2C%20world!"

> decodeURI("Hello,%20world!")
"Hello, world!"

> decodeURI("https://example.com?q=Hello,%20world!")
"https://example.com?q=Hello, world!"
```


## Python

This is all for Python 3.

```python
>> import urllib.parse
>>> urllib.parse.quote_plus('Hello, world!')
'Hello%2C+world%21'
```

This can be set as a Bash alias.

```sh
$ alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]));"'

$ urlencode 'Hello, world!'
Hello%2C+world%21
```
