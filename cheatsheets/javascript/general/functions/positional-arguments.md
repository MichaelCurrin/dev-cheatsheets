# Positional arguments

aka list style

The weakness if that is you change order of the parameters or add a parameter between existing parameters, then calls to the function will behave unexpectedly.

```javascript
function a(foo, bar) {
  console.log('foo', foo)
  console.log('bar', bar)
}
```

Call it using a list of arguments.

```javascript
a(1, 2)
// foo 1
// bar 2
```

Order matters. Leaving out a parameter leaves it as undefined. So you need to pass a value in a position as `undefined` to skip it.

```javascript
a()
// foo undefined
// bar undefined

a(1)
// foo 1
// bar undefined

a(undefined, 2)
// foo undefined
// bar 2
```

If you define positional arguments, you cannot pass key-value pairs instead.

You can pass associative array if you want, but it will be used for the value of the first parameter, it will _not_ be split up, and `undefined` will be implied for the second parameter.

```javascript
a( { foo: 1, bar: 2 } )
// foo { foo: 1, bar: 2 }
// bar undefined
```
