# Base64

## Encode

"Binary" to "ASCII" i.e. JS object to plain ASCII characters.

```javascript
btoa(value)
```

If you want to store an array or hash or some other object that is not a string, use this.

```javascript
btoa(JSON.stringify(value))
```

Just don't use that on a string otherwise you'll put double quotes in the string's value.

As a tip, base64 encoding can break on some characters.

So it can be good to use URI encoding first.

```javascript
btoa(encodeURIComponent(value))
```


## Decode

"ASCII" to "Binary".

```javascript
atob(value)
```

If you had a data structure.

```javascript
JSON.parse(atob(value))
```

If you had URI encoding:

```javascript
decodeURIComponent(atob(value))
```
