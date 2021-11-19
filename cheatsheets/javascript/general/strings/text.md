# Text

## Case

```javascript
> myText.toUpperCase()
```


## Slicing

```javascript
> myText.substr(first, length)

> myText.substring(start, end)
```


## Replace character in text

### Replace all occurences

```javascript
> 'AAA'.replace(/A/g, 'C')
'CCC'
```

Or the more verbose.

```javascript
> 'AAA'.replace(new RegExp("A", "g"), 'C')
'CCC'
```

You might use `RegExp` to escape characters for you.

```javascript
> new RegExp("A", "g")
/A/g
> new RegExp("/A")
/\/A/
```

### Replace first occurence only

Replace the **first** occurence, not a global replace.

Pass first param as a string, not regex.

```javascript
> 'AAA'.replace('A', 'C')
'CAA'
```

Or pass regex, but without `g`:

```javascript
> 'AAA'.replace(/A/, 'C')
'CAA'
```


## Remove empty lines

```javascript
> myText.replace(/^\n/gm, '');
```

The Regex pattern finds lines which start with a newline.

The `m` modified is recommended for multi-line search

[Source](https://www.w3schools.com/jsref/jsref_regexp_m.asp)

If you wanted to just replace a value, you could do:

```javascript
> myText.replace(/^$/g, 'new value');
```


## Remove whitespace at start and end

- [trim](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim) method in MDN docs
    > The `trim()` method removes whitespace from both ends of a string. Whitespace in this context is all the whitespace characters (space, tab, no-break space, etc.) and all the line terminator characters (LF, CR, etc.). 

```javascript
myText.trim();
```

e.g.

```javascript
> '   foo  '.trim()
'foo'
```

## Remove only newlines from start and end

[source](https://stackoverflow.com/questions/14572413/remove-line-breaks-from-start-and-end-of-string/48080903)

```javascript
> myText.replace(/^\n|\n$/g, '');
```

Note this removes all whitespace and not just `\n`.


## Template literals

See [Template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) on Mozilla docs.


## Split

### Split by delimeter

```javascript
'abc def ghi'.split(' ')
// [ 'abc', 'def', 'ghi' ]
```

### String to array of characters

```javascript
'abcdef'.split('')
// [ 'a', 'b', 'c', 'd', 'e', 'f' ]
```
