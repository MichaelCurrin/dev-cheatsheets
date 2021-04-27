# map reduce filter


## Overview

Return a new object after applying transformation. The old array is not affected, unless you reassign over the same name.

Examples:

- Multiple all elements by 2. The result will have the same number of elements as before.
    ```javascript
    myArray.map(x => x*2)
    ```
- Add elements. The result is a **single** value.
    ```javascript
    myArray.reduce((x, y) => x + y)
    myArray.reduce((x, y) => x + y, 1000)
    ```
- Select matching elements. The result will have at most the same number of elements as before, but it could have as few as zero elements if none matched.
    ```javascript
    myArray.filter(x => x > 2)
    ```


## Reduce

The `reduce` method reduces the array to a single value. It executes a function for each value of the array (from left-to-right).

The return value of the function is stored in an accumulator.

JS has no `sum` function (like in Python), but you can make your own using `reduce`.

```javascript
function reducer(accumulator, currentValue) {
  return accumulator + currentValue;
}

const myArray = [1, 10, 100, 1000];
myArray.reduce(reducer)
// 1111
```

This calculations as follows, with `0` as the initial value.

```javascript
0 + 1
// 1
1 + 10 
// 11
11 + 100 
// 111
111 + 1000
// 1111
```

Optionally provide an extra param as the starting value.

```javascript
myArray.reduce(reducer, 3000)
// 4111
```
