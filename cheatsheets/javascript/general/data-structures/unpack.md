# Unpack

How to unpack objects of various types to iterate or convert. You might not use these with a for loop. For example if you want to convert a associative array to an array.


## Resources

See the [Looping][] section for more details on styles of for loops and how to apply them to object types.

See also [Object.entries][] in MDN docs.

[Looping]: {{ site.baseurl }}{% link cheatsheets/javascript/general/data-structures/looping.md %}
[Object.entries]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries


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


## From entries method

Convert an array of arrays into an associative array.

From [Object.fromEntries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/fromEntries)

```javascript
const myMap = [
  ['foo', 'bar'],
  ['baz', 42]
];

const myHash = Object.fromEntries(myMap);
// { foo: "bar", baz: 42 }
```

So you could apply `.entries` and then `.fromEntries` and get back to the associative array where you started.
