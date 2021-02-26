# Associative arrays


See [Object initializer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) in Mozilla docs.


## Fixed key

```javascript
const x = 'abc123'
// 'abc123'

const y = {
  x: 'Hello, World!'
}
y
// { x: 'Hello, World!' }
```

Note that only strings are allowed for keys and other types will be converted.

```javascript
{1: 'Hello, World!'
// { '1': 'Hello, World!' }
```


## Dynamic key

```javascript
const x = 'abc123'
// 'abc123'

consty = {
  [x]: 'Hello, World!'
}
y
// { abc123: 'Hello, World!' }
```
