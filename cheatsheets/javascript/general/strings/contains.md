# Contains

Check for a string in another string.

Remember that methods are usually case-sensitive. To do case-insensitive searches, use `.toLowerCase()` first.


## Related

- [String methods cheatsheet][]

[String methods cheatsheet]: {% link cheatsheets/javascript/general/strings/methods.md %}


## Check if string contains a value

```javascript
const x = 'abc'

x.includes('b')
// true
```


## Get index of a value

```javascript
const x = 'abcdef'

x.indexOf('cd')
// 2
x.indexOf('z')
// -1
```

```javascript
'Blue Whale'.indexOf('Blue') !== -1
// true
```

You'll get the same result with `.search()`:

```javascript
x.search('cd')
// 2
x.search('z')
// -1
```


## Count occurences

Based on MDN docs.

Use `indexOf()` to count occurrences of a letter in a string:

```javascript
const str = 'To be, or not to be, that is the question.'
let count = 0
let position = str.indexOf('e')

while (position !== -1) {
  count++
  position = str.indexOf('e', position + 1)
}

console.log(count)
// 4
```

Contrast with Python and built-in method:

```python
>>> x = 'abcabc'
>>> x.count('a')
2
>>> x.count('abc')
2
```
