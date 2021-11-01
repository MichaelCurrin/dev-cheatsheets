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

### List style

The weakness if that is you change order of the parameters or add a parameter between existing parameters, then calls to the function will behave unexpectedly.

```javascript
function a(foo, bar) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```

Call it using a list of arguments.

```javascript
a(1, 2)
// foo 1
// bar 2
```

Order matters. Leaving out a parameter leaves it as undefined. So you need to pass a value in a position as `undefined` to skip it.

```javascript
a()
// foo undefined
// bar undefined

a(1)
// foo 1
// bar undefined

a(undefined, 2)
// foo undefined
// bar 2
```

If you define positional arguments, you cannot pass key-value pairs instead.

You can pass associative array if you want, but it will be used for the value of the first parameter, it will _not_ be split up, and `undefined` will be implied for the second parameter.

```javascript
a( { foo: 1, bar: 2 } )
// foo { foo: 1, bar: 2 }
// bar undefined
```


### Keyword arg style

How to pass key-value pairs to a function.

Use destructuring in the _definition_ of the function's parameters.

```javascript
function b({ foo, bar }) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```

Then call it using an associative array. The order doesn't matter, which is a strength of this style.

Inline:

```javascript
b( { foo: 1, bar: 2 } )
// foo 1
// bar 2
b( { bar: 2, foo: 1 } )
// foo 1
// bar 2
```

Define an object then pass it. No need to use rest operator (i.e. `...`).

```javascript
const x = { foo: 1, bar: 2 }
b(x)
// foo 1
// bar 2
```

A downside of defining a function with keyword arguments is that you cannot pass the arguments using position arguments.

i.e. This will not work. Two positional arguments are passed, where none are expected, and the keyword arguments remain `undefined`.

```javascript
b(1, 2)
// foo undefined
// bar undefined
```

If you omit arguments, this is fine, they will be `undefined`.

```javascript
b()
// foo undefined
// bar undefined

b( { bar: 2 } )
// foo undefined
// bar 2
```

### Mixed

You can define positional arguments followed by keyword arguments.

```javascript
function c(bazz, { foo, bar }) {
  console.log('bazz', bazz)
  console.log('foo', foo)
  console.log('bar', bar)
}

c(1, {foo: 2, bar: 3})
// bazz 1
// foo 2
// bar 3

// OR
const x = { foo: 2, bar: 3 }
c(1, x)
// bazz 1
// foo 2
// bar 3
```

Note if you want to _only_ pass keyword parameters, you need to make each of the positional arguments `undefined`.

```javascript
c(undefined, { foo: 2, bar: 3 })
// bazz undefined
// foo 2
// bar 3
```

Otherwise you will get avoid an error.

```javascript
c({ foo: 2, bar: 3 })
// TypeError: Cannot destructure property 'foo' of 'undefined' as it is undefined.
```


## Standard vs arrow functions

JS now supports "arrow" functions using `=>` syntax.

You could _already_ use `function(){}` syntax to make an anonymous function declared and use immediately, but arrow functions are shorter, and also work differently in some cases.

```javascript
myArray.map(function(x) { return x * 2 })
```

Arrow functions makes this lighter:

```javascript
myArray.map((x) => x * 2)
```

Compare with `->` in Java.

Some people like to use arrow functions to create an anonymous function and then assign it a variable name.

- Traditional
    ```javascript
    function foo(x) {
      return x * 2
    }
    ```
- Anonymous variation.
    ```javascript
    const foo = function (x) {
      return x * 2
    }
    ```
- Arrow function.
    ```javascript
    // One line.
    const foo = (x) => x * 2;

    // Or multi-line.
    const foo = (x) => {
      return x * 2
    };

    // Returning an object - use brackets.
    const foo = (x) => ( { myKey: x * 2} );
    ```

A major difference is that `this` behaves differently. An arrow function does not come with `this` in scope, at the least when used outside a class

Another difference is that while standard functions are _hoisted_ so you can declare and use them in any order in your code, using arrow functions to make a variable instead actually means you _have_ to declare and call functions in order.

Arrow functions have lighter syntax, but in cases where use more than one line and assign a function to variable, the code is actually _longer_ with arrow functions.

Compare these two:

```diff
-function getCookie(cookieName) {
+const getCookie = (cookieName) => {
```

Arrow functions also makes it harder to separate plain variables from function variables when scanning the code visually, as the `function` keyword is gone.

Methods on classes can also be set like this:

```javascript
class foo () {
  // Standard.
  fizz(x) {
    return x * 2
  }

  // Arrow.
  fizz(x) => x * 2

  // Verbose - assign a function to key. Using function or arrow.
  fizz: function (x) {
    return x * 2
  }
  // OR
  fizz: (x) => x * 2
}
```


## Default values

Normally an omitted function value is allowed and just becomes `undefined`, with no error.

You can set a default value after an equals sign.

Example:

```javascript
function foo(bar, bazz=true, fizz="abc") {
  console.log( {bar, bazz, fizz})
}

// No arguments.
foo()
{ bar: undefined, bazz: true, fizz: 'abc' }

// Just one argument and leave the defaults.
foo(123)
// { bar: 123, bazz: true, fizz: 'abc' }

// Set all values.
foo(123, false, "def")
// { bar: 123, bazz: false, fizz: 'def' }
```
