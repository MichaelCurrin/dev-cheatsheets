# Functions


## Handle any number of arguments

Use the **spread operator** to allow the function to be called with any number of args.

```javascript
function c(foo, bar, ...bazz) {
  console.log( foo, bar, bazz )
}
```

```javascript
> c(1, 2)
1 2 []

> c(1, 2, 3, 4, 5)
1 2 [ 3, 4, 5 ]
```

- There can only be one spread/args parameter
- It will always be a list (regardless of whether you pass zero, one or more items to it.
- Tt must be **last**.


Useful for example when joining a list of values, but with cleaner syntax with cleaner syntax. Here is the traditional approach:
 
```javascript
function d(foo, bar, bazz) {
  console.log( foo, bar, bazz )
}
```

You must pass an array, or a variable assigned to an array.

```javascript
> c(1, 2, [3, 4, 5])
1 2 [ 3, 4, 5 ]
```

If you don't pass an array, you won't get an error, but you'll get unexpected output.

```javascript
> d(1, 2, 3, 4)
1 2 3
```


## How to pass arguments to functions

### Keyword arg style

How to pass key-value pairs to a function.

Use destructuring in the definition of the function's parameters.

```javascript
function b({ foo, bar }) {
  console.log(foo, bar)
}
```

Call it using an associative array, either inline or as an object reference. The order doesn't matter.

```javascript
> b({ foo: 1, bar: 2 })
1 2
> b({ bar: 2, foo: 1 })
1 2
> const x = { foo: 1, bar: 2 }
> b(x)
1 2
```

If you omit arguments, they are `undefined`.

```javascript
> b()
undefined undefined

> b({bar:2})
undefined 2
```

### List style

The weakness if that is you change order of the parameters or add a parameter between existing parameters, then calls to the function will behave unexpectedly.

```javascript
function a(foo, bar) {
  console.log(foo, bar)
}
```

Call it using a list of arguments.

```javascript
> a(1, 2)
1 2
```

Order matters. Leaving out a parameter leaves it as undefined. So you need to pass a value in a position as `undefined` to skip it.

```javascript
> a()
undefined undefined

> a(1)
1 undefined

> a(undefined, 2)
undefined 2
```

Warning - if you try and pass key-value pairs, you will only pass an associative array to the first parameter, which is not what we want.

```javascript
> a( { foo: 1, bar: 2 } )
{ foo: 1, bar: 2 } undefined
```

### Mixed

```javascript
function c(bazz, { foo, bar }) {
  console.log(bazz, foo, bar)
}

c(1, {foo: 2, bar: 3})
// 1 2 3
```


## Standard vs arrow functions 

JS now supports arrow functions.

You could already use `function()` syntax to make an anonymous function declared and use immediately.

```js
myArray.map(function(x) { return x * 2 })
```
Arrow functions makes this lighter:

```js
myArray.map(function(x) { return x * 2 })
```

Some people like to use arrow functions with a variable name. Though it makes it harder to separate plain variables from function variables.

```js
// Traditional 
function foo(x) {   
  return x * 2
}

// Anonymous variation.
const foo = function (x) {   
  return x * 2
}
```

```js
// Arrow function.
const foo = (x) => x * 2;

// Or multi-line.
const foo = (x) => {
  return x * 2
};
```

A major difference is that `this` behaves differently. An arrow function does not come with `this` in scope, at the least when used outside a class

Another difference is that while standard functions are _hoisted_ so you can declare and use them in any order in your code, using arrow functions to make a variable instead actually means you _have_ to declare and call functions in order.

But the code is actually _longer_ with arrow functions, because we have to use `const`.

```
                               |  |
function getCookie(cookieName) {   
const getCookie = (cookieName) => {
```

Methods on classes can also be set like this:

```js
class foo () {
  fizz(x) {
    return x * 2
  }

  fizz(x) => x * 2

  // More verbose. Using function or arrow.
  fizz: function(x) {
    return x * 2
  }
}
```
