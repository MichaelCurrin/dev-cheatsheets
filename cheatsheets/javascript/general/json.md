# JSON

## Convert to JSON

[Mozilla dev docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)

[W3 Schools tutorial](https://www.w3schools.com/js/js_json_stringify.asp)

### Syntax

```
JSON.stringify(value[, replacer[, space]])
```

### Basic

```javascript
var x = {
  a: [1, 2, 3],
  b: '123'
}
```

```javascript
JSON.stringify(x)
```

```
"{\"a\":[1,2,3],\"b\":\"123\"}"
```

Recommendeduse - use `console.log` to unescape quotes and newlines.

```javascript
console.log( JSON.stringify(x) )
```
```
{"a":[1,2,3],"b":"123"}
```

### Wrap

Wrap the output across multiline lines for readability.

Set the `space` argument.

The space argument may be used to control spacing in the final string.

- Use a number to indent that many characters (up to 10).
- Use a string to indent with that string (or the first 10 characters of it).

```javascript
console.log( JSON.stringify({ a: 2 }, null, 4) )
```
```
{
    "a": 2
}
```

Using a tab character mimics standard pretty-print appearance:

```javascript
JSON.stringify({ uno: 1, dos: 2 }, null, '\t')
```
```
{
	"uno": 1,
	"dos": 2
}
```
