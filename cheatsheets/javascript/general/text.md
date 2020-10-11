---
title: Text
---

## Case

```javascript
> myText.toUpperCase()
```


## Slicing

```javascript
> myText.substr(first, length)

> myText.substring(start, end)
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
