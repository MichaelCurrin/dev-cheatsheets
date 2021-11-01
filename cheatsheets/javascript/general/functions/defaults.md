# Defaults

Normally an omitted function value is allowed and just becomes `undefined`, with no error.

You can set a default value after an equals sign.

Example:

```javascript
function foo(bar, bazz=true, fizz="abc") {
  console.log( {bar, bazz, fizz})
}

// No arguments.
foo()
// { bar: undefined, bazz: true, fizz: 'abc' }

// Just one argument and leave the defaults.
foo(123)
// { bar: 123, bazz: true, fizz: 'abc' }

// Set all values.
foo(123, false, "def")
// { bar: 123, bazz: false, fizz: 'def' }
```
