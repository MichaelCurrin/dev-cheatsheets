# Arrays

See [Array cheatsheet](https://www.shortcutfoo.com/app/dojos/javascript-arrays/cheatsheet) on ShortCutFoo website.


## Read

```javascript
var myArray = ['a', 'b', 'c', 'd']
```

Get length.

```javascript
> myArray.length
4
```

Get element - returns one element.

```javascript
> myArray[index]

> myArray[1]
'b'
```

Slice - returns an array of elements.

```javascript
> myArray.slice(start, end)
[ ... ]
> myArray.slice(1, 3)
[ 'b', 'c' ]
```

Leave out `end`.

```javascript
> myArray.slice(start)

> myArray.slice(1)
[ 'b', 'c', 'd' ]
```

### Get last element

#### Use hard bracket slicing

```javascript
> myArray = ['a', 'b', 'c', 'd']
> myArray[myArray.length - 1]
'd'

> myArray = ['a']
> myArray[myArray.length - 1]
'a'
```

In Python you simply use a negative index `my_list[-1]`, but in JS that gives a `undefined`.

#### Use slice

You can use a negative index here.

```javascript
> myArray = ['a', 'b', 'c', 'd']
> myArray.slice(-1)
[ 'd' ]
```

Warning - that returns an array.

To get a single element, use:

```javascript
> myArray.slice(-1)[0]
'd'
```


## Update

Mutate element.

```javascript
> myArray[index] = value
```

See also [Pop, Push, Shift and Unshift Array Methods in JavaScript](https://alligator.io/js/push-pop-shift-unshift-array-methods/)

### Modify end

**Remove** last element.

```javascript
> myArray.pop();
```

**Insert** element at the end. i.e. append.

```javascript
> myArray.push(obj)
```

### Modify at the start

**Remove** from the beginning. Like Python's `list.pop(0)`. Returns new length.

```javascript
> myArray.shift()
```

**Insert** at the start. Like Python's `list.insert(0, obj)`. Returns new length.

```javascript
> myArray.shift(obj)
```

### Change order

Reverse.

```javascript
> myArray.reverse()
```

Sort. See [Sort](sort.md) for more info, as this will not sort numbers properly.

```javascript
> myArray.sort()
```

### Join arrays

Concatenate arrays.

```javascript
> myArrayA.concat(myArrayB)
```

Join elements using a separator e.g. `', '`. This will return a single string.

```javascript
> myArray.join(sep)
```


## Map, reduce, filter

### Overview

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

### Reduce

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


## Iterate

### Use map to get values

```javascript
const myArray = ['a', 'b', 'c']

myArray.map(value=> value.toUpperCase())
// [ 'A', 'B', 'C' ]
```

### Get value and index

```javascript
const myArray = ['a', 'b', 'c']

myArray.map((value, index) => [index, value.toUpperCase() ])
// [ 
//   [ 0, 'A' ], 
//   [ 1, 'B' ],
//   [ 2, 'C' ]
// ]
```

```javascript
const myArray = ['a', 'b', 'c']

for (const [index, value] of Object.entries(myArray)) {
  console.log(index, value.toUpperCase())
}
// 0 A
// 1 B
// 2 C
```


## Convert iterable to an array

Use the `...` spread operator to make a copy of an array. Or if you need to convert a document selection to an array, so you can use array methods on it like `.map`.

```javascript
const divs = document.getElementsByTagName('div')
// Not available:
//   divs.map
//   divs.forEach

const divsArr = [...divs]

divsArr[0]
// <div class="position-relative js-header-wrapper ">...</div>

divsArr.map(i => i.innerText)
```
