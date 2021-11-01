# Standard vs arrow functions


## Standard

- Traditional
    ```javascript
    function double(x) {
      return x * 2
    }
    ```
- Anonymous variation.
    ```javascript
    const double = function (x) {
      return x * 2
    }
    ```


## Arrow

JS now supports "arrow" functions using `=>` syntax.

You could _already_ use `function() {}` syntax to make an anonymous function declared and use immediately, but arrow functions are shorter, and also work differently in some cases.

### Resources

- [Arrow function expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) on MDN docs.
    > An arrow function expression is a compact alternative to a traditional function expression, but is limited and can't be used in all situations.

Differences and limitations:

> - Does not have its own bindings to `this` or `super`, and should _not_ be used as methods.
> - Does not have `new.target` keyword.
> - Not suitable for `call`, `apply` and `bind` methods, which generally rely on establishing a _scope_.
> - Can not be used as _constructors_.
> - Can not use `yield`, within its body.

### Anonymous functions

This is like using `->` in Java or `lambda` in Python.

```javascript
myArray.map(function(x) { return x * 2 })
```

Arrow functions makes this lighter:

```javascript
myArray.map((x) => x * 2)
```

### Named arrow functions

Some people like to use arrow functions to create an anonymous function and then assign it a variable name, as below.

- One line.
    ```javascript
    const greet = () => console.log("Hello");
    const double = x => x * 2; // Dropping brackets is allowed.
    const multiply = (x, y) => x * y;
    ```
- On multiple lines. Be explicit with `return` expression.
    ```javascript
    const double = x => {
      return x * 2
    };

    // Useful if you want to do something before the `return`.
    const multiply = (x, y) => {
      console.log({x, y})

      return x * y;
    }
    ```
- Return an associative array:
    ```javascript
    // Use brackets to make it an expression.
    const double = (x) => ( { myKey: x * 2 } );

    // Or use `return` inside a block.
    const double = (x) => {
        return { myKey: x * 2 }
    };

    // This is NOT valid.
    // const foo = (x) => { myKey: x * 2 };
    ```

### Differences

A major difference is that `this` behaves differently. An arrow function does not come with `this` in scope, at the least when used outside a class.

> Arrow functions do not have their own `this`

```javascript
const myObj = {
  i: 10,
  b: () => console.log(this.i, this), // uses global scope so `this` is `window`
  c: function() {
    // Uses `myObj` as the scope.
    console.log(this.i, this);
  }
}
```

Another difference is that while standard functions are _hoisted_ so you can declare and use them in any order in your code, using arrow functions to make a variable instead actually means you _have_ to declare and call functions in order.

Arrow functions have lighter syntax, but in cases where use more than one line and assign a function to variable, the code is actually _longer_ with arrow functions.

Compare these two:

```diff
-function getCookie(cookieName) {
+const getCookie = (cookieName) => {
```

Arrow functions also makes it harder to separate plain variables from function variables when scanning the code visually, as the `function` keyword is gone.
