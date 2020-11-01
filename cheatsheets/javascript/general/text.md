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


## Replace character

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

### Warning

These will only replace the **first** occurence.

Using `.replace` without regex (like you would do in Python):

```javascript
> 'AAA'.replace('A', 'C')
'CAA'
```

Using regex without `g`:

```javascript
> 'AAA'.replace(/A/, 'C')
'CAA'
```


## Remove empty lines

```javascript
> myText.replace(/^\n/gm, '');
```

The `m` modified is recommended for multi-line search

https://www.w3schools.com/jsref/jsref_regexp_m.asp


## Remove empty line from start and end

[source](https://stackoverflow.com/questions/14572413/remove-line-breaks-from-start-and-end-of-string/48080903)

```javascript
> myText.replace(/^\s+|\s+$/g, '');
```

Note this removes all whitespace and not just `\n`.


## Template literals

See [Template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) on Mozilla docs.
