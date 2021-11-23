# Iterables

From [Iteration protocols][]:

> `String`, `Array`, `TypedArray`, `Map`, and `Set` are all built-in iterables, because each of their prototype objects implements an `@@iterator` method.

[Iteration protocols]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols


## Make an iterator

```javascript
const myIterable = {};

myIterable[Symbol.iterator] = function* () {
    yield 1;
    yield 2;
    yield 3;
};

console.log([...myIterable]); // [1, 2, 3]
```
