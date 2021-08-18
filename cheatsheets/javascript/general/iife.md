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

## Brackets

Enclose a function inside a pair of brackets and then invoke it.

```js
(function () {
    statements
})();
```


## Character

If you prefer, you can use the _not_ operator instead of the pair of brackets. 

```js
!function () {
    statements
}();
```



## Examples

> The function becomes a function expression which is immediately executed. The variable within the expression can not be accessed from outside it.

```javascript
(function () {
    var aName = "Barry";
})();

// Variable aName is not accessible from the outside scope
aName // throws "Uncaught ReferenceError: aName is not defined"
```

> Assigning the IIFE to a variable stores the function's return value, not the function definition itself.

```javascript
const result = (function () {
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

Surround the function in brackets before calling it will work.

```javascript
(function () {
  console.log("Hello")
})()
```

Make sure the previous line ends with a semicolon, otherwise you'll get an error. 

e.g.

```javascript
x = y;
(function () {
    statements
})();

// i.e.
x = y(function () { statements })();
```


Instead of brackets, you can use the _not_ operator at the start. This will treat the function as an expression and return `true` (since the opposite of `!undefined` is `true`).

```javascript
!function () {
  console.log("Hello")
}()
```


This is lighter to read than the brackets pair. The intent is also clearer (brackets are all over a script but exclamation point is rare. Further, this avoids the issue of making sure the previous line has a semicolon. 

This is valid:

```javascript
x = y
!function () {
    statements
}()
```
    

## Scope

An IIFE is useful to put functions and variables in the scope of a module, so they don't fill the global scope in the browser.

If you need access to the window or document, pass those in explicitly.

And you probably want to persist functions or variables outside the IIFE, so attach them to the window object.

```javascript
!function (window) {
  statements
}(window);
```


Using document:

```javascript
!function (window, document) {
  statements
}(window, document);
```

e.g.

```javascript
!function (window) {
  const ABC = 123
  
  function x() {
    // ...
  }
  
  window.x = x
  window.ABC = ABC
}(window);
```
