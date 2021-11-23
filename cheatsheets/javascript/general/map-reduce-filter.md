# map, reduce, and filter

We use the `map`, `reduce`, and `filter` methods on an array. These are not available on other data types (in Python, these are standalone functions and you can pass any iterable to them).

They will a **new** object after the applying transformation. The old array will not be affected, unless you reassign over the same name.


## Map

Apply a function to each element.

Here we multiply all elements by 2. The result will have the same number of elements as before.

```javascript
myArray.map(x => x*2)
```


## Filter

Select matching elements.

The result will have at most the same number of elements as before, but it could have as few as zero elements if none matched.

```javascript
myArray.filter(x => x > 2)
```


## Reduce

The `reduce` executes a function for each value of the array (from left-to-right). It reduces the array to a single value. Think of it as collapsing an array or vector to a single scalar result, like adding up scores.

The return value of the function is stored in an accumulator, which is passed to the evaluation step.

- [Array.prototype.reduce()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce) on MDN docs.

JS has no `sum` function (like in Python), but you can make your own, using `reduce`.

### Syntax

All of thes functions passed to `reduce` are valid.

```javascript
myArray.reduce((accumulator, currentValue) => { ... } )
myArray.reduce((accumulator, currentValue, index) => { ... } )
myArray.reduce((accumulator, currentValue, index, array) => { ... } )
```

You can pass an initial value too.

```javascript
myArray.reduce((accumulator, currentValue, index, array) => { ... }, initialValue)
```

### Named function

General naming. In this case we use `+` symbol.

```javascript
function reducer(accumulator, currentValue) {
  return accumulator + currentValue;
}

const myArray = [1, 10, 100, 1000];
myArray.reduce(reducer)
// 1111
```

More practical naming for an `add` or `sum` function.

```javascript
function add(total, item) {
  return total + item;
}

const myArray = [1, 10, 100, 1000];

myArray.reduce(add)
// 1111
```

### Anonymous function

We we add numbers in an array, by using an anonymous fucntion. You can use `x` for accumulator and `y` for the current value.

```javascript
const myArray = [1, 2, 3, 4];

myArray.reduce((x, y) => x + y)
```

This calculations can be explained as follows, with `0` as the default initial value.

```javascript
// total is zero and current item is 1
0 + 1
// total: 1

// total is 1 and item is 10
1 + 10
// total: 11

// total is 11 and item is 100
11 + 100
// total: 111

// total is 111 and item is 1000
111 + 1000
// total: 1111
```

Optionally provide an extra param as the starting value.

```javascript
myArray.reduce((x, y) => x + y, 3000)
// 4111
```

You could use `*` if you wanted to multiple the values.

```javascript
const myArray = [1, 2, 3, 4];

myArray.reduce((x, y) => x*y)
// 24
```

### Why use reduce

In some cases, a `for` loop would work fine. For example to go through all items in an array, maybe only those matching a condition, and multiply them together or add them or count them.

A `for` loop uses state though. This value is persisted across iterations. This can get harder to think about and debug in more complex cases. Especially if your accumulator is an array or hash (which are mutable) and not just an number.

Using `reduce` also allows you to compare pairs of items against each other. In a `for` loop this is messy, as you have to use the current item and keep track of the next (or previous) item.

Using `reduce` is also an easy way to do recursion, without having to write a recursive call yourself. Where each step of the recursion call calls another using an item and an accumulator, both are dropped in the next call.

Here, checking if all items in an array are equal to each other. Note this is different to checking if all values are equal to a given value.

```javascript
const equal = (acc, item) => acc === item ? item : null)
```

```javascript
[2, 2, 2].reduce(equal)
// 2

[2, 2, 3].reduce(equal)
// null
```

If the first two items in the array are equal, return the first item, otherwise `null`. Then compare that value to the third item.

Note you could also do this using `filter` - we don't care about an accumulator like a sum, so we could just check if all values in the array are equal to the first item at `myArray[0]`.

Using `every` could be more efficient, as it can return as `false` with the first value that is different, instead of evaluating every single item. See [every][] page.

[every]: {% link cheatsheets/javascript/general/control-flow/every.md %}


## Chaining

Combine `map`, `reduce` and `filter` together.

Note order of map and filter matters.

```javascript
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
```

```javascript
numbers.map(x => x*2)
  .filter(x => x > 5);
//  [ 6, 8, 10, 12, 14, 16, 18, 20 ]
```

```javascript
numbers.map(x => x*2)
  .reduce((x, y) => x + y)
// 110
```
