# URL

## Related

- [URL encoding][] cheatsheet

[URL encoding]: {{ site.baseurl }}{% link cheatsheets/web/html/encode-and-escape/url-encoding.md %}


## Fuctions

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

## Examples

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
