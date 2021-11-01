# Standard vs arrow functions

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
