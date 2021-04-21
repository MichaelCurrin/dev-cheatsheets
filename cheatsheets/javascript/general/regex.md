# Regex


## Resources

- [JavaScript Regular Expressions](https://www.w3schools.com/js/js_regexp.asp)
- [JavaScript RegExp Reference](https://www.w3schools.com/jsref/jsref_obj_regexp.asp) - that has a long list on the list for more info.


## Regex object

JavaScript lets you create a regex expression in a few days.

### With a constructor

```javascript
new RegExp("e");
```

### Using forward slash syntax

```
/e/
```

e.g. 

```javascript
// inline
text.search(/my pattern/i);

// with object
const patt = /my pattern/i;
text.search(patt);
```


## Search method

A method on a string.

This method searches a string for a specified value and returns the **position** of the match. This is done with a **case-insensitive** search.

```javascript
text.search(pattern)
```

### Examples

```javascript
const text = "Visit W3Schools";

text.search(/w3schools/i);
// 6
```

See what is at characte with index `6` in the text:

```
// 0123456
  "Visit W3Schools"
```


## Match method

A method on a string.

```javascript
var patt = new RegExp("e");
var str = "The best things in life are free";
var res = str.match(patt);
// str
```


## Test method

A method on a regex object.

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


## replace method

A method on a string.

In a string, replace a matched pattern with another value.

The pattern can be a string or a regex pattern. 

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace).

```javascript
text.replace(pattern, replaceStr)
```

_Warning - the default behavior is to only replace the **first occurrence**. So make sure to use `g` global flag in your regex, even if you have to convert your plain string or regex. You can use the [replaceAll](#replaceAll-method) method to replace all values for a string pattern, but you still need global flag for regex pattern._

### Examples

Use `'dog'` string or `/Dog/i` regex as the pattern. Either way, it will only replace replace **once**.

```javascript
const pattern = /Dog/i;
const text = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

text.replace(pattern, 'ferret')
//                                            | NB.         | NB.
// "The quick brown fox jumps over the lazy ferret. If the dog reacted, was it really lazy?"
```

Regex pattern - replace **all** occurences using global and case-insensitive flags.

```javascript
const pattern = /Dog/gi;
const text = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

text.replace(pattern, 'ferret')
//                                            | NB.         | NB.
// "The quick brown fox jumps over the lazy ferret. If the ferret reacted, was it really lazy?"
```


## replaceAll method

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll).

> The replaceAll() method returns a new string with all matches of a pattern replaced by a replacement. The pattern can be a string or a RegExp, and the replacement can be a string or a function to be called for each match.

Syntax:

```javascript
str.replaceAll(regexp|substr, newSubstr|function)
```

Note that as per linked docs, this only replaces **all** occurrences for a string pattern. While if you use a regex pattern, it will still only replace the **one** occurence unless you use `g` flag. Which is annoying.

### Examples

String pattern to replace all.

```javascript
const text = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

text.replaceAll('dog', 'monkey'));
//                                            | NB.         | NB.
// "The quick brown fox jumps over the lazy monkey. If the monkey reacted, was it really lazy?"
```

Regex pattern - global flag still requird to replace all.

```javascript
const text = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

text.replaceAll(/Dog/gi, 'monkey')
//                                            | NB.         | NB.
// "The quick brown fox jumps over the lazy monkey. If the monkey reacted, was it really lazy?"
```
