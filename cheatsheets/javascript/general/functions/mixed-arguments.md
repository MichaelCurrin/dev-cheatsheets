# Mixed arguments

You can define positional arguments followed by keyword arguments.

```javascript
function c(bazz, { foo, bar }) {
  console.log('bazz', bazz)
  console.log('foo', foo)
  console.log('bar', bar)
}

c(1, {foo: 2, bar: 3})
// bazz 1
// foo 2
// bar 3

// OR
const x = { foo: 2, bar: 3 }
c(1, x)
// bazz 1
// foo 2
// bar 3
```

Note if you want to _only_ pass keyword parameters, you need to make each of the positional arguments `undefined`.

```javascript
c(undefined, { foo: 2, bar: 3 })
// bazz undefined
// foo 2
// bar 3
```

Otherwise you will get avoid an error.

```javascript
c({ foo: 2, bar: 3 })
// TypeError: Cannot destructure property 'foo' of 'undefined' as it is undefined.
```
