---
title: Looping
description: Guide to iterating over iterables in JavaScript
---


See [map, reduce and filter][] page for how to apply `map` to an array.

See the [Unpack][] page for unpacking variables without necessarily using a for loop.

[map, reduce and filter]: {{ site.baseurl }}{% link cheatsheets/javascript/general/map-reduce-filter.md %}
[Unpack]: {{ site.baseurl }}{% link cheatsheets/javascript/general/data-structures/unpack.md %}


## Overview

Nothing is simple in JavaScript. How do I iterate over an object? Well there are a few days, more than usual in a programming language.

Click a link to jump to that section of this guide.

- [for](#for)
    - [Using index](#using-index)
        ```javascript
        for (let index = 0; i < iterableLength; index++) { }
        ```
    - [Using for...in](#using-for...in)
        ```javascript
        for (const index in iterable) { }
        ```
    - [Using for...of](#using-for...of)
        ```javascript
        for (const item of iterable) { }

        for (const [index, value] of Object.entries(myArray)) { }

        for (const [key, value] of Object.entries(myAssociativeArray)) { }
        ```
- [map](#map)
    ```javascript
    iterable.map(item => expression)

    iterable.map(function (item) {
        expression
    })
    ```
- [forEach](#forEach)
    ```javascript
    iterable.forEach(item => expression)

    iterable.forEach(function (item) {
        expression
    })
    ```


## for

### Using index in a C-style loop

The old-fashioned index-based loop, based on the C and Java languages.

Please _don't_ use this style in your JS, unless you have a good reason to.

- The code is verbose and unnecessarily complex.
- If you _do_ need the value _and_ the array index (or hash key), then there is a cleaner way. See to [for...of](#using-for...of) section.
- If you _do_ need to get the index only, then use [for...in](#using-for...in).

Traditionally, this style was done using `var`, but `let` is the modern way for block scoping.

```javascript
for (let i = 0; i < 3; i++) {
    console.log(i)
}
// 0
// 1
// 2
```

Here we loop over an array using an index and the get the value on each iteration.

```javascript
const iterable = ["a", "b", "c"];

for (let i = 0; i < iterableLength; i++) {
    const item = iterable[i]
    console.log(item)
}
// a
// b
// c
```

Example of building a new array. This would be more elegantly done with `map` or [for...of](#using-for...of), but, anyway here it is as a C-style loop.

The value of `i` is `0` initially, then incremented to `1` and `2`. When it becomes `3`, it is then longer than the length of the array (`letters.length` is `3`) so stops.

```javascript
const letters = ["a", "b", "c"]

let upper = []

for (let i = 0; i < letters.length; ++i) {
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

Some prefer to use `++i` to `i++`. Some argue that this is faster but will give the same result (the increment still happens at the end of the iteration, just the returning and checking the value changes).

If you need to count _down_:

```javascript
for (let i = letters.length; i > 0; i--) {
  console.log(i)
}
// 3
// 2
// 1
```

### Using for...in

Get the index using `in`.

This gets the index much like the C-style approach, but this shorter i.e. no need for `i++` etc..

```javascript
for (const index in iterable) { }
```

What if you want an array index or associative array key, as well as the value?
It is possible as shown with the examples below, but is it verbose and inefficient. See the [for...of](#using-for...of) section for a more elegant way rather.

Example using an array.

```javascript
const letters = ["a", "b", "c"]

for (const index in letters) {
  console.log(index, letters[index])
}
// 0 a
// 1 b
// 2 c
```

Get a key and value. Based on [for...in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in) docs.

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

Get the items using `of`, without having to deal with the index.

```javascript
for (const item of iterable) { }
```

In Python:

```python
for item in iterable:
    # expression
```

See examples below for how to get the index or key and value at once - no need for a C style loop.

#### Array

Based on [for...of](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of) docs.

```javascript
const letters = ["a", "b", "c"];

for (const letter of letters) {
  console.log(letter);
}
// a
// b
// c
```

Get the index _and_ the value, using `Object.entries`. Compare wih `enumerate` in Python.

```javascript
const letters = ['a', 'b', 'c'];

for (const [index, letter] of Object.entries(letters)) {
  console.log(index, letter);
}
// 0 a
// 1 b
// 2 c
```

#### String

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

#### Associative array

Iterate over an `Object` of key-value pairs. Note that `foo` is **not** an iterable, so you have to pass it to something to avoid an error.

##### Keys

```javascript
const foo = { a: 1, b: 2, c: 3 }

for (const key of Object.keys(foo)) {
  console.log(key)
}
// a
// b
// c
```

##### Values

```javascript
const foo = { a: 1, b: 2, c: 3 }

for (const key of Object.values(foo)) {
  console.log(key)
}
// 1
// 2
// 3
```

##### Keys and values

```javascript
const foo = { a: 1, b: 2, c: 3 }

for (const [key, value] of Object.entries(foo)) {
  console.log(key, value)
}
// a 1
// b 2
// c 3
```

#### Map

Iterate over a `Map` object.

Keys and values.

```javascript
const foo = new Map( [ ["a", 1], ["b", 2], ["c", 3] ] );
// Map(3) { a → 1, b → 2, c → 3 }

for (const [key, value] of foo) {
  console.log(key, value);
}
// a 1
// b 2
// c 3
```

To understanding the unpacking, see use with tuples.

```javascript
for (const pair of foo) {
  console.log(pair);
}
// ['a', 1]
// ['b', 2]
// ['c', 3]
```

### for await of

A variation of a `for` loop, for async code.

- [for await...of](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of)
    > loop iterating over async iterable objects as well as on sync iterables

I guess this is useful if you have an array of Promises. 

I think the for await approach runs them independently and carries on the when they are all done, like using `Promise.all`.

#### Syntax

```javascript
for await (variable of iterable) {
  statement
}
```

### Example

Use either:

- `myAsyncIterable` - some object that explicitly implements async iterable protocol.
- `myAsyncGenerator()` - some async generator function, which already conforms to the async iterable protocol.

```javascript
(async function() {
   for await (const value of myAsyncIterable) {
     console.log(value);
   }
})();

// 0
// 1
// 2
```


## map

The modern way of doing loops.

This is based on `map` function in Functional Progamming languages like Haskell. See also `map` function and _list comprehensions_ in Python.

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

Unlike `.map`, this returns `undefined` so can't be used for chaining expressions or returning an array. Rather use `.map` as a drop-in replacement wherever you see `.forEach`.

The performance of `.map` is supposed to be faster than `.forEach`, though speed tests show mixed results.

### Syntax

```javascript
iterable.forEach(item => expression)
```

### Examples

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

See also `.each` in Ruby:

```ruby
[1, 2, 3].each { |n| puts "Number: #{n}" }
```
