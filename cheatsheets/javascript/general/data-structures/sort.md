---
title: Sort
description: How to sort an array
---


## Reverse order

```javascript
myArray.reverse();
```


## Sort ascending or descending

### Text elements

Warning - capital letters will go to the start.

```javascript
const foo = ['b', 'a', 'c', 'C', 'A', 'B'];

// Ascending.
foo.sort();
// [ 'A', 'B', 'C', 'a', 'b', 'c' ]

// Longhand equivalent
foo.sort((a, b) => a > b ? 1 : -1 )
// [ 'A', 'B', 'C', 'a', 'b', 'c' ]

// Sort case-insensively ascending.
foo.sort((a, b) => a.toLowerCase() > b.toLowerCase() ? 1 : -1 )
// [ 'a', 'A', 'b', 'B', 'c', 'C' ]

// Descending.
foo.sort().reverse()
// [ 'c', 'b', 'a', 'C', 'B', 'A' ]
```

Note that using `a > b` will return a boolean that will do nothing, while the short function needs to have `-1`, `0` or `1` returned. The case of two elements being equal and returning `0` is not so important - using greater than for text or numbers and `-1` or `1` works fine.

### Numeric elements

Warning - if you apply `.sort` on an array of numbers and omit the function, then you'll get the numbers sorted as text. e.g. `[1, 10, 2]`.

```javascript
const points = [40, 100, 1, 5, 25, 10];

// Ascending.
points.sort((a, b) => a - b);

// Descending.
points.sort((a, b) => b - a);
```

### Hash elements

Pick a key to sort by.

```javascript
const myObjects = [
  { title: 'DEF' },
  { title: 'ABC' },
  { title: 'XYZ' }
]

myObjects.sort((a, b) => a.title - b.title)
```


## Random sort

The type of element doesn't matter here as the value isn't used.

Generate a random number from `0` to `1` and substract it from `0.5`. Half the time above, half the time below, so that will give random sort order.

```javascript
myArray.sort((a, b) => 0.5 - Math.random());
```
