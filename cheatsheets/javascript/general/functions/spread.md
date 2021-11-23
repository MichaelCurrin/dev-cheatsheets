# Spread


## Function definition

Handle any number of positional arguments.

Use the **spread operator** in the definition - any positional arguments will be turned into an array.

```javascript
function c(foo, bar, ...bazz) {
  console.log('foo', foo)
  console.log('bar', bar)
  console.log('bazz', bazz)
}
```

```javascript
c(1, 2)
// foo 1
// bar 2
// bazz []

c(1, 2, 3, 4, 5)
// foo 1
// bar 2
// bazz [ 3, 4, 5 ]
```

Notes:

- There can only be _one_ spread/args parameter
- It will always be a list (regardless of whether you pass zero, one or more items to it.
- It must be **last**.

Useful for example when joining a list of values, but with cleaner syntax with cleaner syntax. Here is the traditional approach:

```javascript
function d(foo, bar, bazz) {
  console.log('foo', foo)
  console.log('bar', bar)
  console.log('bazz', bazz)
}
```

You must pass an array, or a variable assigned to an array.

```javascript
c(1, 2, [3, 4, 5])
// 1 2 [ 3, 4, 5 ]
```

If you don't pass an array, you won't get an error, but you'll get unexpected output.

```javascript
> d(1, 2, 3, 4)
1 2 3
```


## Call a function

Turn an array of values into separate positional arguments.

```javascript
function a(foo, bar, bazz) {
  console.log('foo', foo)
  console.log('bar', bar)
  console.log('bazz', bazz)
}

const x = [1, 'foo', true]
a(...x)
```
