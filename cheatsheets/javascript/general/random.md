# Random

## Number

[Math.random](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random) reference.


## Generate float

Between 0 (inclusive) and 1 (exclusive).

```javascript
> Math.random()
```


## Generate integer up to max

Generate between 0 and a max.

```javascript
> Math.round(Math.random() * 1000)
// 123
```

## Generate random float in range

```javascript
> Math.random() * (max - min) + min;
```

As a function:

```js
function getRandomArbitrary(min, max) {
  return Math.random() * (max - min) + min;
}
```

```js
// 0 -> 10
Math.floor(Math.random() * 11);

// 1 -> 10
Math.floor(Math.random() * 10) + 1;

// 5 -> 20
Math.floor(Math.random() * 16) + 5;

// -10 -> (-2)
Math.floor(Math.random() * 9) - 10;
```

## Get random integer between two values

From the Mozilla docs.

Min inclusive and max exclusive.


```js
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}
```

For above:

> It might be tempting to use  `Math.round()`  to accomplish that, but doing so would cause your random numbers to follow a non-uniform distribution, which may not be acceptable for your needs.

Inclusive for both.

```js
function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
```

From [source](https://stackoverflow.com/questions/4959975/generate-random-number-between-two-numbers-in-javascript).  This is simper than above as it lacks the rounding of min and max.

Inclusive for both.

```javascript
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}
```


## Binary

Use `.substring(start, end)` to drop `0.` at the start.

```javascript
> Math.random().toString(2).substring(2)
// "00011111010001100100011010011111010011001101110001"

```

## Random text

32-bit text.

```javascript
> Math.random().toString(32).substr(2, 4)
"392l"
```

## Get random element in an array

[source](https://stackoverflow.com/questions/5915096/get-random-item-from-javascript-array)

```javascript
var item = myArray[Math.floor(Math.random()*myArray.length)];
```
