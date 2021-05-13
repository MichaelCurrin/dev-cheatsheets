---
title: IIFE
description: Immediately Invoked Function Expression
---


An _IIFE_ is function that executes immediately after it is defined (usually anonymously defined and not called again).

The advantage is that it keeps all its objects limited to its scope, which avoids polluting or overwriting variables or functions in the global namespace. This is useful in the browser, to avoid conflicting with other modules.


## Resources

- [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) doc on Mozilla site.
- [IIFE](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression) on Wikipedia.


## Syntax

```js
(function () {
    statements
})();
```

Or

```js
!function () {
    statements
}();
```


## Examples

> The function becomes a function expression which is immediately executed. The variable within the expression can not be accessed from outside it.

```js
(function () {
    var aName = "Barry";
})();

// Variable aName is not accessible from the outside scope
aName // throws "Uncaught ReferenceError: aName is not defined"
```

> Assigning the IIFE to a variable stores the function's return value, not the function definition itself.

```js
var result = (function () {
    var name = "Barry";
    return name;
})();

// Immediately creates the output:
result; // "Barry">
```


## Comparison

### Standard

- Plain function
    ```js
    function () {
      console.log("Hello")
    }
    ```
- Adding a call at the end will give a **syntax error**.
    ```js
    function () {
      console.log("Hello")
    }()
    ```
    
### IIFE

- Surround the function in brackets before calling it will work.
    ```js
    (function () {
      console.log("Hello")
    })()
    ```
- Or instead of brackets, use the not `!` operator at the start. This will treat the function as an expression and return `true` (since the opposite of `!undefined` is `true`).
    ```js
    !function () {
      console.log("Hello")
    }()
    ```

