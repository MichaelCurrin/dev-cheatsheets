---
title: Variable declaration
description: |
  `var`, `const` and `let` keywords
---

## Keywords available

- [let keyword](#let-keyword) - scoped variable.
- [const keyword](#const-keyword) - immutable variable.
- [var keyword](#var-keyword) - unlike the others, does _not_ use block-scoping.

See [var is bad][] page for comparisons on `var` and `let` or `const`.

[var is bad]: {{ site.baseurl }}{% link cheatsheets/javascript/general/variable-declaration/var-bad.md %}

### let keyword

Using this approach scopes the variable to a block (such as `if`, `for` or `function`).

A `let` variable can only be accessed in its current scope and all the inner scopes.

```javascript
let foo = "A";

if (true) {
  // Declared only in inner scope.
  let foo = "B";
  console.log(foo)
  // B
}

console.log(foo) // A
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


### var keyword

#### Declare

Initialize as `undefined`.

```javascript
var x;
x
// undefined
```

#### Declare and set

```javascript
var message = "Hello, World!";
```

That is the equivalent of:

```javascript
var message;
message = "Hello, World!";
```

#### Functions

```javascript
function greet() {
  // Use global variable.
  console.log(message)

  // Define function-scoped variable.
  var message = "B";
  console.log(message)
}

// Define and use global variable.
var message = "A";
console.log(message)
// A

// Use function-scoped variable.
greet()
// B

// Use global variable.
console.log(message)
// A
```
