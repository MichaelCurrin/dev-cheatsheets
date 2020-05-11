# JavaScript

See also:

- [JavaScript](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/sScripting_%20languages/JavaScript/README.md) guide on my [MichaelCurrin/learn-to-code](https://github.com/MichaelCurrin/learn-to-code/) repo.
- [NPM cheatsheet](package_managers/npm.md) in this repo.


## Text

```javascript
> myText.toUpperCase()
```

### Slicing

```javascript
> myText.substr(first, length)

> myText.substring(start, end)
```

## Arrays

- [Array cheatsheet](https://www.shortcutfoo.com/app/dojos/javascript-arrays/cheatsheet)

### Read

Get length.

```javascript
> myArray.length
```


Get element.

```javascript
> myArray[index]
```

Slice.

```javascript
> myArray.slice(start, end) 
```

### Update

Mutate element.

```javascript
> myArray[index] = value
```


See also [Pop, Push, Shift and Unshift Array Methods in JavaScript](https://alligator.io/js/push-pop-shift-unshift-array-methods/)


#### Modify end

**Remove** last element.

```javascript
> myArray.pop();
```

**Insert** element at the end. i.e. append.

```javascript
> myArray.push(obj)
```

#### Modify at the start

**Remove** from the beginning. Like Python's `list.pop(0)`. Returns new length.

```javascript
> myArray.shift()
```

**Insert** at the start. Like Python's `list.insert(0, obj)`. Returns new length.

```javascript
> myArray.shift(obj)
```

#### Change order
Reverse.

```javascript
> myArray.reverse()
```

Sort.

```javascript
> myArray.sort()
```

#### Join arrays

Concatenate arrays.

```javascript
> myArrayA.concat(myArrayB)
```

Join elements using a separator e.g. `', '`. This will return a single string.

```javascript
> myArray.join(sep)
```

### Map, reduce, filter

Return a new object after applying transformation. The old object is no affected, unless you reassign over the same name.

Examples:

```javascript
myArray.map((x) => x*2)
```

```javascript
myArray.reduce((x, y) => x + y)
```

```javascript
myArray.filter((x) => x > 2)
```

## Random

### Number

[Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) reference.

### Generate float

Between 0 (inclusive) and 1 (exclusive).

```javascript
> Math.random()
```

### Ge
Generate between 1 and 999. 

```javascript
> Math.round(Math.random() * 1000)
// 123
```


### Get random integer in a range

[source](https://stackoverflow.com/questions/4959975/generate-random-number-between-two-numbers-in-javascript)

```javascript
// min -> max (inclusive of both)
function randomIntFromInterval(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

// 0 -> 10
Math.floor(Math.random() * 11);

// 1 -> 10
Math.floor(Math.random() * 10) + 1;

// 5 -> 20
Math.floor(Math.random() * 16) + 5;

// -10 -> (-2)
Math.floor(Math.random() * 9) - 10;
```


### Binary

Use `.substring(start, end)` to drop `0.` at the start.

```javascript
> Math.random().toString(2).substring(2)
// "00011111010001100100011010011111010011001101110001"

```

### Random text

32-bit text.

```javascript
> Math.random().toString(32).substr(2, 4)
"392l"
```

### Get random element in an array

[source](https://stackoverflow.com/questions/5915096/get-random-item-from-javascript-array)

```javascript
var item = myArray[Math.floor(Math.random()*myArray.length)];
```


## Browser

### Selection

```javascript
document.getElementById('myid');
document.getElementsByClassName('my-class');
document.getElementsByName('my-name');
document.getElementsByTagName('div');

document.querySelector('div.my-class');
document.querySelectorAll('div.my-class');
```

### Edit

```javascript
var el = document.getElementById('my-id');

el.getAttribute('src',);
el.setAttribute('src', 'http://example.com');

// classList is now widely supported https://caniuse.com/#search=classList
if (el.classList.contains('my-class')) {
    el.classList.remove('my-class');
}
```

### Create list

```html
<select id='my-id'>
</select>
```

```javascript
var selectInput = document.getElementById('my-id');
for (var value of ['a', 'b', 'c']) {
    var option = document.createElement('option');
    option.setAttribute('value', value);
    option.text = value;
    selectInput.appendChild(option);
}
```


## SVG

### Change color

#### Inline SVG

[source](https://stackoverflow.com/questions/9872947/changing-svg-image-color-with-javascript)

```html
<svg id="svg1" xmlns="http://www.w3.org/2000/svg" style="width: 3.5in; height: 1in">
  <circle id="circle1" r="30" cx="34" cy="34"
    style="fill: red; stroke: blue; stroke-width: 2"/>
</svg>
<!-- CSS should be used here instead of editing style -->
<button onclick="circle1.style.fill='yellow';">Click to change to yellow</button>
```

### Linked SVG

Note: styling on the object element does not affect the value inside. An iframe can be used too.

```html
<object id="my-svg" data="image.svg" type="image/svg+xml"></object>
```

```javascript
let object = document.getElementById('my-svg');
svg = object.getSVGDocument();
svg.getElementsByTagName('g')[0].setAttribute('fill', '#fff');
```


## Sort

### Text

```javascript
var foo = ['b', 'a', 'c', 'A'];
foo.sort();

foo.reverse();
```

### Numeric

```javascript
var points = [40, 100, 1, 5, 25, 10];
// Ascending.
points.sort(function (a, b) {return a - b});
// Descending.
points.sort(function(a, b){return b - a});
// Random order.
points.sort(function(a, b){return 0.5 - Math.random()});

```

## Data transformation

### Unpack dictionary

```javascript
var KEY_VALUE_PAIRS = {
    foo: 'A',
    bar: 'B',
    baz: 'C'
}

for (const [ key, value ] of Object.entries(KEY_VALUE_PAIRS)) {
        console.log(key, value)
    }
}
```

### Invert dictionary

```javascript
var KEY_VALUE_PAIRS = {
    foo: 'A',
    bar: 'B',
    baz: 'C'
}

let output = {};
for (const [ key, value ] of Object.entries(KEY_VALUE_PAIRS)) {
        output[value] = key;
    }
}
```

## React / JSX

### Comments

[source](https://wesbos.com/react-jsx-comments/)

```
{/* A JSX comment */}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzU1NjcwMDMwXX0=
-->