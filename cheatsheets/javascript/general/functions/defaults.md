# Defaults

Normally an omitted function value is allowed and just becomes `undefined`, with no error.

You can set a default value after an equals sign.

## Positional arguments

Example:

```javascript
function foo(bar, bazz=true, fizz="abc") {
  console.log( {bar, bazz, fizz})
}
```

No arguments.

```javascript
foo()
// { bar: undefined, bazz: true, fizz: 'abc' }
```

Just one argument and leave the defaults.

```javascript
foo(123)
// { bar: 123, bazz: true, fizz: 'abc' }
```

Set all values.

```javascript
foo(123, false, "def")
// { bar: 123, bazz: false, fizz: 'def' }
```


## Keyword arguments

Here with defaults for two keyword arguments.

```javascript
function b({ foo = 1, bar = 2 }) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```


No arguments - if you _omit_ a value, then `undefined` is used for the object and you will get an error.

```javascript
b()
// TypeError: Cannot read property 'foo' of undefined
```

Use all defaults:

```javascript
b({})
// foo 1
// bar 2
```

Set one or both arguments.

```javascript
b({ foo: 3 })
// foo 3
// bar 2
b({ bar: 4 })
// foo 1
// bar 4
b({ foo: 3, bar: 4 })
// foo 3
// bar 4
```
