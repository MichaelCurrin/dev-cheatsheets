---
title: Looping
description: Guide to iterating over iterables in JavaScript
---


## Summary

```javascript
for (const index = 0; i < iterableLength; index++) { }

for (const index in iterable) { }

for (const item of iterable) { }

iterable.map(item => expression)

iterable.forEach(item => expression)
```


## for

### Using array index

The old-fashioned style, based on the C language or Java.

```javascript
for (const index = 0; i < iterableLength; index++) { }
```

The value of `i` is `0` initially, then incremented to `1` and `2`. When it becomes `3`, it is then longer than the length of the array (`letters.length` is `3`) so stops.

```javascript
const letters = ["a", "b", "c"]

let upper = []
for (const j = 0; i < letters.length; i++) {
  console.log(i)
  
  const u = letters[i].toUpperCase()
  upper.push(u)
}
// 0
// 1
// 2

upper
// [ "A", "B", "C" ]
```

### Using for...in

This is similar to using the index style but shorter.

```javascript
for (const index in iterable) { }
```

Example using an array.

```javascript
const letters = ["a", "b", "c"]

for (const i in letters) {
  console.log(i, letters[i])
}
// 0 a
// 1 b
// 2 c
```

This is **not** so useful, as you only get the index and still have to look up the value. So using `for...of` is better, as covered below.

A more common use is using an `Object` of key-value pairs - based on [for...in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in) docs.

```javascript
const foo = { a: 1, b: 2, c: 3 }

for (const key in foo) {
  console.log(key, foo[key])
}
// a 1
// b 2
// c 3
```

### Using for...of

Get the item without having to deal with the index.

```javascript
for (const item of iterable) { }
```

Based on [for...of](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of) docs.

```javascript
const letters = ['a', 'b', 'c'];

for (const letter of letters) {
  console.log(letter);
}
// a
// b
// c

// Get the index and value.
for (const [i, letter] of Object.entries(letters)) {
  console.log(letter);
}
// a
// b
// c
```

Iterate over a string.

```javascript
const letters = "abc";

for (const letter of letters) {
  console.log(letter);
}
// a
// b
// c
```

Iterate over an `Object` of key-value pairs. Note that `foo` is **not** an iterable, so you have to pass it to something to avoid an error.

```javascript
const foo = { a: 1, b: 2, c: 3 }

// Keys.
for (const key of Object.keys(foo)) {
  console.log(key)
}
// a
// b
// c

// Values
for (const key of Object.values(foo)) {
  console.log(key)
}
// 1
// 2
// 3

// Keys and values.
for (const [key, value] of Object.entries(foo)) {
  console.log(key, value)
}
// a 1
// b 2
// c 3
```

Iterate over a `Map` object.

```javascript
const foo = new Map( [ ['a', 1], ['b', 2], ['c', 3] ] );
// Map(3) { a → 1, b → 2, c → 3 }

// Keys and values.
for (const [key, value] of foo) {
  console.log(key, value);
}
// a 1
// b 2
// c 3

// Or if you want to keep as a tuple.
for (const pair of foo) {
  console.log(pair);
}
// ['a', 1]
// ['b', 2]
// ['c', 3]
```


## map

The modern way of doing loops. 

This is based on `map` function in Functional Progamming languages like Haskell. See also `map` which was introduced to Python.

It is useful for performing a transformation on an array without side effects (while a `for` or `.forEach` loop accesses a variable outsides its scope block normally). You can also chain multiple `.map` calls together and use them with `.filter` and `.reduce`.

### Syntax
```javascript
iterable.map(item => expression)
```

### Example

Here we create a new array with the new values in it, passing an arrow function with no side effects. This makes for cleaner and more efficient and reliable code. As we don't have initialize an array and push values to it.

```javascript
const letters = ["a", "b", "c"]

const upper = letters.map(x => x.toUpperCase())
upper
// [ "A", "B", "C" ]

// Log without storing a result.
letters.map(x => console.log(x.toUpperCase()))
// A
// B
// C
```



## forEach

Avoid using this. This is 3x slower than `.map` and it returns `undefined`. Rather use `.map` as a drop-in replacement wherever you see `.forEach`.

```javascript
iterable.forEach(item => expression)
```

Examples.

```javascript
const letters = ["a", "b", "c"]

letters.forEach(x => console.log(x.toUpperCase()))
// A
// B
// C
```

It also returns `undefined`, so if you want to persist values you need to initalize an array and push to it.

```javascript
const letters = ["a", "b", "c"]

let upper = []
letters.forEach(function (x) {
    const u = x.toUpperCase()
    upper.push(u)
})

upper
// [ "A", "B", "C" ]
```
