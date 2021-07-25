# var is bad

## What to use

Avoid using the old `var` style. It is less safe / predictable. Always use `let` or `const`.

To support older browsers that don't understand `let` and `const`, you can use those keywords and a transpiler to compile your code with `let` and `const` to use `var`.

## Why avoid var

Using `var` declaration is available to the outer scope and encourages bad practices.

While the `let` and `const` are only set for their current scope and below and will give an error if you re-declare a variable with `let` or const`.

### Re-declare

This valid.

```javascript
var x;
var x;
```

This is not valid and so helps you catch bad code.

```javascript
let x;
let x;
// Uncaught SyntaxError: Identifier 'x' has already been declared
```


#### Hoisting

Unlike `let` and `const`, for `var`, a variable is "hoisted" to the top of the function scope. i.e. the `var` declarations of loaded first and then the function body.

Note that this code surpringly will **not** throw an error that `message` is undefined.

```javascript
function greet() {
    console.log(message)
    var message = "Hello, World!";
    console.log(message)
}

greet()
```

Equivalent code:

```javascript
function greet() {
    var message;
    console.log(message)
    message = "Hello, World!";
    console.log(message)
}

greet()
```

The variable is still not defined in the global scope and you will get an error.

```javascript
console.log(message)
// Uncaught ReferenceError: message is not defined

// OR
function greet() {
    console.log(message)
    // Uncaught ReferenceError: message is not defined
}
```

### Override outer scope

Here is an example of why `var` is not recommended. Here, two `var` declarations are used but they are for the same variable and scope.

```javascript
var foo = "A";

if (true) {
  // Re-declared in the outer scope, overriding `foo` everywhere.
  var foo = "B";
  console.log(foo)
  // B
}

// The variable is still B.
console.log(foo) // B
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

console.log(foo) // A
```

### Functions with context

See [Context][] page.

[Context]: {{ site.baseurl }}{% link cheatsheets/javascript/general/variable-declaration/context.md %}
