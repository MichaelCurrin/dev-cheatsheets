# Methods

## Related

- [Contains cheatsheet][]
- [Regex cheatsheet][]

[Contains cheatsheet]: {% link cheatsheets/javascript/general/strings/contains.md %}
[Regex cheatsheet] {% link cheatsheets/javascript/general/strings/regex.md %}


## indexOf method

- [indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) in MDN docs

```javascript
STRING.indexOf(SEARCH_VALUE)
STRING.indexOf(SEARCH_VALUE, FROM_INDEX)
```

## search method

- [search](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) in MDN docs

A search for a match between a **regular expression** and a string object.

```javascript
const paragraph = 'The quick brown fox jumps over the lazy dog. If the dog barked, was it really lazy?';

// Any character that is not a word character or whitespace
const regex = /[^\w\s]/g;

paragraph.search(regex)
// 43

paragraph[paragraph.search(regex)]
// "."
```

## match method

- [match](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) in MDN docs

Retrieve the result of matching a string against a regular expression.
