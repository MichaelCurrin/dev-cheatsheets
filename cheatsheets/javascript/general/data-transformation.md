---
title: Data transformation
---

## Unpack dictionary

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

## Invert dictionary

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
