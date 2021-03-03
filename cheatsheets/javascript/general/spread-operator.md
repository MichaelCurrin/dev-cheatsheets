# Spread operator

This operator is known as "spread" or "rest" and is 3 dots.

```
...
```


## On an object of key-value pairs

```javascript
const x = {a: 1, b: 2}

const y = {
  ...x,
  c:3
}

y
// { a: 1, b: 2, c: 3}
```


## On an array

### Merge

Use spread to unpack an array into its elements, such as for merging arrays into a single, flat (one-dimensional) array.

```javascript
const x = [ "a", "b", "c" ]
const y = [ "d", "e", "f" ]
const z = [...x, ...y, "g"]
z
// [ "a", "b", "c",  "d", "e", "f", "g" ]
```

Compare without using spread. You get a nested array.

```javascript
const z = [x, y, "g"]
z
// [
//   [ "a", "b", "c" ],
//   [ "d", "e", "f" ],
//   "g"
// ]
```


### Clone

It also works to make a copy of an array but one that is independent of the original one.

```javascript
const x = [ "a", "b", "c" ]

const y = [...x]

x.push("d")

x
// [ "a", "b", "c", "d" ]
y
// [ "a", "b", "c" ]
```

Compare with just a reference, where both variables point to the same array in memory.

```javascript
const x = [ "a", "b", "c" ]
const y = x

x.push("d")

x
// [ "a", "b", "c", "d" ]
y
// [ "a", "b", "c", "d" ]
```
