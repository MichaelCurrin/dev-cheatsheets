# Keyword arguments

How to use keyword destructuring in a function.

## Definition

Use destructuring in the _definition_ of the function's parameters.

```javascript
function b({ foo, bar }) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```

That is equivalent to this:

```javascript
function b(myObject) {
  const { foo, bar } = myObject
  console.log('foo', foo)
  console.log('bar', bar)
}
```

## Call with values

Then call the function (either one above) using an associative array.

The order of keys here doesn't matter, which is a strength of this style.

Inline:

```javascript
b( { foo: 1, bar: 2 } )
// foo 1
// bar 2
b( { bar: 2, foo: 1 } )
// foo 1
// bar 2
```

Or, define an object then pass it. No need to use rest operator (i.e. `...`).

```javascript
const x = { foo: 1, bar: 2 }
b(x)
// foo 1
// bar 2
```


## Call without setting all values

If you omit arguments, this is fine, they will be `undefined`.

```javascript
b()
// foo undefined
// bar undefined

b( { bar: 2 } )
// foo undefined
// bar 2
```


## Restriction

A downside of defining a function with keyword arguments is that you can only pass that way.

You cannot pass the arguments using positional arguments.

This will not work. Two positional arguments are passed, where none are expected, and the keyword arguments remain `undefined`.

```javascript
b(1, 2)
// foo undefined
// bar undefined
```
