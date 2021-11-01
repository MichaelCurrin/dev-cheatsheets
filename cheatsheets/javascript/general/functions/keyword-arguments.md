# Keyword arguments

How to pass key-value pairs to a function.

Use destructuring in the _definition_ of the function's parameters.

```javascript
function b({ foo, bar }) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```

Then call it using an associative array. The order doesn't matter, which is a strength of this style.

Inline:

```javascript
b( { foo: 1, bar: 2 } )
// foo 1
// bar 2
b( { bar: 2, foo: 1 } )
// foo 1
// bar 2
```

Define an object then pass it. No need to use rest operator (i.e. `...`).

```javascript
const x = { foo: 1, bar: 2 }
b(x)
// foo 1
// bar 2
```

A downside of defining a function with keyword arguments is that you cannot pass the arguments using position arguments.

i.e. This will not work. Two positional arguments are passed, where none are expected, and the keyword arguments remain `undefined`.

```javascript
b(1, 2)
// foo undefined
// bar undefined
```

If you omit arguments, this is fine, they will be `undefined`.

```javascript
b()
// foo undefined
// bar undefined

b( { bar: 2 } )
// foo undefined
// bar 2
```
