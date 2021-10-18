# Arrays

See [Array cheatsheet](https://www.shortcutfoo.com/app/dojos/javascript-arrays/cheatsheet) on ShortCutFoo website.

See [map reduce filter][] page for how to apply those to an array.

[map reduce filter]: {{ site.baseurl }}{% link cheatsheets/javascript/general/map-reduce-filter.md %}


## View

```javascript
const myArray = ['a', 'b', 'c', 'd']
```

### Length

```javascript
myArray.length
// 4
```

### Get elemeny by index

```javascript
myArray[index]
```

e.g.

```javascript
myArray[1]
// 'b'

myArray[4] // there is not 5th element
// undefined
```

### Slice

See also [splice](#splice-an-array) method.

Get array of elements between a range. If you omit the second argument, it is implied as the lenght of the array (i.e. up to the end of the array).

```javascript
myArray.slice(START_INDEX)

myArray.slice(START_INDEX, END_INDEX)
```

e.g.

Start from a given index and go to the end.  

```javascript
myArray.slice(1)
// [ 'b', 'c', 'd' ]
```

Start at an index (inclusive) and go up to an index (exclusive).

```javascript
myArray.slice(0, 1)
// [ 'a' ]
myArray.slice(0, 2)
// [ 'a', 'b' ]

myArray.slice(1, 2)
// ['b']

myArray.slice(1, 3)
// [ 'b', 'c' ]
```

Using negative index:

```javascript
myArray.slice(-1) // last
// [ 'd' ]

myArray.slice(-2) // last 2
// [ 'd', 'e' ]

myArray.slice(-3, -1) // 3rd last and 2nd last
//[ 'b', 'c' ]
```

### Get last element as a scalar

Instead of getting as an array, we want to get as scalar (e.g. string or number).

#### Use hard bracket slicing

```javascript
ARRAY[INDEX]
```

e.g.

```javascript
myArray = ['a', 'b', 'c', 'd']
myArray[myArray.length - 1]
// 'd'

myArray = ['a']
myArray[myArray.length - 1]
// 'a'
```

**Warning** In Python, you simply use a negative index and hard brackets like `my_list[-1]`. But in JS, that doesn't work.

```javascript
myArray[-1]
// undefined
```

### Use slice method

A slice is returned as an array. So to get the last element as a scalar (like a string), then use need to get the element from the array.

```javascript
myArray.slice(-1)[0]
// 'd'
```


## Update

Add, remove and update elements in an array.

### Assign value

Basis syntax for setting a value:

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

### Splice an array

See also [slice](#slice-method) method that only _reads_ elements from a range.

The `splice` reads a range too, but also **deletes** the items from the original array.

```javascript
const oldArray = ['a', 'b', 'c', 'd']
// [ 'a', 'b', 'c', 'd' ]

const newArray = oldArray.splice(1, 2)
// [ 'b', 'c' ]

// Items have been removed.
oldArray
// [ 'a', 'd' ]
```


## Iterate over an array

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
