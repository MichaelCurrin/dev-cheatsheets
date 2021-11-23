# Spread or rest operator

This operator is known as "spread" or "rest". It is 3 dots.

```
...
```


## Basic

On the right side of assignment, it is a _spread_ operator.

```javascript
const x = [8, 9]
const y = [4, 5, 6, ...x]
```

On the left side of assignment, it is a _rest_ operator. You get three variables here - `a`, `b` and `other`.

```javascript
const [a, b, ...other] = [1, 2, 3, 4, 5]
```

## On a key-value pairs object

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

### Unpack

Here using the spread operator in the variable names on the left.

We unpack an array into multiple variables. The last variable is _always_ an array while the others are scalar items.

#### Notes

- Spread must be for the _last_ variable only or you'll get an error. This is invalid: `const [...a, b ] = myArray`.
- You must use **hard brackets** or the syntax is invalid.
- You can leave out the `const` bit, like if using the interactive console.

#### Two variables

Here we unpack multiple items into a flat array.

```javascript
const myArray = ["abc", "def", "efg"]

const [a, ...b] = myArray
a
// 'abc'
b
// [ 'def', 'efg' ]

// With the variables already assigned as split values, you can combine them again.
[a, ...b]
// [ 'abc', 'def', 'efg' ]
```

#### Three variables

```javascript
const myArray = ["abc", "def", "efg"]

const [a, b, ...c] = myArray
> a
'abc'
> b
'def'
> c
[ 'efg' ]
```

If you don't care about the other values of the aray.

Here dropping the third element.

```javascript
const [a, b, ..._] = x

// Or simply
const [a, b] = x
```

#### Single variable

You could use a single variable. But you probably shouldn't.

```javascript
const [...a] = x
a
// [ 'abc', 'def', 'efg' ]
```

That makes `a` as an independent copy of `x`.

Here is the preferred way to copy an array - see the [Clone](#clone) section.

```javascript
const a = [...x]
```

### Merge

Here using the spread operator in the values on the right.

Use spread to unpack an array into its elements, such as for merging arrays into a single, flat (one-dimensional) array.

```javascript
const x = [ "a", "b", "c" ]
const y = [ "d", "e", "f" ]
const z = [...x, ...y, "g"]
z
// [ "a", "b", "c",  "d", "e", "f", "g" ]
```

Compare _without_ using spread. You get a nested array.

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

Make a copy of an array, but one that is independent of the original one.

```javascript
const x = [ "a", "b", "c" ]

const y = [...x]

// Update x only, without affecting y.
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

### On an iterable

Convert an iterable which is not an array into an array, so you can use array methods on it.

For example, a selection of DOM elements.

```javascript
// Iterable.
const divs = document.getElementsByTagName('div')

// Array.
const divsArr = [...divs]
// Array method.
divsArray.map(myFunc)
```


## Function

This is convenient as you can one or more values without having to make an array.

```javascript
function sum(...values) {
    let total = 0;
    for (const a of values) {
        total += a;
    }
    return total;
}

sum(1);       // 1
sum(1, 2, 3); // 6

// In case you do have a array, you can spread the single array into arguments.
const items = [1, 2, 3];
sum(..items); // 6
```

Compared with a plain approach before ES6.

```javascript
function sum(values) {
    let total = 0;
    for (const a of values) {
        total += a;
    }
    return total;
}

sum([1]);       // 6
sum([1, 2, 3]); // 6
```
