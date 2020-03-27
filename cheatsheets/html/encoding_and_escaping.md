# Encoding and escaping

How to convert text into encoded or escaped text and back.

This deals with these areas:

- [URL Encoding](#url-encoding) - For text in a webpage **URL**.
- [HTML entity escaping](#html-entity-escaping) - For the HTML **contents of a webpage**.


## URL encoding

Convert characters in a URL to be "percent encoded", or reverse them.

e.g. `#` becomes `%23`.

### HTML

- [w3schools.com/tags/ref_urlencode.ASP](https://www.w3schools.com/tags/ref_urlencode.ASP) - Reference and conversion tool 
- [url-encode-decode.com](https://www.url-encode-decode.com/) - Conversion tool 
- [urlencoder.org](https://www.urlencoder.org/) - Conversion tool

### Javascript

- `encodeURI` - encode an entire URL. Preserves the domain and characters like `?` and `=`. See [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) or [W3 schools](https://www.w3schools.com/jsref/jsref_encodeuri.asp)
- `encodeURIComponent` - encode piece of a URL. See [source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) 
- `decodeURI` - reverse an encoded URL.
- `decodeURIComponent` - reverse an encoded piece of a URL.

Example:

```
> encodeURI('https://example.com?q=Hello, world!')
"https://example.com?q=Hello,%20world!"

// If you actually want a character comma to be encoded and not skipped, you would use this and the build the URL.
> encodeURIComponent('Hello, world!')
"Hello%2C%20world!"

> decodeURI("Hello,%20world!")
"Hello, world!"


decodeURI("https://example.com?q=Hello,%20world!")
"https://example.com?q=Hello, world!"
```


### Python

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


## HTML entity escaping

In the content of HTML pages, escape certain characters.

e.g. `<` becomes `%lt;`.

- [w3schools.com/html/html_entities.asp](https://www.w3schools.com/html/html_entities.asp) - Reference and conversion tool
- [https://www.freeformatter.com/html-entities.html](https://www.freeformatter.com/html-entities.html) - Conversion tool.
