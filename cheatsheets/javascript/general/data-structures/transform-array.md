---
title: Transform array
description: Use Functional Programming style to apply a transformation to an array
---


## map method

Using the `.map` method on an array.

### Use an anonymous function

Use an function without a name for short logic of just a few lines and if you do not need to reuse the function.

General format:

```javascript
ARRAY.map(ITEM => EXPRESSION)

ARRAY.map(function(ITEM) { return EXPRESSION })
```

Example:

```javascript
const letters = ["a", "b", "c"]

const upper = letters.map(x => x.toUpperCase())

upper
// [ "A", "B", "C" ]
```

```javascript
const numbers = [1, 2, 3]
const squares = numbers.map(x => x**2)
// [1, 4, 9]
```

Without declaring a variable first.

```javascript
const squares = [1, 2, 3].map(x => x**2)
// [1, 4, 9]
```

### Use a named function

Define a function first and then use it in your `.map` transformation.

General format:

```javascript
ARRAY.map(FUNCTION)
```

Example:

```javascript
function upper(item) {
  return item.toUpperCase()
}

const letters = ["a", "b", "c"]

const upper = letters.map(upper)

upper
// [ "A", "B", "C" ]
```

This is equivalent to the more verbose form:

```javascript
const upper = letters.map(x => upper(x))
```

### Promises

Warning - when using `.then` promise chains, it does not work to just pass a function. you need to wrap that in a function.

```javascript
Promise.resolve([ 'a', 'b', 'c' ] )
  .then(x => x.upper())
```


## Comparison with Functional Programming

In formal Functional Programming languages like with Haskell,

- You would use `map` as a function. Functional Progamming has no methods.
- You would use two variable names instead of overwriting the same one, because all objects would be immutable.

JavaScript is not strict here.

- You apply `.map` as a method.
- You could decide to update an array in place.

Note that `const` keyword prevents reassignment (using `=` sign). This freezes strings and numbers, but does not freeze an array.

This is valid JS though, updating an object in place.

```javascript
const myArray = [1, 2, 3])

myArray.push(4)
```

But `const` is still good at stopping your from doing this, because you will get an error that a `const` variable can't be reassigned.

```javascript
const myArray = [1, 2, 3]

myArray = myArray.map(myFunction)
```
