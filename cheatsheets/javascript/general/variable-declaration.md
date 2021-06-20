---
title: Variable declaration
description: `var`, `const` and `let` keywords
---

## Keywords avaible

### var keyword

Avoid using this modern code. It is less safe / predictable. To support older browsers,  you can use transpilers to compile your code with `let` and `const` to use `var`.

```javascript
function greet() {
  var message = "B";
  console.log(message)
  // B
}

var message = "A";
greet()
console.log(message)
// A
```

### let keyword

This makes a variable "block-scoped".

Using this approach scopes the variable to a block (such as `if`, `for` or `function`). A `let` variable can only be accessed in its current scope and below.

```javascript
var foo = "A";

if (true) {
  // Redeclared in outer scope, without error.  
  var foo = "B"; 
}
    
console.log(foo) // "B"
```

Using `let`.

```javascript
let foo = "A";

if (true) {
  // Declared only in inner scope.
  let foo = "B"; 
  console.log(foo)
  // B
}
    
console.log(foo) // "A"
```

You might see a loop like this, using `const` or `let` to declare a variable in the scope of _each_ iteration.

```javascript
for (const a of [1, 2, 3]) {
  console.log(a)
}
// 1
// 2
// 3
```

Here is why `var` is a bad idea for that.

If you use `var`, then the variable gets gets added to the global scope with the `var` keyword, then the reference to the single variable is used for each function. But when you use `let` or `const`, the variable gets added to the block scope and set in the function, so when the variable is printed after a delay then the scoped variable is used.

```javascript
for (var i of [1, 2, 3]) {
  setTimeout(() => console.log(i), 1000)
}
// 3
// 3
// 3

for (let i of [1, 2, 3]) {
  setTimeout(() => console.log(i), 1000)
}
// 1
// 2
// 3
```

Use `let` in an `if` statement. Declare outside the blocks, so the variable persists.

```javascript
let x

if (true) {
  x = 'yes'
} else {
  x = 'no'
}

console.log(x)
// yes
```

Using `let` is also useful in more complex logic around loops, to force a variable to be declared multiple times.

Here is a something that still happens even with `let`. The `x` reference is used as pointer and changing the value of the `x` object changes all the items in an array pointing to `x`.

```javascript
let x = {}
let y = [1, 2, 3]

let z = y.map(i => x)
// [{}, {}, {}]

x.foo = 'bar'
// [{foo: 'bar'}, {foo: 'bar'}, {foo: 'bar'}
```

### const keyword

A `const` variable cannot be updated or re-declared.

```javascript
const x = 1
x = 2
// Uncaught TypeError: Assignment to constant variable.
```

Note it does _not_ freeze a data structure like an array or map. It just prevents reassignment.

```javascript
const y = []

y = [ 123 ]
// Uncaught TypeError: Assignment to constant variable.

y.push(1)
y
// [ 1 ]
```

If you want to freeze a data structure so it is truly immutable, use [Object.freeze](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze).

```javascript
const y = [ 1 ]

Object.freeze(y)
y
// [ 1 ]

y.push(2)
// Uncaught TypeError: Cannot add property 1, object is not extensible
//    at Array.push (<anonymous>)
```

It is also block-scoped. So if you declare `const` variable inside an `if` statement, you can't use it outside it.


## Initialization comparison

### var keyword

```javascript
var x;
x = 123;

// Or simply
var x = 123;
```

Repeat use of `var` does not cause an error.

```javascript
var x;
var x;
```

### let keyword

```javascript
let y;
y = 123;

let z = 123;
```

Note that `let` can only be used once for a variable.

```javascript
let y;
let y;
// Uncaught SyntaxError: Identifier 'y' has already been declared
```

### const keyword

```javascript
const y = 123;
```

```javascript
const y;
// Uncaught SyntaxError: Missing initializer in const declaration
```


## Reassignment comparison

Reassignment is allowed for `let` and `var`.

```javascript
var x = 123;
x = 10
x = 'a'
```

But not for `const` variables.

```javascript
const x = 123
// Uncaught TypeError: Assignment to constant variable.
```


## Scope

Here, the variable exists only in the block and not available outside of it.

```javascript
if (true) {
  let x = 1
  console.log(x)
}
console.log(x)
```

```
1
ReferenceError: x is not defined
```

You can use block scope without using an `if` statement or `for` loop.

```javascript
{
  let x = 1
  console.log(x)
}
console.log(x)
```

```
1
ReferenceError: x is not defined
```
