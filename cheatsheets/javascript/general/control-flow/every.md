# Every

Check that all elements in array satisfy a condition.

- [Array.prototype.every()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every)

> The every method executes the provided callback function once for each element present in the array until it finds the one where callback returns a falsy value. If such an element is found, the every method immediately returns false. Otherwise, if callback returns a truthy value for all elements, every returns true.
> 
> Caution: Calling this method on an empty array will return true for any condition!


## Syntax

Pass a function, that takes 1 to 3 arguments.

```javascript
every((element) => { ... } )
every((element, index) => { ... } )
every((element, index, array) => { ... } )
```

Or passing a callback function and optional success value instead of `true`.

```javascript
every(callbackFn)
every(callbackFn, thisArg)
```

> If a thisArg parameter is provided to `every`, it will be used as callback's this value. Otherwise, the value `undefined` will be used as its `this` value. 


## Examples

Check all values are true.

```javascript
[true, true, true].every(i => i === true)
// true
```

Check values all are positive.

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


## Other languages

Similar to `all` in Python.
