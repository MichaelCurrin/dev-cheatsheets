# Strict mode

## Resources

- [Strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [Transitioning to strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode/Transitioning_to_strict_mode) - what you need to know before turning strict mode on.


## Approaches

### Set at the top of a script

```javascript
'use strict';

var v = "Hi! I'm a strict mode script!";
```

### Set in a function

Catch `x` as not set.

```javacsript
function f(x) {
  'use strict';
  var a = 12;
  b = a + x * 35; // error!
}
f(42);
```

### ES modules

A module in ES6 uses strict mode by default.

```javascript
function foo() {
}

export default foo;
```
