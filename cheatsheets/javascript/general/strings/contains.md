# Contains

Check for a string in another string.

Remember that methods usually case-sensitive.


## Related

- [String methods cheatsheet][]

[String methods cheatsheet]: {{ site.baseurl }}{% link cheatsheets/javascript/general/strings/methods.md %}


## Get index of a value

```javascript
const x = 'abcdef'

x.indexOf('cd')
2
x.indexOf('z')
-1
```

You'll get the same result with `.search()`.

```javascript
x.search('cd')
x.search('z')
-1
```


## Check if string contains a value

A boolean of whether there is match or not.

```javascript
'Blue Whale'.indexOf('Blue') !== -1
// true

'Blue Whale'.indexOf('Bloe') !== -1 
// false
```

Do a case-insensitive search.

```javascript
'Blue Whale'.toLowerCase().indexOf('blue') !== -1
// true
```


## Count occurences

Based on MDN docs.

Use `indexOf()` to count occurrences of a letter in a string.

```
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

Contrast with Python:

```python
>>> x = 'abcabc'
>>> x.count('a')
2
>>> x.count('abc')
2
```
