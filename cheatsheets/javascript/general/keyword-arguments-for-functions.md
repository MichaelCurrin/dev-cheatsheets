# Keyword arguments for functions
> How to pass key-value pairs to a function


## Keyword arg style

Use destructuring in the definition of the function's parameters.

```javascript
function b({foo, bar}) {
  console.log(foo, bar)
}
```

Call it using an associative array. The order doesn't matter.

```javascript
> b({foo: 1, bar:2})
1 2
> b({bar: 2, foo: 1})
1 2
```

Omit arguments.

```javascript
> b()
undefined undefined

> b({bar:2})
undefined 2
```


## List style

The weakness if that is you change order of the parameters or add a parameter between existing parameters, then calls to the function will behave unexpectedly.

```javascript
function a(foo, bar) {
  console.log(foo, bar)
}
```

Call it using a list of arguments.

```javascript
> a(1, 2)
1 2
```

Order matters. Leaving out a parameter leaves it as undefined. So you need to pass a value in a position as `undefined` to skip it.

```javascript
> a()
undefined undefined

> a(1)
1 undefined

> a(undefined, 2)
undefined 2
```

Warning - if you try and pass key-value pairs, you will only pass an associative array to the first parameter, which is not what we want.

```javascript
> a({foo: 1, bar:2})
{ foo: 1, bar: 2 } undefined
```
