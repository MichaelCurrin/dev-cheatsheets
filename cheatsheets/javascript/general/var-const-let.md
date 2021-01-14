---
title: var, const and let keywords
description: Variable declarations in modern JS
---

## Keywords

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

You might see a loop like this, using `const` or `let` to declare a variable to each iteration.

```javascript
for (const a of [1, 2, 3]) {
  console.log(a)
}
// 1
// 2
// 3
```

Use in `if` statement. Declare outside the blocks, so the variable persists.

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

Here is a something that `let` does _not_ prevent.

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

If you want to freeze a data structure so it is truly immutable, use `Object.freeze`.

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

