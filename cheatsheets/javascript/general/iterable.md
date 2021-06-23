# Iterable

How to iterate over objects of various types. You might not use these with a for loop. For example if you want to convert a associative array to an array.

See the [Looping][] section for more details on styles of for loops and how to apply them to object types.

[Looping]: {{ site.baseurl }}{% link cheatsheets/javascript/general/looping.md %}

See [Object.entries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries) in MDN docs.


## Array

```javascript
const x = ["a", "b"]

Object.entries(x)
// [ [1, "a"], [2, "b"] ]
```


## Associative array

```javascript
const x = { a: 1, b: 2 }

Object.entries(x)
// [ ["a", 1], ["b", 2] ]

Object.keys(x)
// [ "a", "b" ]

Object.values(x)
// [ 1, 2 ]
```

Note that if you iterate over a `Map` type, you get the keys and values without having to add an Object method.


## From entries

Convert an array of arrays into an associative array.

[Object.fromEntries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/fromEntries)

So you could apply `.entries` and then `.fromEntries` and get back to the associative array where you started.
