# map reduce filter

We use the `map`, `reduce` and `filter` methods on an array. These are not available on other data types (in Python, these are standalone functions and you can pass any iterable to them).

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

The `reduce` method reduces the array to a single value. It executes a function for each value of the array (from left-to-right).

The return value of the function is stored in an accumulator.

JS has no `sum` function (like in Python), but you can make your own, using `reduce`.

### Named function

```javascript
function reducer(accumulator, currentValue) {
  // Expression - here we add.
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

We we add numbers in an array, by using an anonymous fucntion.

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


## Chaining

Combine `map`, `reduce` and `filter` together.

Note order of map and filter matters.

```javascript
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
```

```javascript
numbers.map(x => x*2).filter(x => x > 5);
//  [ 6, 8, 10, 12, 14, 16, 18, 20 ]
```

```javascript
numbers.map(x => x*2).reduce((x, y) => x + y)
// 110
```
