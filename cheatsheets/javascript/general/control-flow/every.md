# Every

Check that all elements in array satisfy a condition.

[Array.prototype.every()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every)

> The every method executes the provided callback function once for each element present in the array until it finds the one where callback returns a falsy value. If such an element is found, the every method immediately returns false. Otherwise, if callback returns a truthy value for all elements, every returns true.
> 
> Caution: Calling this method on an empty array will return true for any condition!

Similar to `all` in Python.


## Syntax

Pass a function, that takes 1 to 3 arguments.

```javascript
every((element) => { ... } )
every((element, index) => { ... } )
every((element, index, array) => { ... } )
```

## Examples

Check values are positive.

```javascript
[2, 3, 4].every(i => i > 0)
// true
```

Check values are equal.

```javascript
const myArray = [2, 2, 2]

myArray.every(i => i === myArray[0])
// true
```
