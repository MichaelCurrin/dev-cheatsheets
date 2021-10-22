# Transformation


## Merge objects

### Merge two arrays

Use the **spread operator** to combine two arrays.

```javascript
var x = [4, 5, 6];
var y = [1, 2, 3, ...x];
// [1, 2, 3, 4, 5, 6]
```

### Merge two associative arrays

Use the **spread operator**.

```javascript
var x = {d: 1, e: 2, f: 3};
var y = {a: 1, b: 2, c: 3, ...x};
// {a: 1, b: 2, c: 3, d: 1, e: 2, f: 3}
```

### Add to an associative array

You can use this shorthand to put an associative array in another, using the name of the variable as the key.

```javascript
var x = {d: 1, e: 2, f: 3};
var z = {u: 200, x};
// { u: 200, x: {d: 1, e: 2, f: 3} }
```

You can use this with other types.

```javascript
var a = [1, 2, 3];
var b = { a };
// { a: [1, 2, 3] }

var c = 1000;
{ c }
// { c: 1000 }
```


## Unpack an array

```javascript
var myArray = [
  "a",
  "b",
  "c",
]

for (const [ index, value ] of Object.entries(myArray)) {
  console.log(index, value)
}
// 0 a
// 1 b
// 2 c

// OR using forEach. Note index and value switch places.
myArray.forEach((value, index) => {
  console.log(index, value)
})
```


## Unpack an associative array

### Get key-value pairs with a for loop

Warning - the order is not guaranteed.

```javascript
const pairs = {
  foo: 'A',
  bar: 'B',
  baz: 'C'
}

Object.entries(pairs)
// [ [ 'foo', 'A' ], [ 'bar', 'B' ], [ 'baz', 'C' ] ]

for (const [ key, value ] of Object.entries(pairs)) {
  console.log(`${key} - ${value}`)
}

// foo - A
// bar - B
// baz - C
```

Or, instead of `for`, using `map`.

```javascript
Object.entries(pairs)
  .map((x) => `${x[0]} - ${x[1]}`)
// [
//   'foo - A', 
//   'bar - B', 
//   'baz - C'
// ]
```

Note that `x` is a tuple.

If you use two parameters, you'll end up with the key and value in the first and the index (like `0`) in the second.

#### Sort

To sort first, before using `for` or `map`.

```javascript
Object.entries(obj)
  .sort((a, b) => b[0].localeCompare(a[0]));
```

From [Object.entries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries) in MDN docs.


### Merge associative arrays

Here we unpack each of the values in `x` into a new associative array `y`, keeping them as before but merging with other values such as `c: 3`.

```javascript
const x = {
    a: 1, 
    b: 2
}

const y = {
    ...x,
    c: 3
}

y
// { a: 1, b: 2, c: 3 }
```

Note use of `...` spread operator above. If you omit that, then `x` becomes the key in the new object, with keys `a` and `b` intact within that.

```javascript
const z = {
    x,
    c: 3
}

// { x: { a: 1, b: 2 }, c: 3 } 
```

If you want to merge two objects:

```javascript
const x = {
    a: 1, 
    b: 2
}
const y = {
    b: 100,
    c: 3, 
    d: 4
}

const z = {
  ...x,
  ...y,
}
z
// { a: 1, b: 100, c: 3, d: 4 } 
```

Note evaluation is top to bottom. Regardless of if using a value or an object, the second one takes preference.

Here we have `x` second, so the value of `b` is used.

```javascript
const z = {
  ...y,
  ...x,
}

z
// { b: 2, c: 3, d: 4, a: 1 } 
```


## Invert an associative array

```javascript
var pairs = {
  foo: 'A',
  bar: 'B',
  baz: 'C'
}

let output = {};
for (const [ key, value ] of Object.entries(pairs)) {
  output[value] = key;
}
```
