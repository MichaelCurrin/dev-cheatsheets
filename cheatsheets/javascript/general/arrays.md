# Arrays

See [Array cheatsheet](https://www.shortcutfoo.com/app/dojos/javascript-arrays/cheatsheet) on ShortCutFoo website.

See [map reduce filter][] page for how to apply those to an array.

[map reduce filter]: {{ site.baseurl }}{% link cheatsheets/javascript/general/map-reduce-filter.md %}


## Read an array

```javascript
const myArray = ['a', 'b', 'c', 'd']
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
ARRAY[INDEX]
```

e.g.

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

Use one or two arguments.

```javascript
ARRAY.slice(FROM_INDEX_INCLUSIVE)

ARRAY.slice(FROM_INDEX_INCLUSIVE, TO_INDEX_EXCLUSIVE)
```

One index:

```javascript
const myArray = ['a', 'b', 'c', 'd']

myArray.slice(0)
// [ 'a', 'b', 'c', 'd' ]

myArray.slice(1)
// [ 'b', 'c', 'd' ]

myArray.slice(3)
// [ 'd' ]

// Use a negative index to count from the back.
myArray.slice(-1)
// [ 'd' ]
myArray.slice(-1)
// [ 'c', 'd' ]
```

Warning - that returns an array, even if it just one element.

To get a _single_ element as a scalar and not an array, do this:

```javascript
myArray.slice(-1)[0]
// 'd'
```

Two indexes:

```javascript
const myArray = ['a', 'b', 'c', 'd']

myArray.slice(1, 3)
// [ 'b', 'c' ]

myArray.slice(1,2)
// [ 'b' ]
```


## Update array

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
