# Data transformation


## Merge objects

### Merge two arrays

Use the **spread operator** to combine two arrays.

```javascript
var x = [4, 5, 6];
var y = [1, 2, 3, ...x];
// [1, 2, 3, 4, 5, 6]
```

### Merge two associtiave arrays

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


## Unpack associative array

Get key-value pairs.

The order is not guaranteed.

```javascript
var pairs = {
  foo: 'A',
  bar: 'B',
  baz: 'C'
}

for (const [ key, value ] of Object.entries(pairs)) {
  console.log(key, value)
}
```

To sort first:

```javascript
Object.entries(obj).sort((a, b) => b[0].localeCompare(a[0]));.
```

[source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries)


## Invert associative array

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
