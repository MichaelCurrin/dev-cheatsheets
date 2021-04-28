# Regex


## Resources

- [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp) on Mozilla docs.
- [JavaScript Regular Expressions](https://www.w3schools.com/js/js_regexp.asp)
- [JavaScript RegExp Reference](https://www.w3schools.com/jsref/jsref_obj_regexp.asp) - that has a long list on the list for more info.


## Regex object

How to create a `RegExp` instance.

### With a constructor

```javascript
new RegExp("e");

new RegExp('ab+c', 'i')  // string pattern as argument
new RegExp(/ab+c/, 'i')  // regular expression literal as first argument - from ES6
```

### Literal notation

```
/e/

/ab+c/i
```

e.g. 

```javascript
// inline
text.search(/my pattern/i);

// with object
const patt = /my pattern/i;
text.search(patt);
```

### Flags

```javascript
/\w+/

new RegExp('\\w+')
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

See what is at character with index `6` in the text:

```
// 0123456
  "Visit W3Schools"
```


## Match method

A method on a string.

Find matches in text and get an object back.

```javascript
const patt = new RegExp("e");
const text = "The best things in life are free";

const matches = text.match(patt);
// ["e", index: 2, input: "The best things in life are free", groups: undefined]
```


## Test method

A method on a regex object.

Check a string matches a regex pattern and return `true` or `false`.

```javascript
patt.test(text)
```

This is equivalent to using `match` and use `!!` to convert to a boolean.

```javascript
!!text.match(patt)
```

### Examples

```javascript
/Hello/.test("Hello world!")
// true
```

From [W3 Schools](https://www.w3schools.com/jsref/jsref_regexp_test.asp).

```javascript
const patt = /e/;
const text = "The best things in life are free";
const result = patt.test(str);
// true
```


## Replace method

A method on a string.

In a string, replace a matched pattern with another value.

The pattern can be a string or a regex pattern. 

From [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace).

```javascript
text.replace(pattern, replaceStr)
```

_Warning - the default behavior is to only replace the **first occurrence**. So make sure to use `g` global flag in your regex, even if you have to convert your plain string or regex. You can use the [replaceAll](#replace-all-method) method to replace all values for a string pattern, but you still need global flag for regex pattern._

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


## Replace all method

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


## Groups and ranges

- [Groups and ranges](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Groups_and_Ranges) in Mozilla docs.

A match will return positional values in an array. The first is the matched string, then at index `1` is the first matched group, index `2` the second and so on. The match object has also has some key-value attributes - `index`, `input` and `groups`. 

Examples copied from link above.

### Basic

Get as many groups as matched. Here these are words without the letter `e`.

```javascript
const aliceExcerpt = 'The Caterpillar and Alice looked at each other';
const regexpWithoutE = /\b[a-df-z]+\b/ig;

aliceExcerpt.match(regexpWithoutE)
// ["and", "at"]
```

### Groups

Match groups created with brackets.

```javascript
const imageDescription = 'This image has a resolution of 1440×900 pixels.';
const regexpSize = /([0-9]+)×([0-9]+)/;

const match = imageDescription.match(regexpSize);
`Width: ${match[1]} / Height: ${match[2]}.`
// "Width: 1440 / Height: 900."
```

Note index starts at `1`.

### Non-capturing group

Here we need the protocol to match on the value but we drop it in the result.

```javascript
const patt = new RegExp('(?:https?)://([^/\r\n]+)(/[^\r\n]*)?')

cont matches = 'http://stackoverflow.com/'.match(patt)
matches[1])
// stackoverflow.com
```

### Topic example

Get hashtag keywords.

This only matches _once_.

```javascript
pat = /#(\w+)/
m = 'abc #python #def'.match(pat)
m
// [ '#python', 
//   'python', 
//   index: 4, 
//   input: 'abc #python #def', 
//   groups: undefined ] 
```

Using `g` for a global matches to get more than one match. But made the attributes disappear. Maybe I don't understand this area properly and what the best practice is.

```javascript
pat = /#(\w+)/g
m = 'abc #python #def'.match(pat)
m
// [ 
//   '#python', 
//   '#def' 
// ] 
```

Extending the pattern to capture hyphens (not valid hashtags on Twitter but useful on other platforms for keyword topics).

```javascript
pat = /#([\w-]+)/g
m = 'abc #ruby #data-science'.match(pat)
m
// [ '#ruby', '#data-science' ] 
```
