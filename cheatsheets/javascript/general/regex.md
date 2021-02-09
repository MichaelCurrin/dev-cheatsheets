# Regex

## Resources

- [JavaScript Regular Expressions](https://www.w3schools.com/js/js_regexp.asp)
- [JavaScript RegExp Reference](https://www.w3schools.com/jsref/jsref_obj_regexp.asp) - that has a long list on the list for more info.


## Search

The `search()` method searches a string for a specified value and returns the **position** of the match. This is done with a case-insensitive search.

```javascript
text.search(pattern)
```

### Examples

```javascript
var str = "Visit W3Schools";
var n = str.search(/w3schools/i);
// 6
```


## Test

Check a string matches a regex pattern and return `true` or `false`.

```javascript
pattern.test(text)
```

### Examples

```javascript
/Hello/.test("Hello world!")
// true
```

From [W3 Schools](https://www.w3schools.com/jsref/jsref_regexp_test.asp).

```javascript
var patt = new RegExp("e");
var str = "The best things in life are free";
var res = patt.test(str);
```

Using `g` for global.

```javascript
var patt = /Hello/g;
var str = "Hello world!";

var result = patt.test(str);
```


## Replace

In a string, replace a matched pattern with another value.

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace).

```javascript
text.replace(pattern, replaceStr)
```

### Examples

```javascript
const pattern = /Dog/i;
const p = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

const newStr = p.replace(pattern, 'ferret')
```
